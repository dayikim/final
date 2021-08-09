package kh.spring.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SnsDTO {
	private int seq;
	private String id;
	private String contents;
	private String category;
	private String region;
	private Date regDate;
	private int love;
	
	public SnsDTO() {};	
	public SnsDTO(int seq, String id, String contents, String category, String region, Date regDate,int love) {
		super();
		this.seq = seq;
		this.id = id;
		this.contents = contents;
		this.category = category;
		this.region = region;
		this.regDate = regDate;
		this.love = love;
	}
}
