package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.LendDTO;
import kh.spring.dto.LendFilesDTO;

@Component
public class LendFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//사진 업로드
	public int upload(HashMap<String,Object> map) {
		return mybatis.insert("LendFiles.upload",map);
	}
	
	//사진 리스트
	public List<LendFilesDTO> selectAll(int seq){
		return mybatis.selectList("LendFiles.selectAll",seq);
	}
	
	//사진 이름 가져오기
	public String getSysName(int seq) {
		LendFilesDTO dto = mybatis.selectOne("LendFiles.sysName", seq);
		String sysName = dto.getSysName();
		return sysName;
	}
	
	//사진 삭제 하기
	public int delete(int seq) {
		return mybatis.delete("LendFiles.delete", seq);
	}
	
	public List<LendFilesDTO> getFiles(){
				
		return mybatis.selectList("LendFiles.getList");
	}
	
	public LendFilesDTO repre_picture(int parentseq) {
		return mybatis.selectOne("LendFiles.repre_picture",parentseq);
	}
}
