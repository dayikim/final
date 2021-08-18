package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ProfileDAO;
import kh.spring.dto.TalentBoardDTO;

@Service
public class ProfileService {
	
	@Autowired
	private ProfileDAO pdao;

	
	public int sellingCount1(String id) { //판매목록 갯수1
		return pdao.sellingCount1(id);
	}
	
public int sellingCount2(String id) { //판매목록 갯수2
		
		return pdao.sellingCount2(id);
	}
	
	public List<HashMap<String,String>> sellingList(String id){//(lend,selltalent)판매목록 리스트
	return pdao.sellingList(id);

	}

	
//	public List<HashMap<String,String>> sellingList2(String writer){//판매목록 리스트(마이 프로필)
//		return pdao.sellingList2(writer);
//
//}
	

}
