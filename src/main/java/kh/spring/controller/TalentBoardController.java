package kh.spring.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.MypageService;
import kh.spring.service.TBoardFilesService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/tBoard")
public class TalentBoardController {

	@Autowired
	private TalentBoardService TBoardService;
    
	@Autowired
	private TBoardFilesService TFService;
	
	@Autowired
	private MypageService MypageService;

	@Autowired
	private HttpSession session;


	@RequestMapping("Towrite")
	public String write() {
		return "/talentBoard/write";
	}

	@RequestMapping("boardWrite")
	public String boardWrite(TalentBoardDTO dto,TBoardFilesDTO fdto, MultipartFile[] file) throws Exception {

		int seq =TBoardService.getSeq();
		String id = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("files");
		dto.setSeq(seq);
		dto.setId(id);
		TBoardService.boardwrite(dto,realPath,fdto,file);

		return "redirect:/";
	}

	@RequestMapping("detailView")
	public String post(String id, int seq,Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("memberInfo",pd);

		TalentBoardDTO dto = TBoardService.detailView(seq);
		model.addAttribute("tboard",dto);

		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//		
		return "/talentBoard/view_selling";
	}
	@RequestMapping(value="myProfile",produces="text/html;charset=utf8") //마이 프로필
	public String myProfile(String id,Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		
//		List<TBoardFilesDTO> pList =TFService.getpictures()		
//         model.addAttribute("pictures",pList);
		
		String kind ="재능등록";
		int result = TBoardService.sellingCount(kind,sessionID);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =TBoardService.getSellingList(kind,sessionID);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/talentBoard/myProfile";
	}

	@RequestMapping("myselling") //나의 판매 내역
	public String myselling(String id,Model model) {
		
		PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("myInfo",pd);
		String sessionID = (String) session.getAttribute("loginID");
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
	
		model.addAttribute("profile",pfdto); //프로필

		String kind ="재능등록";
		int result = TBoardService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =TBoardService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/talentBoard/myProfile";
	}
	
	@RequestMapping(value="userProfile",produces="text/html;charset=utf8") //유저 프로필
	public String userProfile(String id, Model model) {
		PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("memberInfo",pd);

		String kind ="재능등록";
		int result = TBoardService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);//판매목록 갯수

		List<TalentBoardDTO> sellingList;
		sellingList =TBoardService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/talentBoard/userProfile";
	}
	
	@RequestMapping("userSelling")
	public String sellingList(String id,Model model) {
		PersonDTO pd = TBoardService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("memberInfo",pd);

		String kind ="재능등록";
		int result = TBoardService.sellingCount(kind,id);
		model.addAttribute("sellingCount",result);

		List<TalentBoardDTO> sellingList;
		sellingList =TBoardService.getSellingList(kind,id);//판매목록 리스트

		model.addAttribute("sellinglist",sellingList);
		System.out.println(sellingList.isEmpty());
		System.out.println(sellingList.size());
		return "/talentBoard/userProfile";
	}

	@RequestMapping("Review")
	public String Review() {
		return "/talentBoard/userProfile";
	}
}
