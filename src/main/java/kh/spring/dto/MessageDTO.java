package kh.spring.dto;

import java.sql.Date;

public class MessageDTO implements Comparable<ChatFileDTO> {
	
	private int seq;
	private String roomid;
	private String id;
	private String message;
	private Date reg_date;
	
	public MessageDTO() {}

	public MessageDTO(int seq, String roomid, String id, String message, Date reg_date) {
		super();
		this.seq = seq;
		this.roomid = roomid;
		this.id = id;
		this.message = message;
		this.reg_date = reg_date;
	}
	
	public MessageDTO(int seq,String roomid, String id, String message) {
		this.seq = seq;
		this.roomid = roomid;
		this.id = id;
		this.message = message;
	}
	
	public MessageDTO(String roomid, String id, String message) {
		this.roomid = roomid;
		this.id = id;
		this.message = message;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public int compareTo(ChatFileDTO o) {
		return this.reg_date.compareTo(o.getReg_date());
	}
}
