package kh.spring.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import kh.spring.config.ChatRegx;

import kh.spring.service.ChatService;
import kh.spring.service.FileService;
import kh.spring.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private HttpSession session;
		
	@Autowired
	private ChatService cs;
	
	@Autowired
	private MessageService ms;
	
	@Autowired
	private FileService fs;
	
	@Autowired
	private ChatRegx cr;
	
	/*
	 * @RequestMapping("") String home() { return "home";}
	 */
	/* @RequestMapping("/") */
//	public String chat(String roomid, Model md) throws Exception {
//		session.setAttribute("roomid", roomid);
//		md.addAttribute("pastMessage", ms.pastMessage(roomid));
//		md.addAttribute("time", new SimpleDateFormat("a h:mm"));
//		md.addAttribute("regex",cr);
//		return "chat/chat";
//		 }
	@RequestMapping("")
	public String chat(Model md) {
		md.addAttribute("list", cs.getChatRoomlist((String)session.getAttribute("loginID")));
		md.addAttribute("waiting", "true");
		return "chat/chat";
	}
	
	@RequestMapping("toChat")
	public String joinroom(String roomid, Model md) throws Exception {
		session.setAttribute("roomid", roomid);
		md.addAttribute("list", cs.getChatRoomlist((String)session.getAttribute("loginID")));
		md.addAttribute("pastMessage", ms.pastMessage(roomid));
		md.addAttribute("time", new SimpleDateFormat("a h:mm"));
		md.addAttribute("regex",cr);
		return "chat/chat";
	}
	
//	@RequestMapping("waitiingRoom")
//	public String toMain(Model md) {
//		session.setAttribute("loginID","Jack");
//		md.addAttribute("list", cs.allChatRoomlist());
//		return "chatingRoom";
//		
//	}
	
	@RequestMapping("popup")
	public String toPopup() {
		return "popup";}
	
	@RequestMapping("createroom")
	public String createRoom(String roomtitle) {
		session.setAttribute("createroom",roomtitle);
		return "redirect:/toChat";
	}
	
	@RequestMapping("test")
	public String test(String roomtitle) {
		session.setAttribute("createroom",roomtitle);
		return "websocket";
	}
	
	
//    @RequestMapping(value="chatlist", produces = "text/html; charset=utf-8")
//	@RequestMapping("chatingRoom")
//	public String sendList(Model md) {
//		md.addAttribute("list", chatRepo.getRoomRepository());
//		return "chatingRoom";
//	}
}
