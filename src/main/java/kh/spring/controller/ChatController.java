package kh.spring.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.config.ChatRegx;
import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dto.ChatRoomDto;
import kh.spring.service.ChatService;
import kh.spring.service.FileService;
import kh.spring.service.LendService;
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
	private LendService ls; 
	
	@Autowired
	private MypageService myservice;
	
	@Autowired
	private ProfileFilesDAO pffd;
	
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
	public String chat(Model md) throws Exception {
		md.addAttribute("list", cs.getfreindList((String)session.getAttribute("loginID")));
		md.addAttribute("unread_count", ms);
		md.addAttribute("waiting", "true");
		List<String> li = new ArrayList<String>();
		for(ChatRoomDto crd:  cs.getChatRoomlist((String)session.getAttribute("loginID"))) {
				  
			String tobinaury = pffd.profileSelect(cs.findFriendid(crd.getRoomid(), (String)session.getAttribute("loginID"))) != null ?
					cs.toBinary(session ,pffd.profileSelect(cs.findFriendid(crd.getRoomid(), (String)session.getAttribute("loginID"))).getSysName()) :
						null;
			li.add(tobinaury);
		}
		md.addAttribute("profile", li);
		return "chat/chatingRoom";
	}
	
	@RequestMapping("createRoom")
	public String createRoom(String board_seq, String board_category) {
		String roomid = cs.roomid();
		
		if(cs.dupleCheckRoom((String)session.getAttribute("loginID"), board_seq, board_category)==0)
		{
			cs.createRoomMy(roomid,ls.detailView(Integer.parseInt(board_seq)),session ,Integer.parseInt(board_seq) , board_category);
			session.setAttribute("roomid", roomid);
			session.setAttribute("createRoom",true);
		}
		return "redirect:waitingroom";
	}
	
	@RequestMapping("")
	public String joinroom(String roomid, Model md) throws Exception {
		System.out.println("toChat으로 들어올때 확인된 roomid: "+roomid);
		if(session.getAttribute(roomid) == null) session.setAttribute("roomid", roomid);
		else {
			session.setAttribute("roomid", roomid);
		}
		md.addAttribute("list", cs.getChatRoomlist((String)session.getAttribute("loginID"))); // 이거 친구 리스트로 가져와야함.
		md.addAttribute("pastMessage", ms.pastMessage(roomid));
		md.addAttribute("time", new SimpleDateFormat("a h:mm"));
		String myprofile_tobinary = myservice.profileSelect((String)session.getAttribute("loginID")) != null? 
				cs.toBinary(session, myservice.profileSelect((String)session.getAttribute("loginID")).getSysName()): null;
		String friendprofile_tobinary = myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))) != null? 
				cs.toBinary(session, myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))).getSysName()) : null;
		md.addAttribute("profile_img",myprofile_tobinary);
		md.addAttribute("friend_profile_img",friendprofile_tobinary);
		md.addAttribute("regex",cr);
		md.addAttribute("info", cs.getboardInfo(roomid, (String)session.getAttribute("loginID")));
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
	
	@RequestMapping(value ="additionRoom",produces="text/html;charset=utf8")
	@ResponseBody
	public String additionRoom(String roomid) {
		Gson gs = new Gson();
		return gs.toJson(cs.FindByFreindRoominfo(roomid, (String)session.getAttribute("loginID")));
	}
	

	@RequestMapping(value ="additionprofile",produces="text/html;charset=utf8")
	@ResponseBody
	public String additionprofile(String roomid) throws Exception {
		String friendprofile_tobinary = myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))) != null? 
				cs.toBinary(session, myservice.profileSelect(cs.findFriendid(roomid,(String)session.getAttribute("loginID"))).getSysName()) : null;
		return friendprofile_tobinary;
	}

}
