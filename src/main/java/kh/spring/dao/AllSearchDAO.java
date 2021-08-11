package kh.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.TalentBoardDTO;

@Repository
public class AllSearchDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<LendDTO> getLendList(String search){
		
		if(search == null) {
			search = "";
		}
		
		List<LendDTO> list = new ArrayList<>();
		
		if(search != "") {
			list = mybatis.selectList("AllList.lendList", search);
		}else {
			list = null;
		}
		
		return list;
	}
	
	public List<BorrowDTO> getBorrowList(String search){
		
		if(search == null) {
			search = "";
		}
		
		List<BorrowDTO> list = new ArrayList<>();
		
		if(search != "") {
			list = mybatis.selectList("AllList.borrowList", search);
		}else {
			list = null;
		}
		
		return list;	
	}
	
	public List<TalentBoardDTO> getTalentList(String search){
		
		if(search == null) {
			search = "";
		}
		
		List<TalentBoardDTO> list = new ArrayList<>();	
		
		if(search != "") {
			list = mybatis.selectList("AllList.talentList", search);
		}else {
			list = null;
		}
		
		return list;
	}
	
	public int getLendCount(String search) {
		
		if(search == null) {
			search = "";
		}
		int count = 0;
		
		if(search != "") {
			count = mybatis.selectOne("AllList.numLend", search);
		}else {
			count = 0;
		}
		
		return count;
	}
	
	public int getBorrowCount(String search) {
		
		if(search == null) {
			search = "";
		}
		int count = 0;
		
		if(search != "") {
			count = mybatis.selectOne("AllList.numBorrow", search);
		}else {
			count = 0;
		}
		
		return count;
	}
	
	public int getTalentCount(String search) {
		
		if(search == null) {
			search = "";
		}
		int count = 0;
		
		if(search != "") {
			count = mybatis.selectOne("AllList.numTalent", search);
		}else {
			count = 0;
		}
		
		return count;
	}
	

}
