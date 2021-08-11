package kh.spring.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SnsCommentDTO {
	private int seq ;
	private String id;
	private String contents;
	private int parentSeq;
	private Date regDate;
	
	public SnsCommentDTO() {}

	public SnsCommentDTO(int seq, String id, String contents, int parentSeq, Date regDate) {
		super();
		this.seq = seq;
		this.id = id;
		this.contents = contents;
		this.parentSeq = parentSeq;
		this.regDate = regDate;
	}
	
	
	
	

}
