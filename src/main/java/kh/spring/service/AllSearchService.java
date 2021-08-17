package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BorrowDAO;
import kh.spring.dao.LendDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;

@Service
public class AllSearchService {
	
	@Autowired
	private LendDAO lddao;
	
	@Autowired
	private BorrowDAO bwdao;
	
	public List<String> getLdPageNavi(String category, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return lddao.getPageNavi(category, search, currentPage);
	}
	
	public List<LendDTO> getLdList(String category, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
		
		return lddao.getList(category, search,currentPage);
	}
	
	public List<String> getBwPageNavi(String category, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return bwdao.getPageNavi(category, search, currentPage);
	}
	
	public List<BorrowDTO> getBwList(String category, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
				
		return bwdao.getList(category, search,currentPage);
	}
	
	

	
	
}
