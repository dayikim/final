package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.SellTalentDTO;

@Component
public class SellTalentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int boardWrite(SellTalentDTO dto) {
		return mybatis.insert("Selltalent.write",dto);
	}
	
	public SellTalentDTO detailView(int seq) {
		return  mybatis.selectOne("Selltalent.detailView",seq);
	}
	
	public int getSeq(){
		return mybatis.selectOne("Selltalent.getSeq");
	}
	public List<SellTalentDTO> getAllList() {
		return mybatis.selectList("Selltalent.getAllList");
		
	}
	public int delete(int seq) {
		return mybatis.delete("Selltalent.delete",seq);
	}

	public String getId() {
		return mybatis.selectOne("Selltalent.getId");
	}

	
}
