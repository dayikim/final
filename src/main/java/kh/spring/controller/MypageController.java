package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.config.SHA256;
import kh.spring.dto.PersonDTO;
import kh.spring.service.MypageService;
import kh.spring.service.PersonService;

@Controller
@RequestMapping("/my")
public class MypageController {
	
	@Autowired
	private MypageService service;
	@Autowired
	private HttpSession session;
	
	// 마이페이지 정보 출력
	@RequestMapping(value="/mypageProc", produces="text/html;charset=utf8")
	public String mypageProc() {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO dto = service.mypageList(sessionID);
		session.setAttribute("myInfo", dto);
		
		return "mypage/mypage";
	}
	
	//마이페이지 확인&수정화면
	@RequestMapping("/modify")
	public String modify(Model model) {
		String id = (String)session.getAttribute("loginID");
		System.out.println(id);
		List<PersonDTO>list = service.modify(id);
		model.addAttribute("list", list);
		return "mypage/modify";
	}
	
	//정보수정
	@RequestMapping("/modifyProc")
	public String modifyProc(PersonDTO dto) {
		String shaPass = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPass);
		String result = service.modifyProc(dto);
		return "redirect:/my/mypageProc";
	}
	
	
	// 프로필 사진 업데이트
	
	// 포인트 내역 확인 출력
	
	// 현재 빌린 상품 출력
	
	// 현재 빌려준 상품 출력
	
	// 거래 완료 목록 출력
	
	// 나의 커뮤니티 목록 출력
	
	// 내가 쓴 대여 글 목록 출력
	
	// 내가 쓴 후기글 목록 출력
}

