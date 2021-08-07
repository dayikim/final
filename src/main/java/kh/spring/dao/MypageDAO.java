package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PersonDTO;

@Component
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 마이페이지 정보 출력
	public PersonDTO mypageList(String sessionID){
		return mybatis.selectOne("MyPage.mypageList",sessionID);
	}
	
	//마이페이지정보확인
	public List<PersonDTO> modify(String id){
		return mybatis.selectList("MyPage.modify", id);
	}
	
	//정보수정
	public String modifyProc(PersonDTO dto) {
		return mybatis.selectOne("MyPage.modifyProc", dto);
	}

}
