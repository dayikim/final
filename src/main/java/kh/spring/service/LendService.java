package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.LendDAO;
import kh.spring.dto.LendDTO;

@Service
public class LendService {
	@Autowired
	private LendDAO dao;

	public LendDTO deatilview(int seq) {
		return dao.detailview(seq);
	}

	
	
}
