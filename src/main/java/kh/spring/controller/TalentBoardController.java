package kh.spring.controller;



import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.MypageService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/tBoard")
public class TalentBoardController {
	private static final int RESULT_EXCEED_SIZE = -2;
	private static final int RESULT_UNACCEPTED_EXTENSION = -1;
	private static final int RESULT_SUCCESS = 1;
	private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	@Autowired
	private TalentBoardService TBoardService;

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
	public String post(int seq,Model model) throws Exception {
		System.out.println(seq);
		TalentBoardDTO dto = TBoardService.detailView(seq);
		model.addAttribute("post",dto);

		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//		
		return "/talentboard/detailView";
	}
	@RequestMapping(value="userProfile",produces="text/html;charset=utf8")
	public String userProfile(String id,Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		return "/talentBoard/userProfile";
	}

	@RequestMapping("sellingList")
	public String sellingList() {
		return "/talentBoard/userProfile";
	}

	@RequestMapping("Review")
	public String Review() {
		return "/talentBoard/userProfile";
	}
}
