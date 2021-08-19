package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.LendDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.ReviewDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.LendService;
import kh.spring.service.MypageService;
import kh.spring.service.ProfileService;
import kh.spring.service.RequestTalentService;
import kh.spring.service.ReviewService;
import kh.spring.service.SellTalentService;
import kh.spring.service.TBoardFilesService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private TalentBoardService TService;//삭제예정
	
	@Autowired
	private SellTalentService STService;
	
	@Autowired
	private LendService LService;
	
	@Autowired
	private TBoardFilesService TFService;
	
	@Autowired
	private MypageService MypageService;

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
		
		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수

		List<HashMap<String,String>> sellingList;
		sellingList =PService.sellingList(id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/profile/userProfile";
	}
	
	
	@RequestMapping("sellingViewByMe") //판매글 상세보기 (마이 프로필)
	public String sellingViewByMe(int seq, Model model) throws Exception {
		System.out.println(seq);
		String writer = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(writer); // 프사 출력
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = STService.memberInfoById(writer);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
		
		List<HashMap<Object, Object>> sellingView;
		sellingView =PService.sellingView(seq,writer);//판매목록 상세보기
		
		if(seq<1001) {
			String boardName="대여하기";
			model.addAttribute("boardName",boardName);
		}else {
			String boardName="재능판매";
			model.addAttribute("boardName",boardName);
		}
          model.addAttribute("board",sellingView);
       
		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//		
		return "/profile/detailView";
	}
	
	
	@RequestMapping("sellingViewByUser") //판매글 상세보기 (유저 프로필)
	public String sellingViewByUser(String writer, int seq, Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		
		model.addAttribute("writer",writer);

		ProfileFilesDTO pfdto = MypageService.profileSelect(writer); // 프사 출력
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = STService.memberInfoById(writer);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);

		List<HashMap<Object, Object>> sellingView;
		sellingView =PService.sellingView(seq,writer);//판매목록 상세보기
				
		if(seq<1001) {
			String boardName="대여하기";
			model.addAttribute("boardName",boardName);
		}else {
			String boardName="재능판매";
			model.addAttribute("boardName",boardName);
		}
          model.addAttribute("board",sellingView);
       
		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//		
		return "/profile/detailView";
	}
	
		
	@RequestMapping("review")//거래 후기 작성
	public String Review(ReviewDTO dto, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		dto.setReviewID(sessionID);
		/* dto.setParentseq(seq); */
		RService.write(dto);
		return "/profile/review_UerProfile";
	}
	
@RequestMapping("reviewListForMe") //거래후기 from myprofile
	public String reviewListForMe( Model model) {
	String id = (String) session.getAttribute("loginID");
	PersonDTO pdto = MService.mypageList(id); // 내 정보 출력
	ProfileFilesDTO pfdto = MService.profileSelect(id); // 내 프사 출력
	session.setAttribute("myInfo", pdto); // 내 정보
	model.addAttribute("profile",pfdto); //프로필
	
//	String reviewer	
//    PersonDTO pd = RService.memberInfoById(id);//리뷰어 정보(이름,주소)
//    model.addAttribute("memberInfo",pd);
	
	int result1 = PService.sellingCount1(id);
	int result2 = PService.sellingCount2(id);
	int sellingCount= result1+result2;
	model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

	int result = RService.reviewCount(id);
	model.addAttribute("reviewCount",result);//리뷰 갯수
	
	List<ReviewDTO> reviewList= RService.getAllList(id);
	System.out.println(reviewList.isEmpty());
	System.out.println(reviewList.size());
	model.addAttribute("reviewlist",reviewList);

	
		return "/profile/review_MyProfile";
	}

	
////	@RequestMapping("reviewList") //거래후기 for myprofile
////	public String Review(String id, Model model) {
////		
//////	PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
//////	model.addAttribute("memberInfo",pd);
////		
////String sessionID = (String) session.getAttribute("loginID");
////		List<ReviewDTO> reviewList= RService.getAllList(sessionID);
////		System.out.println("id 받기" +id);
////		
////		
////		return "/profile/review_MyProfile";
////	}
//}
	
}
