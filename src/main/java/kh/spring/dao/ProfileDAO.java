package kh.spring.dao;

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
}
