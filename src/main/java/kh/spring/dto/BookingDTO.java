package kh.spring.dto;

import java.sql.Date;

public class BookingDTO {
 private int seq;
 private String seller;
 private String booker;
 private String bookable;
 private int parentseq;
 private Date bookingdate;
 
 public BookingDTO() {
	super();
	// TODO Auto-generated constructor stub
}
public BookingDTO(int seq, String seller, String booker, String bookable, int parentseq, Date bookingdate) {
	super();
	this.seq = seq;
	this.seller = seller;
	this.booker = booker;
	this.bookable = bookable;
	this.parentseq = parentseq;
	this.bookingdate = bookingdate;
}

public int getSeq() {
	return seq;
}
public String getSeller() {
	return seller;
}
public String getBooker() {
	return booker;
}
public String getBookable() {
	return bookable;
}
public int getParentseq() {
	return parentseq;
}
public Date getBookingdate() {
	return bookingdate;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public void setSeller(String seller) {
	this.seller = seller;
}
public void setBooker(String booker) {
	this.booker = booker;
}
public void setBookable(String bookable) {
	this.bookable = bookable;
}
public void setParentseq(int parentseq) {
	this.parentseq = parentseq;
}
public void setBookingdate(Date bookingdate) {
	this.bookingdate = bookingdate;
}
}
