package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PersonDAO;
import kh.spring.dto.PersonDTO;

@Service
public class PersonService {
	
	@Autowired
	private PersonDAO dao;
	
	public void insert(PersonDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	public int idDuplCheck(String id) {
		return dao.idDuplCheck(id);
	}
	
	public int login(String id, String pw) {
		Map<String,String>param = new HashMap();
		param.put("id", id);
		param.put("pw", pw);
		return dao.login(param);
	}
	
	public String findid(PersonDTO dto) {
		return dao.findid(dto);
	}
	
	public String checkInfo(PersonDTO dto) {
		return dao.checkInfo(dto);
	}
	
	public String pswd(PersonDTO dto) {
		return dao.pswd(dto);
	}
	
	public void resetlogincount(String id) {
		dao.resetlogincount(id);
	}
	
	public int checkid(String id) {
		return dao.checkid(id);
	}
	
	public int failcount(String id) {
		return dao.failcount(id);
	}
	
	public int checkcount(String id) {
		return dao.checkcount(id);
	}

}