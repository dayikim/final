package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.TalentBoardDTO;

@Component
public class TalentBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int boardWrite(TalentBoardDTO dto) {
		return mybatis.insert("TBoard.insert",dto);
	}
	public TalentBoardDTO detailView(int seq) {
		return  mybatis.selectOne("TBoard.detailView",seq);
	}
	
	public int getSeq(){
		return mybatis.selectOne("TBoard.getSeq");
	}
	public List<TalentBoardDTO> getAllList() {
		return mybatis.selectList("TBoard.getAllList");
		
	}
	public int delete(int seq) {
		return mybatis.delete("TBoard.delete",seq);
	}
	public int booking(Map<String, Object> param) {
		return mybatis.delete("TBoard.booking",param);
	}
	
	
}
