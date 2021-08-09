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

	public int getPageCount(String search) {
		
		System.out.println("서비스에서 총갯수 search 값 : " + search);

		return dao.getPageCount(search);
	}

	public List<BorrowDTO> getPageList(String search, int pageNum) {
		
		System.out.println("서비스에서 search 값 : " + search);

		return dao.getPageList(search,pageNum);
	}
}
