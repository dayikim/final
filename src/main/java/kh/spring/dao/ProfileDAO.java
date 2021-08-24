package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.TalentBoardDTO;

@Component
public class ProfileDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int sellingCount(Map<String,Object>param) {
		return mybatis.selectOne("Profile.sellingCount",param);
	}
	
	public List<TalentBoardDTO> getSellingList(Map<String,Object>param){
		return mybatis.selectList("Profile.getSellingList",param);
	}

//	public int sellingCount1(String id) { //판매갯수1
//		return mybatis.selectOne("Profile.sellingCount1",id);
//	}
	public int sellingCount2(String id) { //판매갯수2
		return mybatis.selectOne("Profile.sellingCount2",id);
	}

//	public List<HashMap<String, String>> sellingList1(String sessionID) { //판매리스트(마이 프로필)
//		
//		return mybatis.selectList("Profile.sellinglist",sessionID);
//	}
	
	public List<HashMap<String, String>> sellingList(String id) { //판매리스트(유저 프로필)
		return mybatis.selectList("Profile.sellinglist",id);
	}

	public List<HashMap<Object, Object>> sellingView(Map<Object, Object> param) {
		return mybatis.selectList("Profile.sellingView",param);

	}
	
}
