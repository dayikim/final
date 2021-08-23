package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardPictureFilesDTO;

@Component
public class TBoardFilesDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//판매사진업로드
	public int tlsUpload(HashMap<String,Object> map) {
		return mybatis.insert("TbFiles.tlsUpload",map);
	}
			
	//판매사진 삭제 하기
	public int tlsDelete(int seq) {
		return mybatis.delete("TbFiles.tlsDelete", seq);
	}
	
	//판매사진리스트	
	public List<TBoardFilesDTO> tlsSelectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("TbFiles.tlsSelectAll",seq);
	}
	
	//판매사진 이름 가져오기
	public String getTlsSysName(int seq) {
		TBoardFilesDTO dto = mybatis.selectOne("TbFiles.tlsSysName", seq);
		String sysName = dto.getSysName();
		return sysName;
	}
	
	//요청사진업로드
	public int tlrUpload(HashMap<String,Object> map) {
		return mybatis.insert("TbFiles.tlrUpload",map);
	}
	
	//요청사진 삭제 하기
	public int tlrDelete(int seq) {
		return mybatis.delete("TbFiles.tlrDelete", seq);
	}
		
	//요청사진 리스트	
	public List<TalentBoardPictureFilesDTO> tlrSelectAll(int seq){
		System.out.println("서->디 : " + seq);
		return mybatis.selectList("TbFiles.tlrSelectAll",seq);
	}
	
	//요청사진 이름 가져오기
	public String getTlrSysName(int seq) {
		TalentBoardPictureFilesDTO dto = mybatis.selectOne("TbFiles.tlrSysName", seq);
		String sysName = dto.getSysName();
		return sysName;
	}


}
