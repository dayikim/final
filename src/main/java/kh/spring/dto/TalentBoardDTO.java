package kh.spring.dto;

import java.sql.Date;

public class TalentBoardDTO {
	private int seq;
	private String id;
	private String kind;
	private String title;
	private String category;
	private String contents;
	private String price;
	
	private Date regDate;

	public TalentBoardDTO(int seq, String id,String kind,String title, String category, String contents, String price,
			Date regDate) {
		super();
		this.seq = seq;
		this.id = id;
		this.kind = kind;
		this.title = title;
		this.category = category;
		this.contents = contents;
		this.price = price;
		this.regDate = regDate;
	}
	public TalentBoardDTO() {
		super();
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getkind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

}
