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
	
	public int getSeq() {
		return mybatis.selectOne("SnsFile.getSeq");
	}
	
	public int insert(Map<String,Object>param) {
		return mybatis.insert("SnsFile.insert",param );
	}
	
	public List<SnsFilesDTO> fileList(){
		return mybatis.selectList("SnsFile.fileList");
	} 
	
	public void delete(int seq) {
		mybatis.delete("SnsFile.delete", seq);
	}
	
	public int deleteFile(int seq) {
		return mybatis.delete("SnsFile.deleteFile", seq);
	}
	
	public List<SnsFilesDTO> modiFile(int parent){
		return mybatis.selectList("SnsFile.modiFile", parent);
	}

	public List<SnsFilesDTO> snsgetFileList(Map<String,Integer> temp){
		return mybatis.selectList("SnsFile.snsFile", temp);
	}
}
