package kh.spring.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	};
	
	

}
