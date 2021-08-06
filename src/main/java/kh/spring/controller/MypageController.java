package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MypageController {
	
	// 마이페이지로 이전
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
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

