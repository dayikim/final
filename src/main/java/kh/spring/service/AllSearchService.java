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
	
	//대여하기 리스트
	public List<LendDTO> lendSearch(String search){
		return dao.getLendList(search);
	}
	
	//대여요청 리스트
	public List<BorrowDTO> borrowSearch(String search){
		return dao.getBorrowList(search);
	}
	
	//재능등록 리스트
	public List<TalentBoardDTO> tlSellSearch(String search){
		return dao.getTlSellList(search);
	}
	
	//재능요청 리스트
	public List<TalentBoardDTO> tlRequestSearch(String search){
		return dao.getTlRequestList(search);
	}
	
	//대여하기 카운트
	public int lendCount(String search){
		return dao.getLendCount(search);
	}
	
	//대여요청 카운트
	public int borrowCount(String search){
		return dao.getBorrowCount(search);
	}
	
	//재능등록 카운트
	public int tlSellCount(String search){ 
		return dao.getTlSellCount(search);
	}
	
	//재능요청 카운트
	public int tlRequsetCount(String search){
		return dao.getTlRequsetCount(search);
	}

	
	
}
