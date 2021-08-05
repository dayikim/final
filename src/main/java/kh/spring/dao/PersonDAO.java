package kh.spring.dao;

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

}
