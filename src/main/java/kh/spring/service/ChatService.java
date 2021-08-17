package kh.spring.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kh.spring.API.NaverApi;
import kh.spring.config.ChatRegx;
import kh.spring.dao.ChatRoomDao;
import kh.spring.dto.ChatFileDTO;
import kh.spring.dto.ChatRepositoryDTO;
import kh.spring.dto.ChatRoomDto;
import kh.spring.dto.MessageDTO;


@Service
public class ChatService  implements InitializingBean {
	
	@Autowired
	MessageService ms;
	
	@Autowired
	ChatRoomDao crd;
	
	@Autowired
	NaverApi na;
	
	@Autowired
	ChatRegx cr;
	
	@Autowired
	HttpSession session;
	
	private static Map<String, List<Session>> rs = Collections.synchronizedMap(new HashMap<String, List<Session>>());
	
	public ChatService() {}
	
	@Override  // 전체 Roomlist를 가져온다.
	public void afterPropertiesSet() throws Exception {
		for(ChatRoomDto crdto: crd.allChatRoomlist()) {
			List<Session> tempList = new ArrayList<Session>();
			rs.put(crdto.getRoomid(),tempList);
		}
	}
	
	//룸리스트에 룸을 만든다.
	public int createRoom(String roomid,String session, String title) {
		ChatRoomDto temp = new ChatRoomDto(roomid, session, title);
		return crd.createRoom(temp);
	}
	//세션에 해당하는 룸리스트만 따로 가져온다.
	public List<ChatRoomDto> getChatRoomlist(String session){
		return crd.getChatRoomlist(session);
	}
	//룸 아이디에 맞는 룸을 가져온다.
	public ChatRoomDto FindById(String roomid){
		return crd.FindById(roomid);
	}
	//룸에 접속한다.
	synchronized public void joinroom(String roomid ,Session session) {
			rs.get(roomid).add(session);
	}
	//룸리스트에서 해당룸을 찾아, 그 안에 있는 세션 리스트에게 메세지를 보낸다. 
	public void sendMessage(MessageDTO md) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm"); //날짜 형식
		List<Session> sessionList = rs.get(md.getRoomid());
		int unread_count =0;
		if(sessionList.size()==1) {
			unread_count = ms.getUnread_count(md.getRoomid(),md.getId());
			System.out.println(md.getRoomid()+"에서 온" + unread_count +"개수");
		}else {
			unread_count=0;
		}
		for(Session session :sessionList) {
			JsonObject json = new JsonObject();
			json.addProperty("loginID", md.getId());
			if(cr.findNaverRegx(md.getMessage()) != null) { // Naver해시태그를 가져온다.
				json.addProperty("search",cr.findNaverRegx(md.getMessage()).substring(1));
				json.addProperty("HashImage" ,na.returnImageJson(cr.findNaverRegx(md.getMessage())));
				json.addProperty("HashBlog" , na.returnBlogJson(cr.findNaverRegx(md.getMessage())));
				json.addProperty("isNaver" ,"true");
			}else if(cr.findlocationRegx(md.getMessage()) != null){ //카카오 맵 가져온다.
				json.addProperty("isLocation" ,"true");
				json.addProperty("search",cr.findlocationRegx(md.getMessage()).substring(2));
			}
			json.addProperty("message" ,md.getMessage());
			json.addProperty("unreadcount", unread_count);
			json.addProperty("trans_time" ,sdf.format(md.getReg_date()));
			session.getBasicRemote().sendText(json.toString());
		}
	}
//	public void sendHashTagMessage(MessageDTO md) throws Exception {
//		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm");
//		for(Session session :rs.get(md.getRoomid())) {
//			JsonObject json = new JsonObject();
//			json.addProperty("loginID", md.getId());
//			json.addProperty("HashImage" ,na.returnImageJson(md.getMessage().substring(1)));
//			json.addProperty("HashBlog" , na.returnBlogJson(md.getMessage().substring(1)));
//			json.addProperty("message" , md.getMessage());
//			json.addProperty("isNaver" ,"true");
//			json.addProperty("trans_time" ,sdf.format(md.getReg_date()));
//			session.getBasicRemote().sendText(json.toString());
//		}
//	}
//	public void sendLocationMessage(MessageDTO md) throws IOException {
//		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm");
//		for(Session session :rs.get(md.getRoomid())) {
//			JsonObject json = new JsonObject();
//			json.addProperty("loginID", md.getId());
//			json.addProperty("message" ,md.getMessage());
//			json.addProperty("isLocation" ,"true");
//			json.addProperty("trans_time" ,sdf.format(md.getReg_date()));
//			session.getBasicRemote().sendText(json.toString());
//		}
//	}
	
	public void sendImage(ChatFileDTO cdf,String file) throws IOException { //이미지를 보낸다.
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm");
		for(Session session :rs.get(cdf.getRoomid())) {
			JsonObject json = new JsonObject();
			json.addProperty("loginID", cdf.getId());
			json.addProperty("message",file);
			json.addProperty("seq",cdf.getSeq());
			json.addProperty("trans_time" ,sdf.format(cdf.getReg_date()));
			json.addProperty("isCheck" ,"true");
			session.getBasicRemote().sendText(json.toString());
		}
	}
	
	
	public String roomid() {
		return UUID.randomUUID().toString();
	}
	
	public void addRoom(String roomid, Session session) {
		List<Session> tempList = new ArrayList<Session>();
		tempList.add(session);
		rs.put(roomid, tempList);
	}
	
	public Map<String, List<Session>> getRoomList(){
		return rs;
	}
	
//	public String transformDate(Date temp) {
//		Date util_date = new Date(temp.getTime());
//		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
//		SimpleDateFormat dateForm = new SimpleDateFormat("HH:mm");
//		dateForm.setTimeZone(tz);
//		return dateForm.format(util_date);
//		
//	}
//	
//	public String convertHour(String temp_time) {
//		String[] split_time = temp_time.split(":");
//		int tempHour = Integer.parseInt(split_time[0]);
//		int convertedhour = tempHour >=15 ? tempHour-15: tempHour+9;
////		return 	tempHour >=15 ? (Integer.parseInt(split_time[0])-15)/10 == 1 ? (Integer.parseInt(split_time[0])-15)+":"+split_time[1]:
////			 					 "0"+(Integer.parseInt(split_time[0])-15)+":"+split_time[1]:
////			 					 (Integer.parseInt(split_time[0])+9)+":"+split_time[1];
//		
//		return convertedhour >=12?   "오후 "+convertedhour+":"+split_time[1] : 
//			   convertedhour/9 ==1 ? "오전 "+convertedhour+":"+split_time[1] : 
//				                     "오전 "+"0"+convertedhour+":"+split_time[1]; 
//	}
	
	
}
	
	
