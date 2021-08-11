package kh.spring.dto;

import java.sql.Date;

public class LendDTO {
	private int seq;
	private String id;
	private String title;
	private String contents;
	private Date regdate;
	
	public LendDTO() {}

	public LendDTO(int seq, String id, String title, String contents, Date regdate) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.regdate = regdate;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
