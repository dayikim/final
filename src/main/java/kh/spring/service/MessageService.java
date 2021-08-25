package kh.spring.service;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.spring.API.DateSortable;
import kh.spring.dao.ChatFileDAO;
import kh.spring.dao.ChatRoomDao;
import kh.spring.dao.MessageDao;
import kh.spring.dto.ChatFileDTO;
import kh.spring.dto.MessageDTO;
@Service
public class MessageService {

	@Autowired
	MessageDao md;
	
	@Autowired
	ChatFileDAO cd;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ChatRoomDao crd;
	
//	public static void main(String[] args) {
//		Date md_date = new Date(2021, 8, 20);
//		Date md_date1 = new Date(2021, 8, 18);
//		Date md_date2 = new Date(2021, 8, 17);
//		Date md_date3 = new Date(2021, 8, 16);
//		Date md_date4 = new Date(2021, 8, 17);
//		
//		
//		Date chat_date0 = new Date(2021, 8, 15);
//		Date chat_date = new Date(2021, 8, 19);
//		Date chat_date3 = new Date(2021, 8, 19);
//		Date chat_date4 = new Date(2021, 8, 21);
//		
//		MessageDTO temp_md = new MessageDTO(1, "2", "Jack", "HI",md_date,"N");
//		MessageDTO temp_md1 = new MessageDTO(1, "2", "Jack", "HI",md_date1,"N");
//		MessageDTO temp_md2 = new MessageDTO(1, "2", "Jack", "HI",md_date2,"N");
//		MessageDTO temp_md3 = new MessageDTO(1, "2", "Jack", "HI",md_date3,"N");
//		MessageDTO temp_md4 = new MessageDTO(1, "2", "Jack", "HI",md_date4,"N");
//		
//		ChatFileDTO temp_cfd0 = new ChatFileDTO(1, "2", "2", chat_date0, null, "Jack");
//		ChatFileDTO temp_cfd = new ChatFileDTO(1, "2", "2", chat_date, null, "Jack");
//		ChatFileDTO temp_cfd1 = new ChatFileDTO(1, "2", "2", chat_date1, null, "Jack");
//		ChatFileDTO temp_cfd2 = new ChatFileDTO(1, "2", "2", chat_date2, null, "Jack");
//		ChatFileDTO temp_cfd3 = new ChatFileDTO(1, "2", "2", chat_date3, null, "Jack");
//		ChatFileDTO temp_cfd4 = new ChatFileDTO(1, "2", "2", chat_date4, null, "Jack");
//		
//		List<Object> li = new ArrayList<Object>();
//		li.add(temp_md);
//		li.add(temp_md1);
//		li.add(temp_md2);
//		li.add(temp_md3);
//		li.add(temp_md4);
//		
//		li.add(temp_cfd0);
//		li.add(temp_cfd);
//		li.add(temp_cfd1);
//		li.add(temp_cfd2);
//		li.add(temp_cfd3);
//		li.add(temp_cfd4);
//		
//		Collections.sort(li, new Comparator<Object>() {
//
//			@Override
//			public int compare(Object o1, Object o2) {
//				System.out.println("발동");
//				if(o2 instanceof MessageDTO && o1 instanceof ChatFileDTO) {
//					return ((ChatFileDTO)o1).getReg_date().compareTo(((MessageDTO)o2).getReg_date());
//				} else if(o1 instanceof MessageDTO && o2 instanceof MessageDTO) {
//					return ((MessageDTO)o1).getReg_date().compareTo(((MessageDTO)o2).getReg_date());
//				} else if(o1 instanceof MessageDTO && o2 instanceof ChatFileDTO) {
//					System.out.println(o1 instanceof ChatFileDTO);
//					System.out.println(o2 instanceof MessageDTO);
//					return ((ChatFileDTO)o2).getReg_date().compareTo(((MessageDTO)o1).getReg_date());
//				} else if (o1 instanceof ChatFileDTO && o2 instanceof ChatFileDTO) {
//					return ((ChatFileDTO)o1).getReg_date().compareTo(((ChatFileDTO)o2).getReg_date());
//				}
//				return 0;
//			}
//		});
//		
//		for(Object obj : li) {
//			if(obj instanceof ChatFileDTO) {
//				System.out.println("chatDTO파일 날짜: " + ((ChatFileDTO)obj).getReg_date());
//			}else {
//				System.out.println("메세지DTO 날짜: " + ((MessageDTO)obj).getReg_date());
//			}
//		}
//		
//	}
	
	public int insertMessage(int seq,String roomid,String id, String message, String unread) {
		return md.insert(new MessageDTO(seq,roomid, id, message,unread));
	}
	
	public MessageDTO getMessage(int seq) {
		return md.getMessage(seq);
	}
	
	
	public int getSeq() {
		return md.getSeq();
	}
	
	public int getUnread_count(String roomid, String id) {
		return md.unreadCount(roomid,id);
	}
	
	public Map<String, List<DateSortable>> pastMessage(String roomid) throws Exception{
		Map<String, List<DateSortable>> temp = new TreeMap<String, List<DateSortable>>();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		for(MessageDTO message: md.pastMessage(roomid)) {
			if(temp.containsKey(sd.format(message.getReg_date()))) {
				temp.get(sd.format(message.getReg_date())).add(message);
			}else {
				List<DateSortable> li = new ArrayList<DateSortable>();
				li.add(message);
				temp.put(sd.format(message.getReg_date()), li);
			}
		}
		
		for(ChatFileDTO file:cd.getList(roomid)) {
			if(temp.containsKey(sd.format(file.getReg_date()))) {
				file.setSysName(toBinary(session,file.getSysName()));
				temp.get(sd.format(file.getReg_date())).add(file);
			}else {
				List<DateSortable> li = new ArrayList<DateSortable>();
				file.setSysName(toBinary(session,file.getSysName()));
				li.add(file);
				temp.put(sd.format(file.getReg_date()), li);
			}
		}
		
		Iterator<String> keys = temp.keySet().iterator();
		while(keys.hasNext()) {
			String temp_key = keys.next();
			if(temp.get(temp_key) != null){
				Collections.sort(temp.get(temp_key), new Comparator<DateSortable>() {
			         @Override
			         public int compare(DateSortable o1, DateSortable o2) {
			            long v1 = o1.getDate();
			            long v2 = o2.getDate();   
			         
			            return (int)(v1-v2);
			         }
			      });
			}
		}
		return temp;
	}
	
	public String alarmRoom(String roomid) {
		JsonObject json = new JsonObject();
		Gson gs = new Gson();
		json.addProperty("createroom",gs.toJson(crd.FindById(roomid)));
		return json.toString();
	}
	
	public String toBinary(HttpSession session,String sysName) throws Exception {
		return Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("files")+"/"+sysName));
	}
	
	public String toBinary(byte[] date) throws Exception {
		return Base64.getEncoder().encodeToString(date);
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
	
	public int readTounread(String roomid,String id) {
		return md.readTounread(roomid,id);
	}	
	
	public String lastestMessage(String roomid) {
		return md.lastestMessage(roomid);
	}
}
