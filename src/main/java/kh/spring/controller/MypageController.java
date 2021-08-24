package kh.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.config.SHA256;
import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointAccountDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.SnsDTO;
import kh.spring.dto.SnsFilesDTO;
import kh.spring.service.MypageService;
import kh.spring.service.PersonService;
import kh.spring.service.PointService;
import kh.spring.service.SellTalentService;
import kh.spring.service.SnsCommentService;
import kh.spring.service.SnsFilesService;
import kh.spring.service.SnsService;

@Controller
@RequestMapping("/my")
public class MypageController {

	@Autowired
	private MypageService service; // 마이페이지 서비스
	@Autowired
	private PersonService pservice; // 회원 서비스
	@Autowired
	private  PointService PointService; // 포인트 서비스
	@Autowired
	private SnsService sservice; // sns 서비스
	@Autowired
	private SellTalentService STService;//재능판매 
	@Autowired
	private SnsCommentService scservice; // sns댓글 서비스
	@Autowired
	private SnsFilesService fservice; // sns파일 서비스
	@Autowired
	private ProfileFilesDAO pffd; // 프로필 서비스
	@Autowired
	private HttpSession session; // 세션

	// 마이페이지 정보 출력
	@RequestMapping(value="/mypageProc", produces="text/html;charset=utf8")
	public String mypageProc(Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO dto = service.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pdto = service.profileSelect(sessionID); // 내 프사 출력
		int checkAmount =PointService.checkAmount(sessionID);
		//		int pointAmount =PointService.amount(sessionID);//잔고금액

		session.setAttribute("myInfo", dto); // 내 정보
		model.addAttribute("profile",pdto); // 내 프사
		model.addAttribute("point",checkAmount); // 내 포인트

		return "mypage/mypage";
	}

	//마이페이지 확인&수정화면
	@RequestMapping("/modify")
	public String modify(Model model) {
		String id = (String)session.getAttribute("loginID");
		List<PersonDTO>list = service.modify(id);
		model.addAttribute("list", list);
		return "mypage/modify";
	}

