package kh.spring.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.JSONObject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.spring.API.NaverApi;
import kh.spring.config.ChatRegx;
import kh.spring.dao.BorrowDAO;
import kh.spring.dao.BwBoardFilesDAO;
import kh.spring.dao.ChatRoomDao;
import kh.spring.dao.LendDAO;
import kh.spring.dao.LendFilesDAO;
import kh.spring.dao.MessageDao;
import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dao.RequestTalentDAO;
import kh.spring.dao.SellTalentDAO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.ChatFileDTO;
import kh.spring.dto.ChatRepositoryDTO;
import kh.spring.dto.ChatRoomDto;
import kh.spring.dto.LendDTO;
import kh.spring.dto.MessageDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;


@Service
public class ChatService  implements InitializingBean {
	
	@Autowired
	MessageDao ms;
	
	@Autowired
	ChatRoomDao crd;
	
	@Autowired
	LendDAO ldao;
	
	@Autowired
	BorrowDAO borrwdao;
	
	@Autowired
	SellTalentDAO std;
	
	@Autowired
	RequestTalentDAO rtd;
	
	@Autowired
	NaverApi na;
	
	@Autowired
	ChatRegx cr;
	
	@Autowired
	ProfileFilesDAO pffd;
	
	@Autowired
	BwBoardFilesDAO bbfd;
	
	@Autowired
	LendFilesDAO lfdao;
	
	private static Map<String, List<Session>> rs = Collections.synchronizedMap(new HashMap<String, List<Session>>());
	
	public ChatService() {}
	
	@Override  // 전체 Roomlist를 가져온다.
	public void afterPropertiesSet() throws Exception {
		for(ChatRoomDto crdto: crd.allChatRoomlist()) {
			List<Session> tempList = new ArrayList<Session>();
			rs.put(crdto.getRoomid(),tempList);
		}
	}
	

	//룸DB에 자신의 룸을 만든다. (1:1 대화)
	public void createRoomMy(String roomid,Object ld,HttpSession session,int board_seq,String board_category) {
		
		String writer = "";
		String title ="";
		switch (board_category) {
			case "lend":  //대여 하기 카테고리별 룸 생성.
				LendDTO lend_temp = ldao.detailview(board_seq);
				writer = lend_temp.getWriter();
				title = lend_temp.getTitle();
				break;
			case "borrow": //대여 요청 카테고리별 룸 생성.
				BorrowDTO borrow_temp = borrwdao.detailview(board_seq);
				writer = borrow_temp.getWriter();
				title = borrow_temp.getTitle();
				break;
			case "talent_selling" ://재능 기부 카테고리별 룸 생성.
				SellTalentDTO selltal_temp = std.detailView(board_seq);
				writer= selltal_temp.getWriter();
				title = selltal_temp.getTitle();
				break;
			case "talent_request" : //재능 요청 카테고리별 룸 생성.
				RequestTalentDTO reque_temp = rtd.detailView(board_seq);
				writer = reque_temp.getWriter();
				title = reque_temp.getTitle();
				break;
		}
		crd.createRoom(new ChatRoomDto(roomid,writer,title,board_seq, board_category));
		crd.createRoom(new ChatRoomDto(roomid,(String)session.getAttribute("loginID"), title,board_seq, board_category));
	}
	
	public Object getboardInfo(String roomid,String id) {
		
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("roomid", roomid);
		temp.put("id", id);
		ChatRoomDto room_temp = crd.FindByRoominfo(temp);
		switch (room_temp.getBoard_category()) {
		case "lend": 
			return ldao.detailview(room_temp.getBoard_seq());
		case "borrow": 
			return borrwdao.detailview(room_temp.getBoard_seq());
		case "talent_selling": 
			return std.detailView(room_temp.getBoard_seq());
		case "talent_request": 
			return rtd.detailView(room_temp.getBoard_seq());
		default: return null;
		}
	}
	
