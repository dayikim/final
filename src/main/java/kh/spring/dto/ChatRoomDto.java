package kh.spring.dto;

import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.Session;

public class ChatRoomDto {
	
	private int seq;
	private String roomid;
	private String sessions;
	private String title;
	private Date reg_date;
	private int board_seq;
	private String board_category;
	
	public ChatRoomDto() {}

	public ChatRoomDto(int seq, String roomid, String sessions, String title, Date reg_date, int board_seq,String board_category) {
		super();
		this.seq = seq;
		this.roomid = roomid;
		this.sessions = sessions;
		this.title = title;
		this.reg_date = reg_date;
		this.board_seq = board_seq;
		this.board_category = board_category;
	}
	public ChatRoomDto(String roomid, String sessions, String title, int board_seq,String board_category) {
		this.roomid = roomid;
		this.sessions = sessions;
		this.title = title;
		this.board_seq = board_seq;
		this.board_category = board_category;
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

	public String getSessions() {
		return sessions;
	}

	public void setSessions(String sessions) {
		this.sessions = sessions;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	@Override
	public boolean equals(Object obj) {
		ChatRoomDto temp = (ChatRoomDto)obj;
		return this.roomid.equalsIgnoreCase(temp.roomid);
	}
	
}
