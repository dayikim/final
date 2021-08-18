package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BorrowDAO;
import kh.spring.dao.LendDAO;
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;

@Service
public class AllSearchService {
	
	@Autowired
	private LendDAO lddao;
	
	@Autowired
	private BorrowDAO bwdao;
	
	@Autowired
	private TalentBoardDAO tldao;
	
	@Autowired
	private TBoardFilesDAO fldao;
	
	public List<String> getLdPageNavi(String choice, String search, String cpage) {
		
		System.out.println(choice);
		
		int currentPage = Integer.parseInt(cpage);
		
		return lddao.getPageNavi(choice, search, currentPage);
	}
	
	public List<LendDTO> getLdList(String choice, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
		
		return lddao.getList(choice, search,currentPage);
	}
	
	public List<String> getBwPageNavi(String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return bwdao.getPageNavi(choice, search, currentPage);
	}
	
	public List<BorrowDTO> getBwList(String choice, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
						
		return bwdao.getList(choice, search,currentPage);
	}
	
	public List<String> getTlPageNavi(String kind, String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return tldao.getPageNavi(kind, choice, search, currentPage);
	}
	
	public List<BorrowDTO> getTlList(String kind, String choice, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
				
		return tldao.getList(kind, choice, search,currentPage);
	}
	
	

	
	
}
