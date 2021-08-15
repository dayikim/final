package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ReviewDTO;

@Component
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int write(ReviewDTO dto) {
		return mybatis.insert("Review.write",dto);
	}
	
	public List<ReviewDTO> getAllList(String sessionID){
		return mybatis.selectList("Review.getAllList",sessionID);
		
	}
}
