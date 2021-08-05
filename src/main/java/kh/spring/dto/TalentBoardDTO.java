package kh.spring.dto;

import java.sql.Date;

public class TalentBoardDTO {
   private int seq;
   private String id;
   private String contents;
   private Date regDate;
   
public TalentBoardDTO() {
	super();
}
public TalentBoardDTO(int seq, String id, String contents, Date regDate) {
	super();
	this.seq = seq;
	this.id = id;
	this.contents = contents;
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
public Date getRegDate() {
	return regDate;
}
public void setRegDate(Date regDate) {
	this.regDate = regDate;
}
}
