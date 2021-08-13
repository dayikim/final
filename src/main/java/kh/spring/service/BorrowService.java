package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BorrowDAO;

import kh.spring.dto.BorrowDTO;

@Service
public class BorrowService {

	@Autowired
	private BorrowDAO dao;


	public List<String> getPageNavi(String category, String search, String cpage) {
		
		int currentPage = Integer.parseInt(cpage);
		
		return dao.getPageNavi(category, search, currentPage);
	}
	
	public List<BorrowDTO> getList(String category, String search, String cpage){
		int currentPage = Integer.parseInt(cpage);
		
		return dao.getList(category, search,currentPage);
	}
	
}
