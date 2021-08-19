package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.service.BorrowService;
import kh.spring.service.MypageService;

@Controller
@RequestMapping("/borrowBoard")
public class BorrowController {
	
	@Autowired
	private BorrowService service;
	
	@Autowired
	private MypageService MypageService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="toLend",produces="text/html;charset=utf8")//대여하기 글쓰기 폼으로
	public String sellingWrite() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		return "/toBoard/lend_write";
	}
	
	@RequestMapping("boardWrite")
	public String boardWrite(BorrowDTO dto,BorrowBoardFilesDTO fdto, MultipartFile[] file) throws Exception {
		int seq =service.getSeq();
		String id = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("files");
		dto.setSeq(seq);
		dto.setWriter(id);
		service.boardwrite(dto,realPath,fdto,file);

		return "redirect:/";
	}
	
	@RequestMapping(value="lendView",produces="text/html;charset=utf8") //대여하기 상세보기
	public String sellingViewByMe(String id, int seq, Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
		
		PersonDTO writerInfo = service.memberInfoById(id);//글 작성자 정보(이름,주소)
        BorrowDTO dto = service.detailView(seq);
        
        model.addAttribute("profile",pfdto); //프로필
        model.addAttribute("writerInfo",writerInfo);
        model.addAttribute("board",dto);		 
		 
		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		
		
		return "/toBoard/lend_view";
	}
	
	

}
