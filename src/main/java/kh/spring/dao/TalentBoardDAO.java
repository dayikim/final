package kh.spring.dao;

import java.util.List;

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
	
	public int sellingCount(String kind) {
		return mybatis.selectOne("TBoard.sellingCount",kind);
	}
	
	public List<TalentBoardDTO> getSellingList(String kind){
		return mybatis.selectList("TBoard.getSellingList",kind);
	}
}
