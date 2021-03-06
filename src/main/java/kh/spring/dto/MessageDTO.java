package kh.spring.dto;

import java.sql.Date;

import kh.spring.API.DateSortable;



public class MessageDTO implements DateSortable{
	
	private int seq;
	private String roomid;
	private String id;
	private String message;
	private Date reg_date;
	private String unread_message;
	
	public MessageDTO() {}

	public MessageDTO(int seq, String roomid, String id, String message, Date reg_date, String unread_message) {
		super();
		this.seq = seq;
		this.roomid = roomid;
		this.id = id;
		this.message = message;
		this.reg_date = reg_date;
		this.unread_message = unread_message;
	}
	
	public MessageDTO(int seq,String roomid, String id, String message, String unread_message) {
		this.seq = seq;
		this.roomid = roomid;
		this.id = id;
		this.message = message;
		this.unread_message=unread_message;
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
	public String getUnread_message() {
		return unread_message;
	}

	public void setUnread_message(String unread_message) {
		this.unread_message = unread_message;
	}

	@Override
	public long getDate() {
		return this.reg_date.getTime();
	}
}
