package kh.spring.dto;

import java.sql.Date;

public class SnsCommentDTO {
	private int seq ;
	private String id;
	private String contents;
	private int parentSeq;
	private Date regDate;
	
	public SnsCommentDTO() {}

	public SnsCommentDTO(int seq, String id, String contents, int parentSeq, Date regDate) {
		super();
		this.seq = seq;
		this.id = id;
		this.contents = contents;
		this.parentSeq = parentSeq;
		this.regDate = regDate;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	
	
	
	

}
