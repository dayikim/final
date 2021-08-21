package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.TBoardFilesDTO;

@Component
public class TBoardFilesDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int upload(TBoardFilesDTO dto) {
		return mybatis.insert("TbFiles.upload",dto);
	}
			
	//사진 삭제 하기
	public int tlsDelete(int seq) {
		return mybatis.delete("TbFiles.tlsDelete", seq);
	}
	
	//사진리스트	
	public List<TBoardFilesDTO> tlsSelectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("TbFiles.tlsSelectAll",seq);
	}
	
	//사진 이름 가져오기
	public String getTlsSysName(int seq) {
		return mybatis.selectOne("TbFiles.tlsSysName", seq);
	}
	
	//사진 삭제 하기
	public int tlrDelete(int seq) {
		return mybatis.delete("TbFiles.tlrDelete", seq);
	}
		
	//사진리스트	
	public List<TBoardFilesDTO> tlrSelectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("TbFiles.tlrSelectAll",seq);
	}
	
	//사진 이름 가져오기
	public String getTlrSysName(int seq) {
		return mybatis.selectOne("TbFiles.tlrSysName", seq);
	}


}
