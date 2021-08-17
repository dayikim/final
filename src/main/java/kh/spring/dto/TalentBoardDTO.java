package kh.spring.dto;

import java.sql.Date;

public class TalentBoardDTO {
	private int seq;
	private String writer;
	private String kind;
	private String title;
	private String category;
	private String contents;
	private String price;
	private Date regDate;
		
	public TalentBoardDTO() {
			}
	
	public TalentBoardDTO(int seq, String writer, String kind, String title, String category,
			String contents, String price, Date regDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.kind = kind;
		this.title = title;
		this.category = category;
		this.contents = contents;
		this.price = price;
		this.regDate = regDate;

	}
	public int getSeq() {
		return seq;
	}
	public String getWriter() {
		return writer;
	}
	
	public String getKind() {
		return kind;
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
	public Date getRegDate() {
		return regDate;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void getWriter(String writer) {
		this.writer = writer;
	}
	
	public void setKind(String kind) {
		this.kind = kind;
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
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

	

}
