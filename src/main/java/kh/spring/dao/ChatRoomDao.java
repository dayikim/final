package kh.spring.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ChatRepositoryDTO;
import kh.spring.dto.ChatRoomDto;


@Repository
public class ChatRoomDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int createRoom(ChatRoomDto chat) {
		return mybatis.insert("Chat.insert", chat);
	}
	
	public List<ChatRoomDto> allChatRoomlist(){
		return mybatis.selectList("Chat.allList");
	}
	
	public List<ChatRoomDto> getChatRoomlist(String session){
		return mybatis.selectList("Chat.getList",session);
	}
	
	public ChatRoomDto FindById(String roomid){
		return mybatis.selectOne("Chat.FindById",roomid);
	}
	
	public String findFriendId(Map<String,String> temp) {	
	return mybatis.selectOne("Chat.FindByFriendId",temp);
	}
	
}
