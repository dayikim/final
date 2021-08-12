package kh.spring.dto;

import java.sql.Date;

public class PointDTO {
 private int seq;
 private String id;
 private int pointAmount;
 private Date pointdate;
 
public PointDTO() {
	super();
	// TODO Auto-generated constructor stub
}
public PointDTO(int seq, String id, int pointAmount, Date pointdate) {
	super();
	this.seq = seq;
	this.id = id;
	this.pointAmount = pointAmount;
	this.pointdate = pointdate;
}
public int getSeq() {
	return seq;
}
public String getId() {
	return id;
}
public int getPointAmount() {
	return pointAmount;
}
public Date getPointdate() {
	return pointdate;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public void setId(String id) {
	this.id = id;
}
public void setPointAmount(int pointAmount) {
	this.pointAmount = pointAmount;
}
public void setPointdate(Date pointdate) {
	this.pointdate = pointdate;
}
 


}
