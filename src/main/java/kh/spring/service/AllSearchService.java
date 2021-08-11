package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AllSearchDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.TalentBoardDTO;

@Service
public class AllSearchService {
	
	@Autowired
	private AllSearchDAO dao; 
	
	public List<LendDTO> lendSearch(String search){
		return dao.getLendList(search);
	}
	
	public List<BorrowDTO> borrowSearch(String search){
		return dao.getBorrowList(search);
	}
	
	public List<TalentBoardDTO> talentSearch(String search){
		return dao.getTalentList(search);
	}
	
	public int lendCount(String search){
		return dao.getLendCount(search);
	}
	
	public int borrowCount(String search){
		return dao.getBorrowCount(search);
	}
	
	public int talentCount(String search){
		return dao.getTalentCount(search);
	}

}
