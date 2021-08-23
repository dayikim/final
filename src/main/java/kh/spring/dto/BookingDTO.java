package kh.spring.dto;

import java.sql.Date;

public class BookingDTO {
 private int seq;
 private String seller;
 private String booker;
 private String bookable;
 private int parentseq;
 private Date bookingdate;
 private String boardtype;
public BookingDTO() {
	super();
	// TODO Auto-generated constructor stub
}
public BookingDTO(int seq, String seller, String booker, String bookable, int parentseq, Date bookingdate,
		String boardtype) {
	super();
	this.seq = seq;
	this.seller = seller;
	this.booker = booker;
	this.bookable = bookable;
	this.parentseq = parentseq;
	this.bookingdate = bookingdate;
	this.boardtype = boardtype;
}
public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public String getSeller() {
	return seller;
}
public void setSeller(String seller) {
	this.seller = seller;
}
public String getBooker() {
	return booker;
}
public void setBooker(String booker) {
	this.booker = booker;
}
public String getBookable() {
	return bookable;
}
public void setBookable(String bookable) {
	this.bookable = bookable;
}
public int getParentseq() {
	return parentseq;
}
public void setParentseq(int parentseq) {
	this.parentseq = parentseq;
}
public Date getBookingdate() {
	return bookingdate;
}
public void setBookingdate(Date bookingdate) {
	this.bookingdate = bookingdate;
}
public String getBoardtype() {
	return boardtype;
}
public void setBoardtype(String boardtype) {
	this.boardtype = boardtype;
}
 
 
}
