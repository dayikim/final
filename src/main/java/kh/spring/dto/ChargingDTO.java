package kh.spring.dto;

import java.sql.Date;

public class ChargingDTO {
  private int seq;
  private String id;
  private int amount;
  private Date chargingdate;
  
  public ChargingDTO() {
	}
  
public ChargingDTO(int seq, String id, int amount, Date chargingdate) {
	super();
	this.seq = seq;
	this.id = id;
	this.amount = amount;
	this.chargingdate = chargingdate;
}

public int getSeq() {
	return seq;
}
public String getId() {
	return id;
}
public int getAmount() {
	return amount;
}
public Date getChargingdate() {
	return chargingdate;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public void setId(String id) {
	this.id = id;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public void setChargingdate(Date chargingdate) {
	this.chargingdate = chargingdate;
}
}
