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

	@OnOpen // 소켓이 열렸을 때, 클라이언트가 챗이라는 것을 열었을 떼?
	public void onConnect(Session session, EndpointConfig config) {
		hsession = (HttpSession) config.getUserProperties().get("hsession");
		String roomid = (String) hsession.getAttribute("roomid");
		System.out.println(hsession.getAttribute("loginID"));
		/* 방 번호를 담는 변수를 선언해서 조건문 로직 만들기! */
		System.out.println((String) hsession.getAttribute("createroom"));
		if (hsession.getAttribute("createroom") != null) {
			roomid = chatService.roomid();
			chatService.createRoom(roomid, (String) hsession.getAttribute("loginID"),
					(String) hsession.getAttribute("createroom"));
			chatService.addRoom(roomid, session);
		}
		chatService.joinroom(roomid, session);

	}

	@OnMessage
	public void onMessage(Session self, String message, boolean last) throws Exception { // 자기 자신의 메세지를 받을 수있다.

		System.out.println("메세지 단"+last);
		int seq = messageService.getSeq();
		messageService.insertMessage(seq, (String) hsession.getAttribute("roomid"),
										  (String) hsession.getAttribute("loginID"),message);	
		chatService.sendMessage(messageService.getMessage(seq));
	}
		
	  @OnMessage(maxMessageSize =10485760)
	  public void onBinary(Session self, byte[] msg, boolean last)throws Exception {
		bout.write(msg);
		System.out.println("파일 단"+last);
		System.out.println("파일 입력이 들어옴!");
		System.out.println(msg.toString());
		
		 if (last) {
		chatService.sendImage(fileService.getFile(filecontroller.getSeq()), messageService.toBinary(bout.toByteArray()));
		bout.reset();
		bout.close();
		 }
		
		
		/*
		 * if(last) { JsonObject json = new JsonObject(); json.addProperty("isCheck"
		 * ,"true"); json.addProperty("message" ,fileblob);
		 * self.getBasicRemote().sendBinary(null); }
		 */
	  }
	 

	// 접속했던 session 객체가 연결을 종료하는 순간 해당 룸 아이디를 통해 룸을 확인하고 그 안에 session객체를 삭제한다.
	@OnClose
	public void onClose(Session session) {
		chatService.getRoomList().get((String) hsession.getAttribute("roomid")).remove(session);
		hsession.removeAttribute("roomid");
		hsession.removeAttribute("createroom");
	}

}
