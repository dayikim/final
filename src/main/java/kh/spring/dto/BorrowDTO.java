package kh.spring.dto;

import java.sql.Date;

public class BorrowDTO {
	private int seq;
	private String id;
	private String title;
	private int loanmoney;
	private Date regdate;
	private String address1;
	private String contents;
	
	public BorrowDTO() {}

	public BorrowDTO(int seq, String id, String title, int loanmoney, Date regdate, String address1, String contents) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.loanmoney = loanmoney;
		this.regdate = regdate;
		this.address1 = address1;
		this.contents = contents;
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
	public int getLoanmoney() {
		return loanmoney;
	}
	public void setLoanmoney(int loanmoney) {
		this.loanmoney = loanmoney;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

}
