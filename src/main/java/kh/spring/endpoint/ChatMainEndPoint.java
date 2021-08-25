package kh.spring.endpoint;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
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
import kh.spring.service.ChatService;

@ServerEndpoint(value = "/chat/main", configurator = HttpSessionConfigurator.class)
public class ChatMainEndPoint {
	
	private static Map<String,Session> chatmain = Collections.synchronizedMap(new HashMap());
	private HttpSession hsession;
	private ChatService chatService = ApplicationContextProvider.getApplicationContext().getBean(ChatService.class);
	
	
	@OnOpen // 소켓이 열렸을 때, 클라이언트가 챗이라는 것을 열었을 떼?
	public void onConnect(Session session, EndpointConfig config) {
		hsession = (HttpSession) config.getUserProperties().get("hsession");
		chatmain.put((String)hsession.getAttribute("loginID"), session);
	}
		
	@OnMessage
	public void onMessage(Session self, String message, boolean last) throws Exception { 
			
		if(!message.equalsIgnoreCase("")) {
			String friend = chatService.findFriendid(message.split(":")[1].substring(0,36),(String)hsession.getAttribute("loginID"));
			System.out.println((String)hsession.getAttribute("loginID")+"안읽은 message갯수"+message);
			JsonObject json = new JsonObject();
			System.out.println(message);
			json.addProperty("unread", message.split(":")[0]);
			json.addProperty("roomid", message.split(":")[1].substring(0,36));
			json.addProperty("message", message.substring(message.split(":")[1].substring(0,36).length()+2));
			if(chatmain.get(friend) != null) {
				chatmain.get(friend).getBasicRemote().sendText(json.toString());
				}
		}
	}
		
	// 접속했던 session 객체가 연결을 종료하는 순간 해당 룸 아이디를 통해 룸을 확인하고 그 안에 session객체를 삭제한다.
	@OnClose
	public void onClose(Session session) {
		System.out.println("끊기기 전:" + chatmain);
		chatmain.remove((String)hsession.getAttribute("loginID"));
		System.out.println("끊기기 후:" + chatmain);
		System.out.println("ChatMainEndPoint 연결 끊김.");
	}
}
