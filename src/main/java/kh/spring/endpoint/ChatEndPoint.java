package kh.spring.endpoint;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import kh.spring.configurator.ApplicationContextProvider;
import kh.spring.configurator.HttpSessionConfigurator;
import kh.spring.controller.FileController;
import kh.spring.service.ChatService;
import kh.spring.service.FileService;
import kh.spring.service.MessageService;

@ServerEndpoint(value = "/chat", configurator = HttpSessionConfigurator.class)
public class ChatEndPoint {

	private HttpSession hsession;
//	private ChatRoom cr = ApplicationContextProvider.getApplicationContext().getBean(ChatRoom.class);
//	private chatroomRepository chatRepo = ApplicationContextProvider.getApplicationContext().getBean(chatroomRepository.class);
	private ChatService chatService = ApplicationContextProvider.getApplicationContext().getBean(ChatService.class);
	private MessageService messageService = ApplicationContextProvider.getApplicationContext()
			.getBean(MessageService.class);

	private FileService fileService = ApplicationContextProvider.getApplicationContext().getBean(FileService.class);
	private FileController filecontroller = ApplicationContextProvider.getApplicationContext().getBean(FileController.class);
	private ByteArrayOutputStream bout = new ByteArrayOutputStream();

	private String roomid;
	
	@OnOpen // 소켓이 열렸을 때, 클라이언트가 챗이라는 것을 열었을 떼?
	public void onConnect(Session session, EndpointConfig config) throws IOException {
		hsession = (HttpSession) config.getUserProperties().get("hsession");
		roomid = (String) hsession.getAttribute("roomid");
		System.out.println("open이 될 시 열리는 roomid: "+roomid);
//		if(roomid != null) {
//			if (hsession.getAttribute("createroom") != null) {
//				String create_roomid = chatService.roomid();
//				chatService.createRoom(create_roomid, (String) hsession.getAttribute("loginID"),
//											   (String) hsession.getAttribute("createroom"));
//				chatService.addRoom(create_roomid, session);
//				chatService.joinroom(create_roomid, session);
//			}
		boolean isCreate = (Boolean)hsession.getAttribute("createRoom") != null ? (Boolean)hsession.getAttribute("createRoom") : false; 
		if(isCreate) {
			chatService.addRoom(roomid, session);
			//session.getBasicRemote().sendText(chatService.toGson(chatService.findFriendid(roomid, (String)hsession.getAttribute("loginID"))));
		}else {
			chatService.joinroom(roomid, session);
		}
		messageService.readTounread(roomid,(String) hsession.getAttribute("loginID"));
		}
	
	
	@OnMessage
	public void onMessage(Session self, String message, boolean last) throws Exception { // 자기 자신의 메세지를 받을 수있다.

		int seq = messageService.getSeq();
		String unread = chatService.getRoomList().get((String) hsession.getAttribute("roomid")).size() ==1 ? "Y":"N";
		messageService.insertMessage(seq, (String) hsession.getAttribute("roomid"),
										  (String) hsession.getAttribute("loginID"),message,unread);
		chatService.sendMessage(messageService.getMessage(seq),hsession);
	}
		
	  @OnMessage(maxMessageSize =10485760)
	  public void onBinary(Session self, byte[] msg, boolean last)throws Exception {
		bout.write(msg);
		
		 if (last) {
		chatService.sendImage(hsession,fileService.getFile(filecontroller.getSeq()), messageService.toBinary(bout.toByteArray()));
		bout.reset();
		bout.close();
		 }
	  }
	 

	// 접속했던 session 객체가 연결을 종료하는 순간 해당 룸 아이디를 통해 룸을 확인하고 그 안에 session객체를 삭제한다.
	@OnClose
	public void onClose(Session session) {
		System.out.println("세션이 종료됨.");
		String createroom = (String)hsession.getAttribute("createroom");
		chatService.getRoomList().get(roomid).remove(session);
	}
	

}
