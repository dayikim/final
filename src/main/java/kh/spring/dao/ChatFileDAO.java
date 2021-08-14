package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import kh.spring.dto.ChatFileDTO;

@Repository
public class ChatFileDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertFile(ChatFileDTO cfd) {
		return mybatis.insert("ChatFile.insert", cfd);
	}
	
	public List<ChatFileDTO> getList(String roomid) {
		return mybatis.selectList("ChatFile.fileList", roomid);
	}
	
	public ChatFileDTO getFile(int seq) {
		return mybatis.selectOne("ChatFile.getFile", seq);
	}
	
	public int getSeq() {
		return mybatis.selectOne("ChatFile.getSeq");
	}



}
