package kh.spring.dto;

import java.sql.Date;

public class SellTalentDTO {
	private int seq;
	private String writer;
	private String title;
	private String category;
	private String contents;
	private String price;
	private String address;
	private Date regDate;
	
	public SellTalentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellTalentDTO(int seq, String writer, String title, String category, String contents, String price,
			String address, Date regDate) {
		//super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.category = category;
		this.contents = contents;
		this.price = price;
		this.address = address;
		this.regDate = regDate;
	}
	public int getSeq() {
		return seq;
	}
	public String getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public String getCategory() {
		return category;
	}
	public String getContents() {
		return contents;
	}
	public String getPrice() {
		return price;
	}
	public String getAddress() {
		return address;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
