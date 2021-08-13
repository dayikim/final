package kh.spring.dto;

import java.sql.Date;

public class TBoardFilesDTO {
	 private int seq;
	  private String oriName;
	  private String sysName;
	  private int parentSeq;
	  private Date regDate;
	  
	public TBoardFilesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TBoardFilesDTO(int seq, String oriName, String sysName, int parentSeq, Date regDate) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parentSeq = parentSeq;
		this.regDate = regDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
