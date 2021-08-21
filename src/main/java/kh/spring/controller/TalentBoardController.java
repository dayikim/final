package kh.spring.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.service.MypageService;
import kh.spring.service.RequestTalentService;
import kh.spring.service.SellTalentService;
import kh.spring.service.TBoardFilesService;
import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/tBoard") 
public class TalentBoardController {

	@Autowired
	private TalentBoardService TBoardService;//삭제 예정
	
	@Autowired
	private SellTalentService STService;
		
	@Autowired
	private RequestTalentService RTService;
    
	@Autowired
	private TBoardFilesService TFService;
	
	@Autowired
	private MypageService MypageService;

	@Autowired
	private HttpSession session;

	@RequestMapping("toSelling")//재능 판매 글쓰기 폼으로
	public String sellingWrite() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		return "/talentBoard/selling_write";
	}
	
	@RequestMapping("toRequest")//재능 요청 글쓰기 폼으로
	public String requestWrite() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		return "/talentBoard/request_write";
	}
	

	@RequestMapping("sellingWrite")//재능 판매 글쓰기 데이터 받기
	public String sellingWrite(SellTalentDTO dto,TBoardFilesDTO fdto, MultipartFile[] file) throws Exception {
		int seq =STService.getSeq();
		String sessionID = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("files");
		dto.setSeq(seq);
		dto.setWriter(sessionID);
		STService.sellingWrite(dto,realPath,fdto,file);
		return "redirect:/AllBoardList/tlSellList?choice=Allchoice&search=&cpage=1";
	}
	//TBoardFiles도 두개 필요!!(판매용/요청용)
	@RequestMapping("requestWrite")//재능 요청 글쓰기 데이터 받기
	public String requestWrite(RequestTalentDTO dto,TBoardFilesDTO fdto, MultipartFile[] file) throws Exception {
		int seq =RTService.getSeq();
		String sessionID = (String) session.getAttribute("loginID");
		String realPath = session.getServletContext().getRealPath("files");
		dto.setSeq(seq);
		dto.setWriter(sessionID);
		RTService.requestWrite(dto,realPath,fdto,file);
		return "redirect:/AllBoardList/tlRequestList?choice=Allchoice&search=&cpage=1";
	}
	
	@RequestMapping("sellingView") //판매글 상세보기
	public String sellingViewByMe(String id, int seq, Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 프사 출력
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);
		
        SellTalentDTO dto = STService.detailView(seq);//글 상세보기
		 model.addAttribute("board",dto);
		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//	
		return "/talentBoard/view_selling";
	}
	
	@RequestMapping("RequestView") //요청글 상세보기 
	public String RequestView(String id, int seq,Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		//////////////////////////////////////////////////////////////////////
		ProfileFilesDTO pfdto = MypageService.profileSelect(id); // 글작성자 이미지
		model.addAttribute("profile",pfdto); //<= 코드 수정 필요(글 작성자 이미지 가져와야 함!!)
		//////////////////////////////////////////////////////////////////////////////

		PersonDTO writerInfo = RTService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writer",writerInfo);

		RequestTalentDTO dto = RTService.detailView(seq);//요청 글 상세
		model.addAttribute("board",dto);

		////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
		//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
		//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
		//		
		return "/talentBoard/view_request";
	}
	
	@RequestMapping("sellingDelete") //판매 게시글 삭제
	public String sellingDelete(int seq) throws Exception {
		int result =STService.delete(seq);
		if(result<0) {
			return null ;
		}else {
			return "redirect:/AllBoardList/tlSellList?choice=Allchoice&search=&cpage=1";

		}
	}
		@RequestMapping("RequestDelete") //요청 게시글 삭제
		public String requestDelete(int seq) throws Exception {
			int result =RTService.delete(seq);
			if(result<0) {
				return null ;
			}else {
				return "redirect:/AllBoardList/tlRequestList?choice=Allchoice&search=&cpage=1";

			}
		
	}
	
		//판매수정할 값 꺼내 보내기
		@RequestMapping(value="tlsmodify",produces="text/html;charset=utf8") 
		public String tlsmodify(int seq, Model model) {
			String sessionID = (String) session.getAttribute("loginID");
			PersonDTO pdto = MypageService.mypageList(sessionID);
			
			SellTalentDTO dto = STService.detailView(seq);//게시글 정보
			
//			List<BorrowBoardFilesDTO> flist = service.selectAll(seq);
//			System.out.println("서->컨 파 : " + flist);
			
			model.addAttribute("myAd", pdto);
			model.addAttribute("dto", dto);
//			model.addAttribute("flist", flist);
			
			return "/talentBoard/modify_selling";
		}
		
		//판매수정 데이터 
		@RequestMapping(value="sellingModify",produces="text/html;charset=utf8")
		public String sellingModify(SellTalentDTO dto, TBoardFilesDTO fdto,String[] delSeq,MultipartFile[] file) throws Exception {
			
			String realPath = session.getServletContext().getRealPath("resources/imgs/selling");
			
			STService.boardModify(dto,realPath,fdto,delSeq,file);

			return "redirect:/AllBoardList/tlSellList?choice=Allchoice&search=&cpage=1";
		}
		
		//요청수정할 값 꺼내 보내기
		@RequestMapping(value="tlrmodify",produces="text/html;charset=utf8") 
		public String tlrmodify(int seq, Model model) {
			String sessionID = (String) session.getAttribute("loginID");
			PersonDTO pdto = MypageService.mypageList(sessionID);
					
			RequestTalentDTO dto = RTService.detailView(seq);//게시글 정보
					
//			List<BorrowBoardFilesDTO> flist = service.selectAll(seq);
//			System.out.println("서->컨 파 : " + flist);
					
			model.addAttribute("myAd", pdto);
			model.addAttribute("dto", dto);
//			model.addAttribute("flist", flist);
					
			return "/talentBoard/borrow_modify";
		}
				
		//요청수정 데이터 
		@RequestMapping(value="requestModify",produces="text/html;charset=utf8")
		public String requestModify(RequestTalentDTO dto,TBoardFilesDTO fdto,String[] delSeq,MultipartFile[] file) throws Exception {
					
			String realPath = session.getServletContext().getRealPath("resources/imgs/request");
					
			RTService.boardModify(dto,realPath,fdto,delSeq,file);

			return "redirect:/AllBoardList/tlRequestList?choice=Allchoice&search=&cpage=1";
		}
	
		@ResponseBody
		@RequestMapping(value="booking",produces="text/html;charset=utf-8") //판매 예약 글
		public String Booking(String seller,int parentseq, String booker,String bookable) throws Exception {
		    System.out.println("seller :" + seller);
		    System.out.println("parentseq :" + parentseq);
		    System.out.println("booker :" + booker);
		    System.out.println("bookable :" + bookable);

		    int booking  =STService.booking(seller,booker,bookable,parentseq);
		    if(booking>0)
		    {
		    System.out.println("예약성공!!");
		    }else {
		    System.out.println("예약실패!!");
		    }
		    return String.valueOf(booking);

		    }

		      
		      
		 @ResponseBody
		 @RequestMapping(value="checkBooking",produces="text/html;charset=utf-8")
		 public String checkBooking(int parentseq, String booker) {

		    System.out.println("booker :" + booker);
		    System.out.println("parentseq :" + parentseq);
		    int checkBooking = STService.checkBooking(booker,parentseq);
		    if(checkBooking>0) {
		      System.out.println("이미 예약 되어있음");
		    }
		    return String.valueOf(checkBooking);
		  }
}
