package kh.spring.dto;

import java.sql.Date;

public class ProfileFilesDTO {
	private int seq;
	private String oriName;
	private String sysName;
	private String parent_seq;
	private Date reg_date;
	public ProfileFilesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProfileFilesDTO(int seq, String oriName, String sysName, String parent_seq, Date reg_date) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent_seq = parent_seq;
		this.reg_date = reg_date;
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
	public String getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
