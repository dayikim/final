package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.SnsDAO;
import kh.spring.dto.LoveDTO;
import kh.spring.dto.SnsDTO;

@Service
public class SnsService {
	
	@Autowired
	private SnsDAO dao;
	
	public void insert(int seq,String id, String contents, String category, String region) throws Exception{
		//dto.setSeq(seq);
		Map<String,Object>param = new HashMap();
		param.put("seq", seq);
		param.put("id", id);
		param.put("contents", contents);
		param.put("category", category);
		param.put("region", region);
		dao.insert(param);
	}
	
	public int seq() {
		return dao.seq();
	}
	
	public List<SnsDTO> page(String id, int viewcount, int count){
		Map<String,Object> param = new HashMap();
		param.put("id", id);
		param.put("viewcount", viewcount);
		param.put("count", count);
		return dao.page(param);
	}
	
	public List<SnsDTO> initpage(String id){
		return dao.initpage(id);
	}
	
	public List<SnsDTO> selectAll(String id){
		return dao.selectAll(id);
	}
	
	public int getLove(int seq) {
		return dao.getLove(seq);
	}
	
	public int like(int seq,int love) {
		Map<Integer,Integer> param = new HashMap();
		param.put(seq, seq);
		param.put(love, love);
		return dao.like(param);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	public String region(String id) {
		return dao.region(id);
	}
	
	public String select(int seq){
		return dao.select(seq);
	}
	
	public void modify(String contents, String category, int seq, String id) {
		Map<String,Object>param = new HashMap();
		param.put("contents", contents);
		param.put("category", category);
		param.put("seq", seq);
		param.put("id", id);
		dao.modify(param);
	}
	
	public int love(int seq, int love) {
		Map<String,Integer>param = new HashMap();
		param.put("seq", seq);
		param.put("love", love);
		return dao.love(param);
	}
	
	public int getlike(String id,int seq) {
		Map<String,Object>param = new HashMap();
		param.put("id", id);
		param.put("parentSeq", seq);
		return dao.getlike(param);
	}
	
	public void pluslove(String id, int seq) {
		Map<String,Object>param = new HashMap();
		param.put("id", id);
		param.put("parentSeq", seq);
		dao.pluslove(param);
	}
	
	public void cancellove(int seq, int love) {
		Map<String,Integer>param = new HashMap();
		param.put("seq", seq);
		param.put("love", love);
		dao.cancellove(param);
	}
	
	public void minuslove(String id, int seq) {
		Map<String,Object>param = new HashMap();
		param.put("id", id);
		param.put("parentSeq", seq);
		dao.minuslove(param);
	}
	
	public int getcount(String id, int seq) {
		Map<String,Object>param = new HashMap();
		param.put("id", id);
		param.put("parentSeq", seq);
		return dao.getcount(param);
	}
	
	public void updatecount(String id, int seq) {
		Map<String,Object>param = new HashMap();
		param.put("id", id);
		param.put("parentSeq", seq);
		dao.updatecount(param);
	}
	
	public List<String> existlike(String id){
		return dao.existlike(id);
	}
	
	// 내 sns 출력
	public List<SnsDTO> mySelectAll(String id){
		return dao.mySelectAll(id);
	}
	
}
