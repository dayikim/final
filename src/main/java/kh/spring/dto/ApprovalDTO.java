package kh.spring.dto;

import java.sql.Date;

public class ApprovalDTO {
	private int seq;
	private String seller;
	private String buyer;
	private String approval;
	private int parentseq;
	private Date approvalDate;
	public ApprovalDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApprovalDTO(int seq, String seller, String buyer, String approval, int parentseq, Date approvalDate) {
		super();
		this.seq = seq;
		this.seller = seller;
		this.buyer = buyer;
		this.approval = approval;
		this.parentseq = parentseq;
		this.approvalDate = approvalDate;
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
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public int getParentseq() {
		return parentseq;
	}
	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	
	
}
