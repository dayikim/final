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

	
	public int sellingCount(String kind,String sessionID ) { //판매목록 갯수
		 Map<String,Object> param = new HashMap<>();
		param.put("kind",kind );
	    param.put("id", sessionID);
		return pdao.sellingCount(param);
	}
	
	public List<TalentBoardDTO> getSellingList(String kind,String sessionID){//판매목록 리스트
		 Map<String,Object> param = new HashMap<>();
			param.put("kind",kind );
		    param.put("id", sessionID);
				return pdao.getSellingList(param);

	}
	

}
