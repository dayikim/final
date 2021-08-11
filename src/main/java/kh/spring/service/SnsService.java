package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.SnsDAO;
import kh.spring.dto.SnsDTO;

@Service
public class SnsService {
	
	@Autowired
	private SnsDAO dao;
	
	public void insert(SnsDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	public List<SnsDTO> selectAll(){
		return dao.selectAll();
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
	
	public int modify(SnsDTO dto) {
		return dao.modify(dto);
	}
	
	public int love(int seq, int love) {
		Map<String,Integer>param = new HashMap();
		param.put("seq", seq);
		param.put("love", love);
		return dao.love(param);
	}

}
