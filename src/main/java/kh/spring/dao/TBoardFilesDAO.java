package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.TBoardFilesDTO;

@Component
public class TBoardFilesDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int upload(TBoardFilesDTO dto) {
		return mybatis.insert("TbFiles.upload",dto);
	}

}
