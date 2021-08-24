package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수

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

		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수

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

		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수

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

	@RequestMapping("userSelling")//판매목록(유저 프로필)
	public String sellingList(String id, Model model) {
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
	public String sellingViewByMe(int seq,String category,Model model) throws Exception {
		System.out.println(seq);
		String id = (String) session.getAttribute("loginID");

		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
		
		//lend인지 selltalent인지 구분
				System.out.println(seq +":" + id +":" + category);
				int isitLendBoard =LService.isitLend(seq,id,category);
				
				if(isitLendBoard>0) {
					
					System.out.println("대여하기!!");
					LendDTO detailview = LService.detailView(seq);
					model.addAttribute("board",detailview);
					
					String sessionID = (String) session.getAttribute("loginID");

					ProfileFilesDTO PFdto = MypageService.profileSelect(id); // 프사 출력
					model.addAttribute("profile",PFdto); //프로필

					PersonDTO WriterInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
					model.addAttribute("writerInfo",WriterInfo);

					return "/toBoard/lend_view";
				
				}else {
					System.out.println("재능 판매");
					SellTalentDTO detailview =STService.detailView(seq);
					model.addAttribute("board",detailview);
					String sessionID = (String) session.getAttribute("loginID");
					ProfileFilesDTO PFdto = MypageService.profileSelect(id); // 프사 출력
					model.addAttribute("profile",PFdto); //프로필

					PersonDTO WriterInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
					model.addAttribute("writerInfo",WriterInfo);
					
					return "/talentBoard/view_selling";
				}
		
		
		
//
//		List<HashMap<Object, Object>> sellingView;
//		sellingView =PService.sellingView(seq,writer);//판매목록 상세보기
//
//		if(seq<1001) {
//			String boardName="대여하기";
//			model.addAttribute("boardName",boardName);
//		}else {
//			String boardName="재능판매";
//			model.addAttribute("boardName",boardName);
//		}
//		model.addAttribute("board",sellingView);
//
//		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
//		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
//		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
//		//		
//		return "/profile/detailView";
	}


	@RequestMapping("sellingViewByUser") //판매글 상세보기 (유저 프로필)
	public String sellingViewByUser(String id, int seq, String category, Model model) throws Exception {
		System.out.println(seq);
		
		
		//lend인지 selltalent인지 구분
		System.out.println(seq +":" + id +":" + category);
		int isitLendBoard =LService.isitLend(seq,id,category);
		
		if(isitLendBoard>0) {
			
			System.out.println("대여하기!!");
			LendDTO detailview = LService.detailView(seq);
			model.addAttribute("board",detailview);
			
			String sessionID = (String) session.getAttribute("loginID");

			ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
			model.addAttribute("profile",pfdto); //프로필

			PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
			model.addAttribute("writerInfo",writerInfo);

			return "/toBoard/lend_view";
		
		}else {
			System.out.println("재능 판매");
			SellTalentDTO detailview =STService.detailView(seq);
			model.addAttribute("board",detailview);
			String sessionID = (String) session.getAttribute("loginID");
			ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
			model.addAttribute("profile",pfdto); //프로필

			PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
			model.addAttribute("writerInfo",writerInfo);
			
			return "/talentBoard/view_selling";
		}
		
	}

//	@RequestMapping("sellingDelete") //판매 게시글 삭제
//	public String sellingDelete(int seq) throws Exception {
//		int result = 0;
//
//		if(seq<1001) {
//			//			result =LService.delete(seq); lend테이블에서 삭제
//		}else {
//			result =STService.delete(seq);
//
//		}
//
//		if(result<0) {
//			return "redirect:/";
//
//		}
//		return "/AllBoardList/lendList?choice=Allchoice&search=&cpage=1";
//
//	}
//
//	@RequestMapping("sellingModify") //판매 게시글 수정
//	public String sellingModify(int seq) throws Exception {
//		int result = 0;
//
//		if(seq<1001) {
//			//			result =LService.delete(seq); lend테이블에서 삭제
//		}else {
//			//			result =STService.modify(seq);
//
//		}
//
//		if(result<0) {
//			return "redirect:/";
//
//		}
//		return "/AllBoardList/lendList?choice=Allchoice&search=&cpage=1";
//	}
//
	@ResponseBody
	@RequestMapping("checkReview")//거래 후기 작성유무
	public String checkReview(int parentseq,Model model) {
		String id = (String) session.getAttribute("loginID");
		int checkReview =RService.checkReview(parentseq);
		if(checkReview>0){
			System.out.println("이미 작성되어 있음!");
		}
		return String.valueOf(checkReview);
	  }
	
	
	
	@ResponseBody
	@RequestMapping("review")//거래 후기 작성
	public String Review(ReviewDTO dto, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		int result =RService.write(dto);
		if(result>0){
			System.out.println(" 작성 성공!");
		}
		return String.valueOf(result);
	}

	@RequestMapping("reviewListForMe") //거래후기 from myprofile
	public String reviewListForMe(Model model) {
		String id = (String) session.getAttribute("loginID");
		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);


		PersonDTO pdto = MService.mypageList(id); // 내 정보 출력
		ProfileFilesDTO pfdto = MService.profileSelect(id); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필

		//	String reviewer =RService.reviewerInfoByRecipient(id);// 수신자(sessionID)로 reviewer 주소 출력
		//   PersonDTO pd = RService.memberInfoById(reviewer);//리뷰어 정보(이름,주소)
		//    model.addAttribute("reviewer",pd);

		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수


		//작은 프로필 출력!
//		List<HashMap<Object, Object>> sysName; 
//		sysName = RService.sysName(id); // 리뷰어 프사 출력
//		model.addAttribute("sysName",sysName);

		List<HashMap<Object, Object>> reviewList;//리뷰 리스트
		reviewList= RService.reviewList(id);

		//	List<ReviewDTO> reviewList= RService.getAllList(id);
		System.out.println(reviewList.isEmpty());
		System.out.println(reviewList.size());
		model.addAttribute("reviewList",reviewList);
		return "/profile/review_MyProfile";
	}
	@RequestMapping("reviewListForUser") //거래후기 from Userprofile
	public String reviewListForUser(String id, Model model) {
		String SessionID = (String) session.getAttribute("loginID");
		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
		
		model.addAttribute("writer",id);//유저 아이디 값
		
		PersonDTO pdto = MService.mypageList(id); // 유저 정보 출력
		ProfileFilesDTO pfdto = MService.profileSelect(id); // 유저 프사 출력
		session.setAttribute("UserInfo", pdto); // 유저 정보
		model.addAttribute("profile",pfdto); //프로필		

		int result1 = PService.sellingCount1(id);
		int result2 = PService.sellingCount2(id);
		int sellingCount= result1+result2;
		model.addAttribute("sellingCount",sellingCount);//판매목록 갯수

		int result = RService.reviewCount(id);
		model.addAttribute("reviewCount",result);//리뷰 갯수

		//작은 프로필 출력!
//		List<HashMap<Object, Object>> sysName; 
//		sysName = RService.sysName(id); // 리뷰어 프사 출력
//		model.addAttribute("sysName",sysName);

		List<HashMap<Object, Object>> reviewList;//리뷰 리스트
		reviewList= RService.reviewList(id);

		//List<ReviewDTO> reviewList= RService.getAllList(id);
		System.out.println(reviewList.isEmpty());
		System.out.println(reviewList.size());
		model.addAttribute("reviewList",reviewList);
		return "/profile/review_UserProfile";
	}


}
