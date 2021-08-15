package kh.spring.dto;

import java.sql.Date;

public class LendDTO {
	private int seq;
	private String id;
	private String title;
	private Date regdate;
	private String address1;
	private int loanmoney;
	private String contents;
	
	public LendDTO() {}
	
	public LendDTO(int seq, String id, String title, Date regdate, String address1, int loanmoney, String contents) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
		this.address1 = address1;
		this.loanmoney = loanmoney;
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

	public int getLoanmoney() {
		return loanmoney;
	}

	public void setLoanmoney(int loanmoney) {
		this.loanmoney = loanmoney;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	
}
