package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.LendFilesDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.service.LendService;
import kh.spring.service.MypageService;

@Controller
@RequestMapping("/lendBoard")
public class LendController {
	
	@Autowired
	private MypageService MypageService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private LendService service;
	
	//대여하기 글쓰기 폼으로
	@RequestMapping(value="toLend",produces="text/html;charset=utf8")
	public String sellingWrite() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		return "/toBoard/lend_write";
	}
	
	//대여하기 글쓰기 데이터 받기
	@RequestMapping(value="lendWrite",produces="text/html;charset=utf8")
	public String sellingWrite(LendDTO dto,LendFilesDTO fdto, MultipartHttpServletRequest request) throws Exception {
		
		List<MultipartFile> file = request.getFiles("file");
		int seq =service.getSeq();
		String sessionID = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("resources/imgs/lend");
		dto.setSeq(seq);
		int parent = dto.getSeq();
		dto.setWriter(sessionID);
		service.lendWrite(dto,realPath,file,parent);
		return "redirect:/AllBoardList/lendList?choice=Allchoice&search=&cpage=1";
	}
	
	//대여하기 상세보기
	@RequestMapping(value="lendView",produces="text/html;charset=utf8") 
	public String sellingViewByMe(String id, int seq, Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
		
		PersonDTO writerInfo = service.memberInfoById(id);//글 작성자 정보(이름,주소)
		
        LendDTO dto = service.detailView(seq);//글 상세보기
        
        model.addAttribute("profile",pfdto); //프로필        
        model.addAttribute("writerInfo",writerInfo);//작성자정보
        model.addAttribute("board",dto);//글내용		 
		 
		List<LendFilesDTO> flist = service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		model.addAttribute("flist", flist);//파일리스트를 request애 담는다.
		
		
		return "/toBoard/lend_view";
	}
	
	//수정하기 값 꺼내 보내기
	@RequestMapping(value="modify",produces="text/html;charset=utf8") 
	public String modify(int seq, Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID);
		
		
		LendDTO dto = service.detailView(seq);//게시글 정보
		List<LendFilesDTO> flist = service.selectAll(seq);
		
		model.addAttribute("myAd", pdto);
		model.addAttribute("dto", dto);
		model.addAttribute("flist", flist);
			
		return "/toBoard/lend_modify";
	}
		
	//수정 데이터 
	@RequestMapping(value="ldModify",produces="text/html;charset=utf8")
	public String ldModify(LendDTO dto,LendFilesDTO fdto,String[] delSeq,MultipartHttpServletRequest request) throws Exception {
			
		String realPath = session.getServletContext().getRealPath("resources/imgs/lend");
		
		int parent = dto.getSeq();
		
		List<MultipartFile> file = request.getFiles("file");
		
		service.boardModify(dto,realPath,delSeq,file,parent);

		return "redirect:/AllBoardList/lendList?choice=Allchoice&search=&cpage=1";
	}
	
	//게시글 삭제
	@RequestMapping("lendDelete") 
	public String lendDelete(int seq) throws Exception {
		int result = service.delete(seq);
		if(result<0) {
			return null ;
		}else {
			return "redirect:/AllBoardList/lendList?choice=Allchoice&search=&cpage=1";

		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="booking",produces="text/html;charset=utf-8") //판매 예약 글
	public String Booking(String seller,int parentseq, String booker,String bookable,String boardtype) throws Exception {
	    System.out.println("seller :" + seller);
	    System.out.println("parentseq :" + parentseq);
	    System.out.println("booker :" + booker);
	    System.out.println("bookable :" + bookable);
	    System.out.println("boardtype :" + boardtype);

	    int result =service.booking(seller,booker,bookable,parentseq,boardtype);
	    if(result>0) {
	       System.out.println("예약성공!!");
	    }return String.valueOf(result);
	 }   
	      
	      
	 @ResponseBody
	 @RequestMapping(value="checkBooking",produces="text/html;charset=utf-8")
	 public String checkBooking(int parentseq, String booker) {
	    System.out.println("booker :" + booker);
	    System.out.println("parentseq :" + parentseq);
	    int checkBooking = service.checkBooking(booker,parentseq);
	    if(checkBooking>0) {
	      System.out.println("이미 예약 되어있음");
	    }
	    return String.valueOf(checkBooking);
	  }

}
