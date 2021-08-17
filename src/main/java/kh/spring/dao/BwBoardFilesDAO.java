package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowBoardFilesDTO;

@Component
public class BwBoardFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int upload(BorrowBoardFilesDTO dto) {
		return mybatis.insert("BwFiles.upload",dto);
	}
}
