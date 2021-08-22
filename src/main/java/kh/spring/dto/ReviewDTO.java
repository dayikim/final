package kh.spring.dto;

import java.sql.Date;

public class ReviewDTO {
	private int seq;
	private String reviewer;
	private String recipient;
	private int parentseq;
	private String contents;
	private String reviewable;
	private Date Regdate;
	private String boardtype;

	public ReviewDTO(int seq, String reviewer, String recipient, int parentseq, String contents, String reviewable,
			Date regdate, String boardtype) {
		super();
		this.seq = seq;
		this.reviewer = reviewer;
		this.recipient = recipient;
		this.parentseq = parentseq;
		this.contents = contents;
		this.reviewable = reviewable;
		Regdate = regdate;
		this.boardtype = boardtype;
	}
	public ReviewDTO() {
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
		
	public String getReviewer() {
		return reviewer;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public int getParentseq() {
		return parentseq;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReviewable() {
		return reviewable;
	}

	public void setReviewable(String reviewable) {
		this.reviewable = reviewable;
	}

	public Date getRegdate() {
		return Regdate;
	}

	public void setRegdate(Date regdate) {
		Regdate = regdate;
	}
	
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	
}
