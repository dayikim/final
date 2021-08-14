package kh.spring.dto;

import java.sql.Date;

public class LoveDTO {
	
	private int seq;
	private int love;
	private Date regDate;
	private String id;
	private int parentSeq;
	
	public LoveDTO() {}

	public LoveDTO(int seq, int love, Date regDate, String id, int parentSeq) {
		super();
		this.seq = seq;
		this.love = love;
		this.regDate = regDate;
		this.id = id;
		this.parentSeq = parentSeq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}


	

}
