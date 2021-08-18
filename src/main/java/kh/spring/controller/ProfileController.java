package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.ReviewDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.MypageService;
import kh.spring.service.ProfileService;
import kh.spring.service.RequestTalentService;
import kh.spring.service.ReviewService;
import kh.spring.service.SellTalentService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private TalentBoardService TService;//삭제예정
	
	@Autowired
	private SellTalentService STService;
	
	@Autowired
	private RequestTalentService RTService;
    
	@Autowired
	private ProfileService PService;
	
	@Autowired
	private ReviewService RService;
	
	@Autowired
	private MypageService MService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="myProfile",produces="text/html;charset=utf8") //마이 프로필
	public String myProfile(Model model) {
		String id = (String) session.getAttribute("loginID");
		PersonDTO pdto = MService.mypageList(id); // 내 정보 출력
		ProfileFilesDTO pfdto = MService.profileSelect(id); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		
//		List<TBoardFilesDTO> pList =TFService.getpictures()		
//         model.addAttribute("pictures",pList);
		
//		String kind ="재능등록";
		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		List<HashMap<String, String>> sellingList;
		sellingList =PService.sellingList(id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/myProfile";
	}

	@RequestMapping("myselling") //나의 판매 내역
	public String myselling(Model model) {
		String id = (String) session.getAttribute("loginID");
		PersonDTO pdto = MService.mypageList(id); // 내 정보 출력
		ProfileFilesDTO pfdto = MService.profileSelect(id); // 내 프사 출력
		
		session.setAttribute("myInfo", pdto); // 내 정보	
		model.addAttribute("profile",pfdto); //프로필

//		String kind ="재능등록";
		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		List<HashMap<String, String>> sellingList;
		sellingList =PService.sellingList(id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/myProfile";
	}
	
	@RequestMapping(value="userProfile",produces="text/html;charset=utf8") //유저 프로필
	public String userProfile(String id, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
         
		model.addAttribute("writer",id);
		
		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		List<HashMap<String,String>> sellingList;
		sellingList =PService.sellingList(id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/userProfile";
	}
	
	@RequestMapping("userSelling")////판매목록
	public String sellingList(String id,Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
         
		model.addAttribute("writer",id);
		
		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		List<HashMap<String,String>> sellingList;
		sellingList =PService.sellingList(id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/userProfile";
	}
	@RequestMapping("Review")//거래 후기
	public String Review() {
		return "/profile/review_UerProfile";
	}
	
	@RequestMapping("review") //거래후기 from selling_view
	public String Review(String id, Model model) {
//	PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
//	model.addAttribute("memberInfo",pd);
		System.out.println("id 받기" +id);
		String sessionID = (String) session.getAttribute("loginID");
		List<ReviewDTO> reviewList= RService.getAllList(sessionID);
		System.out.println(reviewList.isEmpty());
		System.out.println(reviewList.size());
		model.addAttribute("reviewlist",reviewList);
		return "/profile/review_MyProfile";
	}
}
	
//	@RequestMapping("review") //거래후기 from request_view
//	public String Review2(String id, Model model) {
////	PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
////	model.addAttribute("memberInfo",pd);
//		System.out.println("id 받기" +id);
//		String sessionID = (String) session.getAttribute("loginID");
//		List<ReviewDTO> reviewList= RService.getAllList(sessionID);
//		System.out.println(reviewList.isEmpty());
//		System.out.println(reviewList.size());
//		model.addAttribute("reviewlist",reviewList);
//		return "/profile/review_MyProfile";
//	}
//}
