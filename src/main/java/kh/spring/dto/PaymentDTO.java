package kh.spring.dto;

import java.sql.Date;

public class PaymentDTO {
	private int seq;
	private String seller;
	private String buyer;
	private String item;
	private int price;
	private int usepoint;
	private int earnamount;
	private String reason;
	
	public PaymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentDTO(int seq, String seller, String buyer, String item, int price, int usepoint, int earnamount,
			String reason, Date dealdate) {
		super();
		this.seq = seq;
		this.seller = seller;
		this.buyer = buyer;
		this.item = item;
		this.price = price;
		this.usepoint = usepoint;
		this.earnamount = earnamount;
		this.reason = reason;
		this.dealdate = dealdate;
	}
	public int getSeq() {
		return seq;
	}
	public String getSeller() {
		return seller;
	}
	public String getBuyer() {
		return buyer;
	}
	public String getItem() {
		return item;
	}
	public int getPrice() {
		return price;
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
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public void setPrice(int price) {
		this.price = price;
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
	private Date dealdate;
}
