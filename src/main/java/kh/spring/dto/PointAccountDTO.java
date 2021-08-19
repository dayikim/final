package kh.spring.dto;

import java.sql.Date;

public class PointAccountDTO {
private int seq;
private String id;
private int pointamount;
private int usepoint;
private int earnamount;
private String reason;
private Date dealdate;

public PointAccountDTO() {
	
}

public PointAccountDTO(int seq, String id, int pointamount, int usepoint, int earnamount, String reason, Date dealdate) {
	super();
	this.seq = seq;
	this.id = id;
	this.pointamount = pointamount;
	this.usepoint = usepoint;
	this.earnamount = earnamount;
	this.reason = reason;
	this.dealdate = dealdate;
}

public int getSeq() {
	return seq;
}
public String getId() {
	return id;
}
public int getPointamount() {
	return pointamount;
}
public int getUsepoint() {
	return usepoint;
}
public int getEarnamount() {
	return earnamount;
}
public String getReason() {
	return reason;
}
public Date getDealdate() {
	return dealdate;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public void setId(String id) {
	this.id = id;
}
public void setPointamount(int pointamount) {
	this.pointamount = pointamount;
}
public void setUsepoint(int usepoint) {
	this.usepoint = usepoint;
}
public void setEarnamount(int earnamount) {
	this.earnamount = earnamount;
}
public void setReason(String reason) {
	this.reason = reason;
}
public void setDealdate(Date dealdate) {
	this.dealdate = dealdate;
}
}
