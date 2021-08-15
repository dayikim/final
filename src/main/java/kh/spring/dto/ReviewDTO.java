package kh.spring.dto;

import java.sql.Date;

public class ReviewDTO {
   private int seq;
   private String id;
   private String reviewID;
   private String contents;
   private Date Regdate;
   


public ReviewDTO() {
	super();
	// TODO Auto-generated constructor stub
}

public ReviewDTO(int seq, String id, String reviewID, String contents,Date Regdate ) {
	super();
	this.seq = seq;
	this.id = id;
	this.reviewID = reviewID;
	this.contents = contents;
	this.Regdate =Regdate;
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
public String getReviewID() {
	return reviewID;
}
public void setReviewID(String reviewID) {
	this.reviewID = reviewID;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}

public Date getRegdate() {
	return Regdate;
}

public void setRegdate(Date regdate) {
	Regdate = regdate;
}
}
