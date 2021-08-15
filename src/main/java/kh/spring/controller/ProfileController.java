package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.ReviewDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.MypageService;
import kh.spring.service.ProfileService;
import kh.spring.service.ReviewService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private TalentBoardService TService;
	
	@Autowired
	private ProfileService PService;
	
	@Autowired
	private ReviewService RService;
	
	@Autowired
	private MypageService MService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="myProfile",produces="text/html;charset=utf8") //마이 프로필
	public String myProfile(String id,Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		
//		List<TBoardFilesDTO> pList =TFService.getpictures()		
//         model.addAttribute("pictures",pList);
		
		String kind ="재능등록";
		int result = PService.sellingCount(kind,sessionID);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =PService.getSellingList(kind,sessionID);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/myProfile";
	}

	@RequestMapping("myselling") //나의 판매 내역
	public String myselling(String id,Model model) {
		
		PersonDTO pd = TService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("myInfo",pd);
		String sessionID = (String) session.getAttribute("loginID");
		ProfileFilesDTO pfdto = MService.profileSelect(sessionID); // 내 프사 출력
	
		model.addAttribute("profile",pfdto); //프로필

		String kind ="재능등록";
		int result = PService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =PService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/myProfile";
	}
	
	@RequestMapping(value="userProfile",produces="text/html;charset=utf8") //유저 프로필
	public String userProfile(String id, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pd = TService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("memberInfo",pd);

		String kind ="재능등록";
		int result = PService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);//판매목록 갯수

		List<TalentBoardDTO> sellingList;
		sellingList =PService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/userProfile";
	}
	
	@RequestMapping("userSelling")
	public String sellingList(String id,Model model) {
		String sessionID = (String) session.getAttribute("loginID");

		PersonDTO pd = TService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("memberInfo",pd);

		String kind ="재능등록";
		int result = PService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =PService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/userProfile";
	}

	@RequestMapping("Review")//거래 후기
	public String Review() {
		return "/profile/userProfile";
	}
	
	@RequestMapping("review")
	public String Review( Model model) {
//	PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
//	model.addAttribute("memberInfo",pd);
//		System.out.println("id 받기" +id);
		String sessionID = (String) session.getAttribute("loginID");
		List<ReviewDTO> reviewList= RService.getAllList(sessionID);
		System.out.println(reviewList.isEmpty());
		System.out.println(reviewList.size());
		model.addAttribute("reviewlist",reviewList);
		return "/profile/myProfile";
	}
}
