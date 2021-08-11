package kh.spring.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoveDTO {
	
	private int seq;
	private int love;
	private Date regDate;
	private String id;
	private int parentSeq;
	
	public LoveDTO() {}

	public LoveDTO(int seq, int love, Date regDate, String id, int parentSeq) {
		super();
		this.seq = seq;
		this.love = love;
		this.regDate = regDate;
		this.id = id;
		this.parentSeq = parentSeq;
	}


	

}
