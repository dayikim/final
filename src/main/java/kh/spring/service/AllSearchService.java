package kh.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BorrowDAO;
import kh.spring.dao.LendDAO;
import kh.spring.dao.LendFilesDAO;
import kh.spring.dao.RequestTalentDAO;
import kh.spring.dao.SellTalentDAO;
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.LendFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;

@Service
public class AllSearchService {
	
	@Autowired
	private LendDAO lddao;
	
	@Autowired
	private LendFilesDAO ldfdao;
	
	@Autowired
	private BorrowDAO bwdao;
	
	@Autowired
	private TBoardFilesDAO fldao;
	
	@Autowired
	private SellTalentDAO tlsdao;
	
	@Autowired
	private RequestTalentDAO tlrdao;
	
	//대여하기 리스트 네비
	public List<String> getLdPageNavi(String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return lddao.getPageNavi(choice, search, currentPage);
	}
	
	//대여하기 리스트
	public List<HashMap<String, Object>> getLdList(String choice, String search, String cpage){
		
		int currentPage = Integer.parseInt(cpage);
		
		return lddao.getList(choice, search,currentPage);
	}
	
	//대여하기 파일리스트
	public List<LendFilesDTO> getFiles(){
		return ldfdao.getFiles();
	}
	
	//대여요청 리스트 네비
	public List<String> getBwPageNavi(String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return bwdao.getPageNavi(choice, search, currentPage);
	}
	
	
	//대여요청 리스트
	public List<HashMap<String, Object>> getBwList(String choice, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
						
		return bwdao.getList(choice, search,currentPage);
	}
	
	//재능대여 리스트 네비
	public List<String> getTlsPageNavi(String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
		
		return tlsdao.getPageNavi(choice, search, currentPage);
	}
	
	//재능대여 리스트
	public List<HashMap<String, Object>> getTlsList(String choice, String search, String cpage){
		
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
				
		return tlsdao.getList(choice, search,currentPage);
	}
	
	//재능요청 리스트 네비
	public List<String> getTlrPageNavi(String choice, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
		
		return tlrdao.getPageNavi(choice, search, currentPage);
	}
	
	//재능요청 리스트
	public List<HashMap<String, Object>> getTlrList(String choice, String search, String cpage){
		
		int currentPage = Integer.parseInt(cpage);
		
		System.out.println(choice);
				
		return tlrdao.getList(choice, search,currentPage);
	}
	
	

	
	
}
