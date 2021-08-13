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
	
	public List<PersonDTO> login(PersonDTO dto) {
		return mybatis.selectList("Person.login",dto);
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
	
	public String loginCheck(String id) {
		return mybatis.selectOne("Person.loginCheck", id);
	}
	
	public String pwCheck(PersonDTO dto) {
		return mybatis.selectOne("Person.pwCheck", dto);
	}
	
	public int loginFail(Map<String,String> param){	
		return mybatis.update("Person.loginFail", param);
	}
	
	public PersonDTO memberInfoById(String sessionID) {
		return mybatis.selectOne("Person.memberInfo",sessionID);
	}
	

}
