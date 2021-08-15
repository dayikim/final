package kh.spring.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChatFileDAO;
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
	
	public int insertMessage(int seq,String roomid,String id, String message) {
		return md.insert(new MessageDTO(seq,roomid, id, message));
	}
	
	public MessageDTO getMessage(int seq) {
		return md.getMessage(seq);
	}
	
	
	public int getSeq() {
		return md.getSeq();
	}
	
	public Map<String, List<Object>> pastMessage(String roomid) throws Exception{
		Map<String, List<Object>> temp = new HashMap<String, List<Object>>();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		for(MessageDTO message: md.pastMessage(roomid)) {
			if(temp.containsKey(sd.format(message.getReg_date()))) {
				temp.get(sd.format(message.getReg_date())).add(message);
			}else {
				List<Object> li = new ArrayList<Object>();
				temp.put(sd.format(message.getReg_date()), li);
			}
		}
		
		for(ChatFileDTO file:cd.getList(roomid)) {
			if(temp.containsKey(sd.format(file.getReg_date()))) {
				file.setSysName(toBinary(session,file.getSysName()));
				temp.get(sd.format(file.getReg_date())).add(file);
			}else {
				List<Object> li = new ArrayList<Object>();
				file.setSysName(toBinary(session,file.getSysName()));
				temp.put(sd.format(file.getReg_date()), li);
			}
		}
		
		System.out.println(temp);
		return temp;
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
	
}
