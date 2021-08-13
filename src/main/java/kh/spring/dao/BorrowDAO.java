package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.config.BoardConfig;
import kh.spring.dto.BorrowDTO;

@Component
public class BorrowDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BorrowDTO> getList(String category, String search,int cpage){
		
		System.out.println("디 : " + category + " : " + search);
		
		if(search == null) {
			search = "";
		}
		
		int endNum = cpage * BoardConfig.RECORD_COUNT_PER_PAGE;
		int startNum = endNum - (BoardConfig.RECORD_COUNT_PER_PAGE-1);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("search",search);
		map.put("endNum", endNum);
		map.put("startNum", startNum);
				
		List<BorrowDTO> list = null;
		
		if(!search.equals("")) {
			if(category.equals("AllCategory")) {
				list = mybatis.selectList("Borrow.toSearch", map);
			}else if(category.equals("address1")) {
				list = mybatis.selectList("Borrow.toAddress1", map);
			}else if(category.equals("title")) {
				list = mybatis.selectList("Borrow.toTitle", map);
			}else if(category.equals("contents")) {
				list = mybatis.selectList("Borrow.toContents", map);
			}										
		}else {
			list = mybatis.selectList("Borrow.toList", map);
		}
		
		System.out.println("디->서 : " + list);
		
		return list;
		
	}

	public List<String> getPageNavi(String category, String search, int currentPage) { // 페이지
		int recordTotalCount = 0;
		// 공지사항 게시글 리스트 페이지
		
		if(search == null) {
			search = "";
		}

		if (!search.equals("")) {
			if(category.equals("AllCategory")) {
				recordTotalCount = mybatis.selectOne("Borrow.numAllList", search);
			}else if(category.equals("address1")) {
				recordTotalCount = mybatis.selectOne("Borrow.numAddress1", search);
			}else if(category.equals("title")) {
				recordTotalCount = mybatis.selectOne("Borrow.numTitle", search);
			}else if(category.equals("contents")) {
				recordTotalCount = mybatis.selectOne("Borrow.numContents", search);
			} // 전체 레코드개수 (원래는 커넥션으로 카운트해서 가져옴)
		} else {
			recordTotalCount = mybatis.selectOne("Borrow.allList");
		}
		
		int recordCountPerPage = BoardConfig.RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = BoardConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작으로부터 끝까지의 페이지가 총 몇개인지.
		
		int pageTotalCount = 0; // 총 페이지

		if ((recordTotalCount % recordCountPerPage) > 0) { // 페이지 갯수가 일의자리가 있는 경우
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage; // 0 으로 떨어지는 페이지 일 경우
		}

		// 방어코드 (현재 위치 페이지가 총 페이지보다 넘치거나 -1 이 될 경우)
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} else if (currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;// 네비 시작페이지 구하기
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비 마지막 페이지 구하기

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		} // 방어코드 (엔드네비가 토탈보다 큰 에러일 시)

		boolean needPrev = true; // < : 이전페이지
		boolean needNext = true; // > : 다음페이지

		if (startNavi == 1) { // <, > 페이지 버튼 달아주기 1
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> pageNavi = new ArrayList<String>(); // <, > 페이지 버튼 달아주기 2
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));
		}
		if(needNext) {pageNavi.add(">");}

		return pageNavi;
	}
}
