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
	public String Topayment(int seq, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필

		SellTalentDTO dto = STService.detailView(seq);//글 상세보기
		model.addAttribute("board",dto);

		int pointAmount =PointService.checkAmount(sessionID);//잔고금액
		model.addAttribute("point",pointAmount);
		return "/point/charging";
	}

	//구매자가 확인버튼 누른다음 결제하기
	@RequestMapping("payment")
	public String payment(int seq,int price, Model model, PaymentDTO paydto, PointAccountDTO padto) {
		//구매자 결제하기 
		String sessionID = (String) session.getAttribute("loginID");
		paydto.setBuyer(sessionID);
		paydto.setPrice(price);

		//1~ 대여하기 1001~ 재능판매 시퀀스/
		//seq로 해당 글의 writer,title 받아오기 (seq는 판매게시글 번호)
		if(seq<1001) {
			LendDTO lendBInfo = LService.detailView(seq);
			paydto.setSeller(lendBInfo.getWriter());
			paydto.setItem(lendBInfo.getTitle());
			paydto.setParentseq(lendBInfo.getSeq());
		}else {
			SellTalentDTO STBInfo =STService.detailView(seq);
			paydto.setSeller(STBInfo.getWriter());
			paydto.setItem(STBInfo.getTitle());
			paydto.setParentseq(STBInfo.getSeq());
		}
		// 결제 하기 
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
				if(seq<1001) {
					String writer = LService.getId(seq);
					padto.setId(writer);

				}else {
					String writer =STService.getWriter(seq);
					padto.setId(writer);
				}
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
 
		return "my/myproc";

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
