package kh.spring.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kh.spring.config.SHA256;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.service.MypageService;
import kh.spring.service.PersonService;
import kh.spring.service.PointService;

@Controller
@RequestMapping("/my")
public class MypageController {
	
	@Autowired
	private MypageService service;
	@Autowired
	private  PointService PointService;
	@Autowired
	private HttpSession session;
	
	// 마이페이지 정보 출력
	@RequestMapping(value="/mypageProc", produces="text/html;charset=utf8")
	public String mypageProc(Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO dto = service.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pdto = service.profileSelect(sessionID); // 내 프사 출력
		int pointAmount =PointService.amount();//잔고금액
		
		session.setAttribute("myInfo", dto); // 내 정보
		model.addAttribute("profile",pdto); // 내 프사
		model.addAttribute("point",pointAmount); // 내 포인트
		
		return "mypage/mypage";
	}
	
	//마이페이지 확인&수정화면
	@RequestMapping("/modify")
	public String modify(Model model) {
		String id = (String)session.getAttribute("loginID");
		List<PersonDTO>list = service.modify(id);
		model.addAttribute("list", list);
		return "mypage/modify";
	}
	
	//정보수정
	@RequestMapping("/modifyProc")
	public String modifyProc(PersonDTO dto) {
		String shaPass = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPass);
		service.modifyProc(dto);
		return "redirect:/my/mypageProc";
	}
	
	// 프로필 팝업 띄우기
	@RequestMapping("/picture_change")
	public String picture_change(String origin, Model model) {
		System.out.println("jsp에서 갖고온 파일 이름 : " + origin);
		String img_path = origin;
		
		model.addAttribute("origin", img_path); // 현재 배치되어있는 내 프사를 origin에 담아서
		return "mypage/profile";
	}
	
	// 프로필 사진 업데이트
	@RequestMapping("/profileUpdate")
	public String profileUpdate(String profile, MultipartFile after_profile, Model model) {
		System.out.println("받은 파일 : " + profile + " 받은 파일 이름 : " + after_profile);
		
		String parents = (String)session.getAttribute("loginID"); // 로그인 세션 받아서 프로필의 부모시퀀스에 넣기
		String realPath = session.getServletContext().getRealPath("resources/imgs/mypage");
		
		if(service.profileSelect(parents) != null ) service.delete(parents); // 기존 파일 삭제(단 원래 id가 DB에 없을경우에는 실행되면 안됨 -> 이거 코드짜기)
		int result = service.profileInsert(after_profile,parents,realPath); // 새로운 파일 입력
		
		model.addAttribute("result",result);
		return "/mypage/profileView";
	}
	
	// 포인트 충전내역 확인(완)
	@RequestMapping(value="/pointChargeList", produces="text/html;charset=utf8")
	public String pointChargeList(Model model) {
		String sessionID = (String)session.getAttribute("loginID");
		List<PointDTO> dto = service.pointChargeList(sessionID);
		
		model.addAttribute("pointCharge",dto);
		return "/mypage/pointCharge";
	}
	
	// 포인트 사용내역 확인(미완)
	@RequestMapping(value="/pointUseList", produces="text/html;charset=utf8")
	public String pointUseList() {
		return "/mypage/pointUse";
	}
	
	// 현재 빌린 상품 출력(미완)
	@RequestMapping(value="/borrowProduct", produces="text/html;charset=utf8")
	public String borrowProduct() {
		return "/mypage/nowBorrowProduct";
	}
	
	// 현재 빌려준 상품 출력(미완)
	@RequestMapping(value="/lendProduct", produces="text/html;charset=utf8")
	public String lendProduct() {
		return "/mypage/nowLendProduct";
	}
	
	// 대여 요청 목록(미완)
	@RequestMapping("/requestRental")
	public String requestRental() {
		return "/mypage/requestRental";
	}
	
	// 거래 완료 목록 출력(미완)
	@RequestMapping(value="/dealEndList", produces="text/html;charset=utf8")
	public String dealEndList() {
		return "/mypage/dealEndList";
	}
	// 나의 커뮤니티 목록 출력(예정)
	@RequestMapping(value="/selectMySns", produces="text/html;charset=utf8")
	public String selectMySns() {
//		String sessionID = (String) session.getAttribute("loginID");
//		service.selectMySns(sessionID);
		return "/mypage/mySnsPage";
	}
	
	// 내가 쓴 대여 글 목록 출력(미완)
	@RequestMapping(value="/myBoardList", produces="text/html;charset=utf8")
	public String myBoardList() {
		return "/mypage/myBoardList";
	}
}

