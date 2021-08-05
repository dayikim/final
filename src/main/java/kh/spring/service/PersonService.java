package kh.spring.service;

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
	
	public int login(PersonDTO dto) {
		return dao.login(dto);
	}
	
	public String findid(PersonDTO dto) {
		return dao.findid(dto);
	}

}
