package kh.spring.dto;

import java.sql.Date;

public class LendDTO {
	private int seq;
	private String writer;
	private String title;
	private String category;
	private String contents;
	private int price;
	private String address;
	private Date regdate;
	
	public LendDTO() {}
	
	public LendDTO(int seq, String writer, String title, String category, String contents, int price, String address,
			Date regdate) {
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.category = category;
		this.contents = contents;
		this.price = price;
		this.address = address;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

	
}
