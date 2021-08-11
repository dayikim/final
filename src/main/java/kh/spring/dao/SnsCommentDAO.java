package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.SnsCommentDTO;

@Component
public class SnsCommentDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(SnsCommentDTO dto) {
		return mybatis.insert("Snscomm.insert", dto);
	}
	
	public List<SnsCommentDTO> replyList(int parentSeq){
		return mybatis.selectList("Snscomm.replyList",parentSeq);
	}
	
	public int delete(int seq) {
		return mybatis.delete("Snscomm.delete", seq);
	}
	
	public String getComment(int seq) {
		return mybatis.selectOne("Snscomm.getComment", seq);
	}
	
	public int modify(Map<String,Object>param) {
		return mybatis.update("Snscomm.modify", param);
	}
	
}
