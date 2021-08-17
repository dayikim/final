package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

import kh.spring.dto.MessageDTO;

@Repository
public class MessageDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(MessageDTO temp) {
		return mybatis.insert("Message.insert", temp);
	}
	
	public MessageDTO getMessage(int seq) {
		Map <String,String> temp = new HashMap();
		temp.put("seq", String.valueOf(seq));
		temp.put("reg_date", "reg_date");
		return mybatis.selectOne("Message.getMessage", temp);
	}
	
	public int getSeq() {
		return mybatis.selectOne("Message.getSeq");
	}
	
	public List<MessageDTO> pastMessage(String roomid){
		return mybatis.selectList("Message.pastMessage", roomid);
	}
	
	public int unreadCount(String roomid,String id) {
		Map <String,String> temp = new HashMap();
		temp.put("roomid", roomid);
		temp.put("id", id);
		return mybatis.selectOne("Message.unreadCount", temp);
	}
	
	
	
	
}
