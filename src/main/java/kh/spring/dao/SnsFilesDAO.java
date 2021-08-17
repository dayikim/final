package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.SnsFilesDTO;

@Component
public class SnsFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(Map<String,Object>param) {
		return mybatis.insert("SnsFile.file",param );
	}
	
	public List<SnsFilesDTO> fileList(){
		return mybatis.selectList("SnsFile.fileList");
	} 

}
