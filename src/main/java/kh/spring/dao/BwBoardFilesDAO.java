package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowBoardFilesDTO;

@Component
public class BwBoardFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//사진 업로드
	public int upload(HashMap<String,Object> map) {
		return mybatis.insert("BwFiles.upload",map);
	}
	
	//사진리스트	
	public List<BorrowBoardFilesDTO> selectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("BwFiles.selectAll",seq);
	}
	
	//사진 이름 가져오기
	public String getSysName(int seq) {
		
		BorrowBoardFilesDTO dto = mybatis.selectOne("BwFiles.sysName", seq);
		String sysName = dto.getSysName();
		return sysName;
	}
	
	//사진 삭제 하기
	public int delete(int seq) {
		return mybatis.delete("BwFiles.delete", seq);
	}
	
	public BorrowBoardFilesDTO repre_picture(int parentseq) {
		return mybatis.selectOne("BwFiles.repre_picture", parentseq);
	}
	
}
