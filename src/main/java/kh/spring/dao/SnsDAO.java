package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.SnsDTO;

@Component
public class SnsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(SnsDTO dto) {
		return mybatis.insert("Sns.insert", dto);
	}
	
	public List<SnsDTO>selectAll(){
		return mybatis.selectList("Sns.selectAll");
	}
	
	public int getLove(int seq) {
		return mybatis.selectOne("Sns.getLove", seq);
	}
	
	public int like(Map<Integer,Integer> param) {
		return mybatis.update("Sns.like", param);
	}
	
	public int delete(int seq) {
		return mybatis.delete("Sns.delete", seq);
	}
	
	public String region(String id) {
		return mybatis.selectOne("Sns.region", id);
	}
	
	public String select(int seq){
		return mybatis.selectOne("Sns.select",seq);
	}
	
	public int modify(SnsDTO dto) {
		return mybatis.update("Sns.modify", dto);
	}
}
