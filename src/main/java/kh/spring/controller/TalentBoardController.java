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
		String sessionID = (String) session.getAttribute("loginID");
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
	@RequestMapping("boardlist")//임시 리스트
	 public String boardlist(Model model) throws Exception {

		List<TalentBoardDTO> list = TBoardService.getAllList();
		
	      model.addAttribute("boardAll",list);
	      
		
		return "/talentBoard/list";
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
	
	
}
