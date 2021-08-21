package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.LendFilesDTO;

@Component
public class BwBoardFilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//사진 업로드
	public int upload(BorrowBoardFilesDTO dto) {
		return mybatis.insert("BwFiles.upload",dto);
	}
	
	//사진리스트	
	public List<BorrowBoardFilesDTO> selectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("BwFiles.selectAll",seq);
	}
	
	//사진 이름 가져오기
	public String getSysName(int seq) {
		return mybatis.selectOne("BwFiles.sysName", seq);
	}
	
	//사진 삭제 하기
	public int delete(int seq) {
		return mybatis.delete("BwFiles.delete", seq);
	}
}