	//정보수정
	@RequestMapping("/modifyProc")
	public String modifyProc(PersonDTO dto) {
		String shaPass = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPass);
		service.modifyProc(dto);
		return "redirect:/my/mypageProc";
	}

	// 프로필 팝업 띄우기
	@RequestMapping("/picture_change")
	public String picture_change(String origin, Model model) {
		System.out.println("jsp에서 갖고온 파일 이름 : " + origin);
		String img_path = origin;

		model.addAttribute("origin", img_path); // 현재 배치되어있는 내 프사를 origin에 담아서
		return "mypage/profile";
	}

	// 프로필 사진 업데이트
	@RequestMapping("/profileUpdate")
	public String profileUpdate(String profile, MultipartFile after_profile, Model model) {
		System.out.println("받은 파일 : " + profile + " 받은 파일 이름 : " + after_profile);

		String parents = (String)session.getAttribute("loginID"); // 로그인 세션 받아서 프로필의 부모시퀀스에 넣기
		String realPath = session.getServletContext().getRealPath("resources/imgs/mypage");

		if(service.profileSelect(parents) != null ) service.delete(parents); // 기존 파일 삭제(단 원래 id가 DB에 없을경우에는 실행되면 안됨 -> 이거 코드짜기)
		int result = service.profileInsert(after_profile,parents,realPath); // 새로운 파일 입력

		model.addAttribute("result",result);
		return "/mypage/profileView";
	}

	// 포인트 충전내역 확인
	@RequestMapping(value="/pointChargeList", produces="text/html;charset=utf8")
	public String pointChargeList(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<PointAccountDTO> dto = service.pointChargeList(sessionID); 

		model.addAttribute("pointCharge",dto);
		return "/mypage/pointCharge";
	}

	// 포인트 사용내역 확인
	@RequestMapping(value="/pointUseList", produces="text/html;charset=utf8")
	public String pointUseList(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<PointAccountDTO> dto = service.pointUseList(sessionID); 

		model.addAttribute("pointUse", dto);
		return "/mypage/pointUse";
	}


	/////////////////////////////////////////////////////////////////////////////////////////// 현재 빌린, 빌려준 상품

	// 현재 빌린 상품 출력(미완)
	@RequestMapping(value="/borrowProduct", produces="text/html;charset=utf8")
	public String borrowProduct(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<PaymentDTO> list = service.borrowProduct(sessionID);
		
		model.addAttribute("borrowList", list);
		return "/mypage/nowBorrowProduct";
	}

	// 현재 빌려준 상품 출력(미완)
	@RequestMapping(value="/lendProduct", produces="text/html;charset=utf8")
	public String lendProduct(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<PaymentDTO> list = service.borrowProduct(sessionID);
		
		model.addAttribute("lendList",list);
		return "/mypage/nowLendProduct";
	}


	/////////////////////////////////////////////////////////////////////////////////////////// 거래 요청 목록 (판매자 입장)



	// 거래 요청 목록 - 물품 대여
	@RequestMapping("/requestRentalProduct")
	public String requestRental(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<HashMap<String,Object>> list = service.requestRentalProduct(sessionID); // 예약리스트 꺼내기

		model.addAttribute("requestRental", list);  // 들어온 예약 리스트
		return "/mypage/requestRentalProduct";
	}

	// 요청 거절 버튼을 눌렀을 때 - 물품 대여
	@ResponseBody
	@RequestMapping("/dealFailProduct")
	public String dealFailProduct(int parent) {
		System.out.println(parent);
		String sessionID = (String)session.getAttribute("loginID");
		int result = service.dealFailProduct(sessionID,parent);

		return String.valueOf(result);
	}

	// 거래 승인 버튼 출력하기 - 물품
	@ResponseBody
	@RequestMapping("/requestRentalProductProc")
	public String requestRentalTalentProc(String booker, String parent) {
		System.out.println("대여자 : " + booker + " 부모 : " + parent);
		String sessionID = (String)session.getAttribute("loginID");
		int result = service.dealSuccessSelect(sessionID, booker, parent); // 거래 완료 버튼(booker와 parent의 값은 어디서 갖고오지?)

		return String.valueOf(result);
	}


	// 거래 승인 완료 버튼 눌렀을 때 - 물품
	@ResponseBody
	@RequestMapping("/dealSuccess")
	public String dealSuccess(String writer, String booker, int parent) {
		System.out.println(writer +":"+":"+ booker+":"+ parent);
		int result = service.dealSuccess(writer,booker,parent); 

		return String.valueOf(result);
	}

	////////////////////////////////////////////////////////////////////////////////////////// 예약 내역 목록(구매자 입장)


	// 예약 내역 목록 - 대여 (승인 대기중)
	@RequestMapping("/buyRequestProduct")
	public String buyRequestProduct(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<HashMap<String,Object>> result = service.buyRequestProduct(sessionID);

		model.addAttribute("requestRental", result);
		return "/mypage/buyRequestProduct";
	}
	
	
	// 구매자가 대여 예약 내역 출력 (결제하기 버튼 생성)
		@RequestMapping("/buyRequestProduct2")
		public String buyRequestProduct2(Model model) {
			String sessionID = (String)session.getAttribute("loginID");
			List<HashMap<String,Object>> result = service.buyRequestProduct2(sessionID);

			model.addAttribute("requestRental", result);
			return "/mypage/buyRequestProduct";
		}
		
	
		// 구매자가 대여 예약 내역 출력 (결제하기 완료 생성)
				@RequestMapping("/paymentcomplete")
				public String paymentcomplete(Model model) {
					String sessionID = (String)session.getAttribute("loginID");
					List<HashMap<String,Object>> result = service.paymentcomplete(sessionID);

					model.addAttribute("requestRental", result);
					return "/mypage/buyRequestProduct";
				}
				
	
	
	
	
	
	
	

	// 예약 내역 목록 - 재능
	@RequestMapping("buyRequestTalent")
	public String buyRequestTalent(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		//		int paymentCount = service.paymentCount(sessionID);
		//		System.out.println("갯수는 "+ paymentCount);

		//		
		//			List<HashMap<String,Object>> paymentresult = service.buyRequestTalent2(sessionID);
		//			model.addAttribute("paymentlist", paymentresult);
		//			model.addAttribute("count",paymentCount);

		List<HashMap<String,Object>> bookingresult = service.buyRequestTalent(sessionID);
		model.addAttribute("requestRental", bookingresult);
		return "/mypage/buyRequestTalent";
	}

	// 예약 취소 - 재능
	@ResponseBody
	@RequestMapping("/bookingFail")
	public String bookingFail(int parent) {
		System.out.println(parent);
		String sessionID = (String)session.getAttribute("loginID");
		int result = service.bookingFail(sessionID,parent);

		return String.valueOf(result);
	}


	//////////////////////////////////////////////////////////////////////////////////////////// 거래 완료 목록

	// 거래 완료 목록 출력 - 물품 대여
	@RequestMapping(value="/dealEndProductSellList", produces="text/html;charset=utf8")
	public String dealEndProductSellList(Model model) {
		String id = (String)session.getAttribute("loginID");
		String product="물품";
		List<HashMap<Object, Object>> dealEndProductSellList =service.dealEndProductSellList(id,product);
		model.addAttribute("productSellList",dealEndProductSellList);

		return "/mypage/dealEndProductSellList";
	}

	// 거래 완료 목록 출력 -물품 빌리기
	@RequestMapping(value="/dealEndProductBuyList", produces="text/html;charset=utf8")
	public String dealEndProductBuyList(Model model) {
		String id = (String)session.getAttribute("loginID");
		
		
		
		
		String product="물품";
		List<HashMap<Object, Object>> dealEndProductBuyList =service.dealEndProductBuyList(id,product);
		model.addAttribute("productBuyList",dealEndProductBuyList);

		return "/mypage/dealEndProductBuyList";
	}


	// 거래 완료 목록 출력 - 재능 판매완료
	@RequestMapping(value="/dealEndTalentSellList", produces="text/html;charset=utf8")
	public String dealEndTalentSellList(Model model) {
		String id = (String)session.getAttribute("loginID");
		String talent="재능";
		List<HashMap<Object, Object>> dealEndTalentSellList =service.dealEndTalentSellList(id,talent);
		model.addAttribute("talentsellList",dealEndTalentSellList);
		return "/mypage/dealEndTalentSellList";
	}

	// 거래 완료 목록 출력 - 재능 구매완료
	@RequestMapping(value="/dealEndTalentBuyList", produces="text/html;charset=utf8")
	public String dealEndTalentBuyList(Model model) {
		String id = (String)session.getAttribute("loginID");
		String talent="재능";
		List<HashMap<Object, Object>> dealEndTalentBuyList =service.dealEndTalentBuyList(id,talent);
		model.addAttribute("talentbuyList",dealEndTalentBuyList);
		return "/mypage/dealEndTalentBuyList";
	}


	/////////////////////////////////////////////////////////////////////////////////////////// 내가 쓴 게시글 목록

	// 내가 쓴 게시글 목록 - 판매글
	@RequestMapping("/myRequestSellProduct")
	public String myRequestSellProduct(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<LendDTO> dto = service.myRequestSellProduct(sessionID);

		model.addAttribute("requestRental", dto);
		return "/mypage/myRequestSellProduct";
	}

	// 내가 쓴 게시글 목록 - 대여요청
	@RequestMapping("/myRequestBuyProduct")
	public String myRequestBuyProduct(Model model){
		String sessionID = (String)session.getAttribute("loginID");
		List<BorrowDTO> dto = service.myRequestBuyProduct(sessionID);

		model.addAttribute("requestRental", dto);
		return "/mypage/myRequestBuyProduct";
	}


	///////////////////////////////////////////////////////////////////////////////////////////// 커뮤

	// 나의 커뮤니티 목록 출력
	@RequestMapping(value="/selectMySns", produces="text/html;charset=utf8")
	public String selectMySns(Model model) throws Exception{
		String id= (String)session.getAttribute("loginID");

		PersonDTO dto = service.mypageList(id); // 내 정보 출력
		session.setAttribute("myInfo", dto); // 내 정보

		ProfileFilesDTO pdto = service.profileSelect(id); // 내 프사 출력
		model.addAttribute("profile",pdto); // 내 프사

		List<SnsDTO>list = sservice.mySelectAll(id); // 내 sns만 출력
		model.addAttribute("list", list);

		List<String> initProfile = new ArrayList<String>(); // 내 프로필사진 출력
		for(SnsDTO sd : list) {
			initProfile.add(pffd.profileSelect(sd.getId()) != null?
					fservice.toProfileBinary(session, pffd.profileSelect(sd.getId()).getSysName()):
						null);
		}
		model.addAttribute("initprofile", initProfile);

		for(SnsDTO sd : list) {
			System.out.println("처음 로딩되는 페이지: " +sd.getSeq());
		}
		List<String> ldto = sservice.existlike(id); //좋아요목록
		model.addAttribute("isLove",ldto);

		List<SnsFilesDTO>fdto = fservice.sendList(session); //파일목록
		model.addAttribute("file", fdto);


		return "/mypage/mySnsPage"; 
	}

	// 회원탈퇴
	@ResponseBody
	@RequestMapping("/memberOut")
	public int memberOut(String id) {
		int result = pservice.memberOut(id);				
		return result;
	}
}

