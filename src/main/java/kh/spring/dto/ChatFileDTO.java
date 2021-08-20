package kh.spring.dto;

import java.sql.Date;



public class ChatFileDTO{
	
	private int seq;
	private String oriName;
	private String sysName;
	private Date reg_date;
	private String roomid;
	private String id;
	
	public ChatFileDTO(){}
	
	public ChatFileDTO(int seq, String oriName, String sysName, Date reg_date, String roomid, String id) {
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.reg_date = reg_date;
		this.roomid = roomid;
		this.id = id;
	}
	
	public ChatFileDTO(int seq, String oriName, String sysName,String roomid, String id) {
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.roomid = roomid;
		this.id = id;
	}

	public ChatFileDTO(String oriName, String sysName,String roomid, String id) {
		this.oriName = oriName;
		this.sysName = sysName;
		this.roomid = roomid;
		this.id = id;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
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
	
}
