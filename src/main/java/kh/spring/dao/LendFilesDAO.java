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
	
	public int upload(LendFilesDTO dto) {
		return mybatis.insert("LendFiles.upload",dto);
	}
	
	public List<LendFilesDTO> selectAll(int seq){
		return mybatis.selectList("LendFiles.selectAll",seq);
	}
	
	public List<LendFilesDTO> getFiles(List<LendDTO> ldlist){
		
		
		List<Integer> parentSeq = new ArrayList<>();
		for(int i = 0; i<ldlist.size();i++) {
			parentSeq.add(ldlist.get(i).getSeq());
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("parentSeq", parentSeq);
		System.out.println(parentSeq);
		
		List<LendFilesDTO> lflist = mybatis.selectList("LendFiles.selectOne", map);
		System.out.println(lflist.get(0).getSysName());
		
		return mybatis.selectList("LendFiles.selectOne", map);
	}
}
