package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PersonDTO;

@Component
public class PersonDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(PersonDTO dto) {
		return mybatis.insert("Person.insert",dto);
	}
	
	public int idDuplCheck(String id) {
		return mybatis.selectOne("Person.idDuplCheck",id);
	}
	
	public int login(Map<String,String>param) {
		return mybatis.selectOne("Person.login",param);
	}
	
	public String findid(PersonDTO dto) {
		return mybatis.selectOne("Person.findid",dto);
	}
	
	public String checkInfo(PersonDTO dto) {
		return mybatis.selectOne("Person.checkInfo",dto);
	}
	
	public String pswd(PersonDTO dto) {
		return mybatis.selectOne("Person.pswd",dto);
	}
	
	public void resetlogincount(String id) {
		mybatis.update("Person.resetlogincount", id);
	}
	
	public int checkid(String id) {
		return mybatis.selectOne("Person.checkid", id);
	}
	
	public int failcount(String id) {
		return mybatis.update("Person.failcount", id);
	}

	public int checkcount(String id) {
		return mybatis.selectOne("Person.checkcount", id);
	}
	
	public PersonDTO memberInfoById(String sessionID) {
	      return mybatis.selectOne("Person.memberInfo",sessionID);
	 }


}