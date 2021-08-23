package kh.spring.controller;

import java.util.List;

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
	
	//대여요청 글쓰기 폼으로
	@RequestMapping(value="toBorrow",produces="text/html;charset=utf8")
	public String sellingWrite() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		return "/toBoard/borrow_write";
	}
	
	//대여요청 글쓰기 데이터
	@RequestMapping(value="boardWrite",produces="text/html;charset=utf8")
	public String boardWrite(BorrowDTO dto,BorrowBoardFilesDTO fdto, MultipartFile[] file) throws Exception {
		
		int seq =service.getSeq();
		String sessionID = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("resources/imgs/borrow");
		dto.setSeq(seq);
		int parent = dto.getSeq();
		dto.setWriter(sessionID);
		service.boardwrite(dto,realPath,file,parent);
		return "redirect:/AllBoardList/borrowList?choice=Allchoice&search=&cpage=1";
	}
	
	//대여요청 상세보기	
	@RequestMapping(value="borrowView",produces="text/html;charset=utf8") 
	public String borrowViewByMe(String id, int seq, Model model) throws Exception {
		String sessionID = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
		
		PersonDTO writerInfo = service.memberInfoById(id);//글 작성자 정보(이름,주소)
		
        BorrowDTO dto = service.detailView(seq);//글상세보기
        
        model.addAttribute("profile",pfdto); //프로필
        model.addAttribute("writer",writerInfo);//작성자정보
        model.addAttribute("board",dto); //글내용	 
		 
		List<BorrowBoardFilesDTO> fList = service.selectAll(seq); //첨부파일 목록 출력   
        System.out.println(fList+"파일이 비어 있나요?? "+fList.isEmpty());//파일이 있나요?
		model.addAttribute("flist", fList);//파일리스트를 request애 담는다.
		
		
		return "/toBoard/borrow_view";
	}
	
	//수정할 값 꺼내 보내기
	@RequestMapping(value="modify",produces="text/html;charset=utf8") 
	public String modify(int seq, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID);
		
		BorrowDTO dto = service.detailView(seq);//게시글 정보
		
		List<BorrowBoardFilesDTO> flist = service.selectAll(seq);
		System.out.println("서->컨 파 : " + flist);
		
		model.addAttribute("myAd", pdto);
		model.addAttribute("dto", dto);
		model.addAttribute("flist", flist);
		
		return "/toBoard/borrow_modify";
	}
	
	//수정 데이터 
	@RequestMapping(value="bwModify",produces="text/html;charset=utf8")
	public String bwModify(BorrowDTO dto,BorrowBoardFilesDTO fdto,String[] delSeq,MultipartFile[] file) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("resources/imgs/borrow");

		int parent = dto.getSeq();
		
		service.boardModify(dto,realPath,delSeq,file,parent);

		return "redirect:/AllBoardList/borrowList?choice=Allchoice&search=&cpage=1";
	}
	
	//게시글 삭제
	@RequestMapping("borrowDelete") 
	public String borrowDelete(int seq) throws Exception {
		int result = service.delete(seq);
		if(result<0) {
			return null ;
		}else {
			return "redirect:/AllBoardList/borrowList?choice=Allchoice&search=&cpage=1";

		}
	}
	

}