	public String getChatPicture(String roomid,String id,HttpSession session) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("roomid", roomid);
		temp.put("id", id);
		ChatRoomDto room_temp = crd.FindByRoominfo(temp);
		String toBinary ="";
		switch (room_temp.getBoard_category()) {
		case "lend": 
			toBinary = lfdao.repre_picture(room_temp.getBoard_seq()) != null?  
					Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("resources/imgs/lend")+"/"+lfdao.repre_picture(room_temp.getBoard_seq()).getSysName())): null;
			break;
			
		case "borrow": 
			toBinary = bbfd.repre_picture(room_temp.getBoard_seq()) != null?  
					Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("resources/imgs/borrow")+"/"+bbfd.repre_picture(room_temp.getBoard_seq()).getSysName())): null;
			break;
		}
		return toBinary;
	}
	
	
	//세션에 해당하는 룸리스트만 따로 가져온다.
	public List<ChatRoomDto> getChatRoomlist(String session){
		return crd.getChatRoomlist(session);
	}
	//룸 아이디에 맞는 룸을 가져온다.
//	public ChatRoomDto FindById(String roomid){
//		return crd.FindById(roomid);
//	}
	//룸에 접속한다.
	synchronized public void joinroom(String roomid ,Session session) {
			rs.get((String)roomid).add(session);
	}
	
	synchronized public void remove(String roomid,Session session) {
		rs.get((String)roomid).remove(session);
	}
	
	//룸리스트에서 해당룸을 찾아, 그 안에 있는 세션 리스트에게 메세지를 보낸다. 
	public synchronized void sendMessage(MessageDTO md,HttpSession hsession) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm"); //날짜 형식
		List<Session> sessionList = rs.get(md.getRoomid());
		
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
			
			String profile_binary =pffd.profileSelect((String)hsession.getAttribute("loginID")) != null ? 
									toBinary(hsession,pffd.profileSelect((String)hsession.getAttribute("loginID")).getSysName()):
									null;
			json.addProperty("profile_image",profile_binary);
			json.addProperty("message" ,md.getMessage());
			json.addProperty("roomid", md.getRoomid());
			json.addProperty("unreadcount", ms.unreadCount(md.getRoomid()));
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
	
	public synchronized void sendImage(HttpSession hsession,ChatFileDTO cdf,String file) throws Exception { //이미지를 보낸다.
		SimpleDateFormat sdf = new SimpleDateFormat("a h:mm");
		List<Session> sessionList = rs.get(cdf.getRoomid());
		for(Session session :sessionList) {
			JsonObject json = new JsonObject();
			json.addProperty("loginID", cdf.getId());
			String profile_binary =pffd.profileSelect((String)hsession.getAttribute("loginID")) != null ? 
					toBinary(hsession,pffd.profileSelect((String)hsession.getAttribute("loginID")).getSysName()):
					null;
			json.addProperty("profile_image",profile_binary);
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
	
	public String toBinary(HttpSession session,String sysName) throws Exception {
		return Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("resources/imgs/mypage")+"/"+sysName));
	}
	
	private byte[] getFileBinary(String filepath) {
		File file = new File(filepath);
		byte[] data = new byte[(int) file.length()];
		try (FileInputStream stream = new FileInputStream(file)) {
			stream.read(data, 0, data.length);
		} catch (Throwable e) {
			e.printStackTrace();
		}
			return data;
	}
	
	public String findFriendid(String roomid, String id) {
		Map<String,String> temp = new HashMap<String, String>();
		temp.put("roomid", roomid);
		temp.put("id",id);
		return crd.findFriendId(temp);
	}
	
	public ChatRoomDto FindByRoominfo(String roomid, String id) {
		
		Map<String,String> temp = new HashMap<String, String>();
		temp.put("roomid", roomid);
		temp.put("id",id);
		return crd.FindByRoominfo(temp);
	}
	
	public ChatRoomDto FindByFreindRoominfo(String roomid, String id) {
		
		Map<String,String> temp = new HashMap<String, String>();
		temp.put("roomid", roomid);
		temp.put("id",id);
		return crd.FindByFreindRoominfo(temp);
	}
	
	public String toGson(Object src) {
		Gson gs = new Gson();
		JsonObject json = new JsonObject();
		json.addProperty("createroom", gs.toJson(src));
		return json.toString();
	}
	
	public List<ChatRoomDto> getfreindList(String id){
		return crd.friendList(id);
	}
	
	public int dupleCheckRoom(String id,String board_seq,String board_category) {
		Map<String, String> temp = new HashMap<String, String>();
		temp.put("id", id);
		temp.put("board_seq", board_seq);
		temp.put("category", board_category);
		return crd.dupleCheckRoom(temp);
	}
	
}
	
	
