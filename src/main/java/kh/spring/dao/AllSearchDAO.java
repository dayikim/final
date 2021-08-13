package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	//대여하기 리스트
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

	//대여요청 리스트
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
	
	//재능등록 리스트
	public List<TalentBoardDTO> getTlSellList(String search){
		
		if(search == null) {
			search = "";
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", "재능등록");
		map.put("search",search);
		
		List<TalentBoardDTO> list = new ArrayList<>();	
		
		if(search != "") {
			list = mybatis.selectList("AllList.tlSellList", map);
		}else {
			list = null;
		}
		
		return list;
	}
	
	//재능요청 리스트
	public List<TalentBoardDTO> getTlRequestList(String search){
		
		if(search == null) {
			search = "";
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", "재능요청");
		map.put("search",search);
		
		List<TalentBoardDTO> list = new ArrayList<>();	
		
		if(search != "") {
			list = mybatis.selectList("AllList.tlRequsetList", map);
		}else {
			list = null;
		}
		
		return list;
	}
	
	//대여하기 카운트
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
	
	//대여요청 카운트
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
	
	//재능등록 카운트
	public int getTlSellCount(String search) {
		
		if(search == null) {
			search = "";
		}
		int count = 0;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", "재능등록");
		map.put("search",search);
		
		if(search != "") {
			count = mybatis.selectOne("AllList.numTlSell", map);
		}else {
			count = 0;
		}
		
		return count;
	}
	
	//재능요청 카운트
	public int getTlRequsetCount(String search) {
		
		if(search == null) {
			search = "";
		}
		int count = 0;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", "재능요청");
		map.put("search",search);
		
		if(search != "") {
			count = mybatis.selectOne("AllList.numTlRequest", map);
		}else {
			count = 0;
		}
		
		return count;
	}
	

}
