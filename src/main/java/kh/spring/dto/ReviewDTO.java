package kh.spring.dto;

public class ReviewDTO {
   private int seq;
   private String id;
   private String reviewID;
   private String contents;
   
public ReviewDTO() {
	super();
	// TODO Auto-generated constructor stub
}

public ReviewDTO(int seq, String id, String reviewID, String contents) {
	super();
	this.seq = seq;
	this.id = id;
	this.reviewID = reviewID;
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
}
