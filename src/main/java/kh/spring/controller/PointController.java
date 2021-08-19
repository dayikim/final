package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.service.MypageService;
import kh.spring.service.PointService;
import kh.spring.service.SellTalentService;

@Controller
@RequestMapping("/point")
public class PointController {
	@Autowired
	private  PointService PointService;
	
	@Autowired
	private SellTalentService STService;

	@Autowired
	private MypageService MypageService;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("ToCharging")
	public String tocharing( Model model, PointDTO pointdto) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		
		int pointAmount =PointService.amount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		return "/point/charging";
	}
	@ResponseBody
	@RequestMapping(value="charging", produces="text/html;charset=utf8")
	public String Charging(String amount, Model model,PointDTO pointdto) throws Exception {
			String sessionID = (String) session.getAttribute("loginID");
			pointdto.setId(sessionID);//충전한 아이디
			pointdto.setPointAmount(Integer.parseInt(amount));//충전금액
			PointService.charging(pointdto);//포인트 적립
			int pointAmount =PointService.amount(sessionID);//잔고금액
			//포인트 충전-> 포인트 잔고 insert(seq,id=sessionID,pointAmount=amount,'0','0','포인트충전',sysdate)
//			PointService.add()
	
			
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		model.addAttribute("point",pointAmount); // 내 포인트

		return "my/mypageProc";
	}
	//포인트 check
	@ResponseBody
	@RequestMapping(value="pointcheck", produces="text/html;charset=utf8")
	public String point(int point) throws Exception {
			String sessionID = (String) session.getAttribute("loginID");
	int result = PointService.pointCheck(sessionID,point);
	return String.valueOf(result);
	}
	
	
	//결제하기 폼으로
	@RequestMapping("Topayment")
	public String Topayment(int seq, Model model, PointDTO pointdto) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		
		 SellTalentDTO dto = STService.detailView(seq);//글 상세보기
		 model.addAttribute("board",dto);
		
		int pointAmount =PointService.amount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		return "/point/charging";
	}
	
	//구매자가 결제하기
	@RequestMapping("payment")
	public String payment(int seq, int price, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		String buyer = sessionID;
		//seq로 해당 글의 writer,title 받아오기 (seq는 판매게시글 번호)
//		String seller = 
//		String item = 
//		paymentDTO =>dao.payment(dto)
		
		//결제 취소 dto.cancel(dto)<delete>
		
		//구매자 결제금액 차감
		// pointaccount insert value(seq,id=sessionID(buyer),'-500','500','0','상품 구매','sysdate')
		
		return buyer;
		
	//대여상품의 경우, 물건 반납완료시 -> 판매금액 입금
		//마이페이지에서 반납완료 버튼 누르면, pointaccount insert value(seq,id=seller(approval테이블),'0','0','500','판매금액',sysdate)
	//재능 상품 경우, 거래완료 버튼 누르면 -> 판매금액 입금 
		
	}
	
	//
     
	

}

