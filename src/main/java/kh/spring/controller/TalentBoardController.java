package kh.spring.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.BookingDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardDTO;
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
		return "redirect:/";
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
		return "redirect:/";
	}
		
//	@RequestMapping("talentList")//재능 리스트
//	 public String talentList(Model model) throws Exception {
//		List<TalentBoardDTO> list = TBoardService.getAllList();
//	      model.addAttribute("boardAll",list);
//		return "/talentBoard/temp_boardlist";
//	}
	
	@RequestMapping("boardlist")//임시 리스트
	 public String boardlist(Model model) throws Exception {
		List<SellTalentDTO> list = STService.getAllList();
	      model.addAttribute("boardAll",list);
		return "/talentBoard/temp_boardlist";
	}
	
	@RequestMapping("sellingView") //판매글 상세보기 
	public String sellingView(String id, int seq, Model model) throws Exception {
		System.out.println(seq);
		String sessionID = (String) session.getAttribute("loginID");
		
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = STService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerInfo",writerInfo);

		SellTalentDTO dto = STService.detailView(seq);
		model.addAttribute("tboard",dto);

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
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필

		PersonDTO writerInfo = RTService.memberInfoById(id);//글 작성자 정보(이름,주소)
		model.addAttribute("writerName",writerInfo);

		RequestTalentDTO dto = RTService.detailView(seq);
		model.addAttribute("tboard",dto);

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
			return "redirect:/";

		}
		
	}
		
		@RequestMapping("RequestDelete") //요청 게시글 삭제
		public String requestDelete(int seq) throws Exception {
			int result =RTService.delete(seq);
			if(result<0) {
				return null ;
			}else {
				return "redirect:/";

			}
		
	}
	
	@RequestMapping("Booking") //판매 예약 글
	public String Booking(BookingDTO dto) throws Exception {
		String sessionID = (String) session.getAttribute("loginID");
        dto.setBooker(sessionID);
		int result =STService.booking(dto);
		if(result<0) {
			return null ;
		}else {
			return "redirect:/";
		}
		
	}
	
	
}
