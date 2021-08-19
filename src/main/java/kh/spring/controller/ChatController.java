package kh.spring.controller;

import java.text.SimpleDateFormat;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import kh.spring.config.ChatRegx;

import kh.spring.service.ChatService;
import kh.spring.service.FileService;
import kh.spring.service.MessageService;
import kh.spring.service.MypageService;

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
	
	@Autowired
	private MypageService myservice;
	
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
	@RequestMapping("waitingroom")
	public String chat(Model md) {
		md.addAttribute("list", cs.getChatRoomlist((String)session.getAttribute("loginID")));
		md.addAttribute("waiting", "true");
		return "chat/chatingRoom";
	}
	
	@RequestMapping("")
	public String joinroom(String roomid, Model md) throws Exception {
		System.out.println("toChat으로 들어올때 확인된 roomid: "+roomid);
		if(session.getAttribute(roomid) == null) session.setAttribute("roomid", roomid);
		else {
			session.setAttribute("roomid", roomid);
		}
		md.addAttribute("list", cs.getChatRoomlist((String)session.getAttribute("loginID")));
		md.addAttribute("pastMessage", ms.pastMessage(roomid));
		md.addAttribute("time", new SimpleDateFormat("a h:mm"));
		String myprofile_tobinary = myservice.profileSelect((String)session.getAttribute("loginID")) != null? 
				cs.toBinary(session, myservice.profileSelect((String)session.getAttribute("loginID")).getSysName()): null;
		String friendprofile_tobinary = myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))) != null? 
				cs.toBinary(session, myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))).getSysName()) : null;
		md.addAttribute("profile_img",myprofile_tobinary);
		md.addAttribute("friend_profile_img",friendprofile_tobinary);
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
