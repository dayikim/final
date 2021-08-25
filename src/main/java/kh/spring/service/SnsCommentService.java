package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.SnsCommentDAO;
import kh.spring.dto.SnsCommentDTO;

@Service
public class SnsCommentService {

	@Autowired
	private SnsCommentDAO dao;
	
	public int insert(SnsCommentDTO dto) {
		return dao.insert(dto);
	}
	
	public List<SnsCommentDTO> replyList(int parentSeq){
		return dao.replyList(parentSeq);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	public SnsCommentDTO getComment(int seq) {
		return dao.getComment(seq);
	}
	
	public int modify(int seq, String contents) {
		Map<String,Object> param = new HashMap();
		param.put("seq", seq);
		param.put("contents", contents);
		return dao.modify(param);
	}
	
	public int comment_seq() {
		return dao.getCommentSeq();
	}
	
}
