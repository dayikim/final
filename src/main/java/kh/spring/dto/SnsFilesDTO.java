package kh.spring.dto;

import java.sql.Date;

public class SnsFilesDTO {
	
	private int seq;
	private String oriName;
	private String sysName;
	private int parent;
	private Date reg_date;
	
	public SnsFilesDTO() {}

	public SnsFilesDTO(int seq, String oriName, String sysName, int parent, Date reg_date) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent = parent;
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

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	};
	
	
	
	

}
