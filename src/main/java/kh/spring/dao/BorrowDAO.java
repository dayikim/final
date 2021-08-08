package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowDTO;

@Component
public class BorrowDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int getPageCount(String ecdsearch, int pageNum){
		//한페이지에 보여줄 게시글 수
		final int PAGE_ROW_COUNT = 9;
				
		//보여줄 페이지의 시작 ROWNum = 0 부터 시작
		int startRowNum = 0 + (pageNum -1) * PAGE_ROW_COUNT;
		
		int rowCount = PAGE_ROW_COUNT;
		
		//검색 키워드 관련 처리 - 검색 키워드가 있을수도 있고 없을수도 있다.
		if(ecdsearch == null) {
			//검색 조건에 빈 문자열을 넣어준다.
			ecdsearch = "";
		}
		
		//list 객체의 참조값을 담을 지역변수를 미리 만든다.
		List<BorrowDTO> list = null;
		
		//전체 row의 개수를 담을 지역변수
		int totalRow = 0;
		
		//검색 키워드가 넘어온다면
		if(!ecdsearch.equals("")) {
			totalRow = ((Integer)(mybatis.selectOne("Borrow.numSearch", ecdsearch)));
		}else if(ecdsearch.equals("")) {
			totalRow = (Integer)mybatis.selectOne("Borrow.numList");
		}
		
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		return totalPageCount;
	}
	
	public List<BorrowDTO> getPageList(String ecdsearch){
		//검색 키워드 관련 처리 - 검색 키워드가 있을수도 있고 없을수도 있다.
				if(ecdsearch == null) {
					//검색 조건에 빈 문자열을 넣어준다.
					ecdsearch = "";
				}
				//list 객체의 참조값을 담을 지역변수를 미리 만든다.
				List<BorrowDTO> list = null;
				
				if(!ecdsearch.equals("")) {
					list = mybatis.selectList("Borrow.toSearch",ecdsearch);
//					list = mybatis.selectList("Borrow.toTitle",ecdsearch);
				}else if(ecdsearch.equals("")) {//검색이 널일 경우 전체목록 나오게하기
					list = mybatis.selectList("Borrow.toList");
				}
				
				return list;
		
	}
	
	
	
	
}

