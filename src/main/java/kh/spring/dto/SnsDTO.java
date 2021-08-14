package kh.spring.dto;

import java.sql.Date;

public class SnsDTO {
	private int seq;
	private String id;
	private String contents;
	private String category;
	private String region;
	private Date regDate;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getLove() {
		return love;
	}
	public void setLove(int love) {
		this.love = love;
	}
	private int love;
	
	public SnsDTO() {};	
	public SnsDTO(int seq, String id, String contents, String category, String region, Date regDate,int love) {
		super();
		this.seq = seq;
		this.id = id;
		this.contents = contents;
		this.category = category;
		this.region = region;
		this.regDate = regDate;
		this.love = love;
	}
}
