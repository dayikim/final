package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ChargingDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointAccountDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.service.LendService;
import kh.spring.service.MypageService;
import kh.spring.service.PointService;
import kh.spring.service.SellTalentService;

@Controller
@RequestMapping("/point")
public class PointController {
	@Autowired
	private PointService PointService;

	@Autowired
	private LendService LService;

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

		int pointAmount =PointService.checkAmount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		return "/point/charging";
	}
	@ResponseBody
	@RequestMapping(value="charging", produces="text/html;charset=utf8")
	public String Charging(int amount, Model model,ChargingDTO cdto,PointAccountDTO padto) throws Exception {
		String sessionID = (String) session.getAttribute("loginID");
		cdto.setId(sessionID);//충전한 아이디
		cdto.setAmount(amount);//충전금액
		int result= PointService.charging(cdto);//포인트 적립

		if(result>0) {
			System.out.println("충전 성공!!"
					+ "");
			//포인트 충전-> 포인트 잔고 insert(seq,id=sessionID,pointAmount=amount,'0','0','포인트충전',sysdate)
			padto.setId(sessionID);//충전한 아이디
			padto.setPointamount(cdto.getAmount()/10);//포인트 잔액 +
			padto.setEarnpoint(0);
			padto.setUsepoint(0);
			padto.setReason("포인트 충전");
			int Addpoint = PointService.add(padto);
		}else {
			System.out.println("충전 실패!!");
		}
		int checkAmount =PointService.checkAmount(sessionID);
		//		int pointAmount =PointService.amount(sessionID);//임시 잔고금액
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		model.addAttribute("point",checkAmount);//내 포인트 체크
		//		model.addAttribute("point",pointAmount); // 내 포인트

		return "my/mypageProc";
	}

	//재능 판매 결제하기 폼으로
	@RequestMapping("TopaymentByTalent")
	public String Topayment(int seq, String id, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(id); // 작성자 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 작성자 프사 출력
		session.setAttribute("writerInfo", pdto); // 작성자 정보 출력
		model.addAttribute("profile",pfdto); //작성자 정보 출력

		SellTalentDTO dto = STService.detailView(seq);//글 상세보기
		model.addAttribute("board",dto);

		int pointAmount =PointService.checkAmount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		return "/point/payment_talent";
	}
	
	//대여하기 결제하기 폼으로
	@RequestMapping("TopaymentBylend")
	public String TopaymentBylend(int seq, String id, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(id); // 작성자 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 작성자 프사 출력
		session.setAttribute("myInfo", pdto); // 작성자 프사 출력
		model.addAttribute("profile",pfdto); //작성자 프사 출력

		LendDTO dto = LService.detailView(seq);//글 상세보기
		model.addAttribute("board",dto);

		int pointAmount =PointService.checkAmount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		
		return "/point/payment_lend";
	
	}
	//잔여 포인트 check
	@ResponseBody
	@RequestMapping(value="pointcheck", produces="text/html;charset=utf8")
	public String point(int point) throws Exception {
		String sessionID = (String) session.getAttribute("loginID");
		int result = PointService.pointCheck(sessionID,point);
		return String.valueOf(result);
	}
	//구매여부 확인
	@ResponseBody
	@RequestMapping(value="isPayment",produces="text/html;charset=utf8")
	public String isPayment(int parentseq) {
		 System.out.println("seq :" + parentseq);
		int isPayment =PointService.isPayment(parentseq);
		if(isPayment>0) {
			System.out.println("이미 결제된 거래글 입니다.");
		}
		return String.valueOf(isPayment);	
	}
	
	//구매자가 확인버튼 누른다음 결제하기
	@RequestMapping(value="payment",produces="text/html;charset=utf8")
	public String payment(int parentseq, String item,String seller, String category, int price, Model model, PaymentDTO paydto, PointAccountDTO padto) {
		//구매자 결제하기 
		System.out.println(parentseq);
		String sessionID = (String) session.getAttribute("loginID");
		paydto.setBuyer(sessionID);
		paydto.setPrice(price);

		//lend인지 selltalent인지 구분
		System.out.println(parentseq +":" + sessionID +":" + category);
		int isitLendBoard =LService.isitLend(parentseq,sessionID,category);	
		if(isitLendBoard>0) {
			System.out.println("대여하기");
			paydto.setBoardtype("물품");
		
		}else {
			System.out.println("재능판매");
			paydto.setBoardtype("재능");
		}
		// 결제 하기 
		paydto.setSeller(seller);
		paydto.setItem(item);
		paydto.setParentseq(parentseq);
		int payment_result =PointService.payment(paydto);

		if(payment_result>0) {
			System.out.println("결제 성공");

			//구매자 결제금액 차감
			// pointaccount insert value(seq,id=sessionID(buyer),'-500','500','0','상품 구매','sysdate')
			padto.setId(sessionID);
			padto.setUsepoint(price);
			padto.setPointamount(-price);
			padto.setEarnpoint(0);
			padto.setReason("포인트차감");			
			int minuspoint_result = PointService.minus(padto);

			if(minuspoint_result>0) {
				System.out.println("구매자 포인트 차감 성공");
				//구매자/판매자가 오프라인 거래 후, 구매자가 확인버튼 누르면 판매자에게 입금
				//pointaccount insert value(seq,id=seller(approval테이블),'0','0','500','판매금액',sysdate)	
//				int isitLendBoard1 =LService.isitLend(parentseq,sessionID,category);	
//				if(isitLendBoard1>0) {
//					System.out.println("대여하기");
//					String writer = LService.getId(parentseq);
//					System.out.println("판매자 :" +writer);
//					padto.setId(writer);
//
//				}else {
//					System.out.println("재능판매");
//					String writer =STService.getWriter(parentseq);
//					System.out.println("판매자 :" +writer);
//					padto.setId(writer);
//				}
				
				padto.setId(seller);
				padto.setEarnpoint(price);
				padto.setPointamount(price);
				padto.setReason("거래금 입금");
				padto.setUsepoint(0);

				//판매자에게 입금
				int inputPoint_result = PointService.add(padto);

				if(inputPoint_result>0) {
					System.out.println("판매자에게 포인트 입금 완료");
				}else {
					System.out.println();
				}

			}else {
				System.out.println("구매자 포인트 차감 실패");
			}

		}else {
			System.out.println("구매자 결제 실패");
		}
		return "redirect:/my/mypageProc";
	}


	//	//구매자가 확인버튼 옆에 예약 취소 bookable =N
	//	@RequestMapping("dealCancel")
	//	public String dealCancel(int seq,int price, Model model, PaymentDTO paydto, PointAccountDTO padto) {
	//		
	//		//
	//		
	//		return null;
	//		//구매자 확인 취소
	//
	//}
}
