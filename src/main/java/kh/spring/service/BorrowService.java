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

		return dao.getPageCount(search);
	}

	public List<BorrowDTO> getPageList(String search, int pageNum) {

		return dao.getPageList(search,pageNum);
	}
}
