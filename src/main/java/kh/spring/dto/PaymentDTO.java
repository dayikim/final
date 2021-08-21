package kh.spring.dto;

import java.sql.Date;

public class PaymentDTO {
	private int seq;
	private String seller;
	private String buyer;
	private String item;
	private int price;
	private int parentseq;
	private Date paymentDate;

	public PaymentDTO() {
	
	}
	public PaymentDTO(int seq, String seller, String buyer, String item, int price, int parentseq, Date paymentDate) {
		super();
		this.seq = seq;
		this.seller = seller;
		this.buyer = buyer;
		this.item = item;
		this.price = price;
		this.parentseq = parentseq;
		this.paymentDate = paymentDate;
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
	public int getParentseq() {
		return parentseq;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	
}

