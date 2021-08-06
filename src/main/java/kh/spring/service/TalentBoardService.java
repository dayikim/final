package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.TalentBoardDTO;

@Service
public class TalentBoardService {
	
	@Autowired
	private TalentBoardDAO dao;
	

	public void insert(TalentBoardDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	public TalentBoardDTO detailView(int seq) {
		return dao.detailView(seq);
	}
	
   
}
