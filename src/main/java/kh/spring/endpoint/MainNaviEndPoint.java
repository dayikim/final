package kh.spring.endpoint;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kh.spring.configurator.HttpSessionConfigurator;

@ServerEndpoint(value = "/navi", configurator = HttpSessionConfigurator.class)
public class MainNaviEndPoint {
	private HttpSession hsession;
	
	@OnOpen // 소켓이 열렸을 때, 클라이언트가 챗이라는 것을 열었을 떼?
	public void onConnect(Session session, EndpointConfig config) throws IOException {
		hsession = (HttpSession) config.getUserProperties().get("hsession");
		System.out.println("Navi 소켓 연결됨!");
	}
	
	@OnClose
	public void close() {
		System.out.println("Navi 연결 끊김.");
	}
	
	
}
