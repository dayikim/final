package kh.spring.dto;

public class ChatRepositoryDTO {
	
	private int rnum;
	private String roomid;
	private String title;
	private int count;
	
	public ChatRepositoryDTO(int rnum, String roomid, String title, int count) {
		super();
		this.rnum = rnum;
		this.roomid = roomid;
		this.title = title;
		this.count = count;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
