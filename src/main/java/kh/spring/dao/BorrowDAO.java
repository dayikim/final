package kh.spring.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowDTO;

@Component
public class BorrowDAO {
	
	
//	public List<String> getPage(String ecdsearch, int pageNum){
//		//한페이지에 보여줄 게시글 수
//		final int PAGE_ROW_COUNT = 9;
//				
//		//보여줄 페이지의 시작 ROWNum = 0 부터 시작
//		int startRowNum = 0 + (pageNum -1) * PAGE_ROW_COUNT;
//		
//		int rowCount = PAGE_ROW_COUNT;
//		
//		//검색 키워드 관련 처리 - 검색 키워드가 있을수도 있고 없을수도 있다.
//		if(ecdsearch == null) {
//			//검색 조건에 빈 문자열을 넣어준다.
//			ecdsearch = "";
//		}
//		
//		//list 객체의 참조값을 담을 지역변수를 미리 만든다.
//		List<BorrowDTO> list = null;
//		
//		if(!ecdsearch.equals("")) {
//			
//		}
//		
//		
//	}
}
