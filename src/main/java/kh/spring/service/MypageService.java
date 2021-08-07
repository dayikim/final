package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MypageDAO;
import kh.spring.dao.PersonDAO;
import kh.spring.dto.PersonDTO;

@Service
public class MypageService {
	
	@Autowired
	private MypageDAO dao;
	
	// 마이페이지 정보 출력
	public PersonDTO mypageList(String sessionID){
		return dao.mypageList(sessionID);
	}
	
	// 마이페이지정보확인
	public List<PersonDTO>modify(String id){
		return dao.modify(id);
	}
	
	//	정보수정
	public String modifyProc(PersonDTO dto) {
		return dao.modifyProc(dto);
	}

}
