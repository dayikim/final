package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.ReviewDTO;

@Component
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	public List<ReviewDTO> reveiwed;
	
	
	public int write(ReviewDTO dto) {
		return mybatis.insert("Review.write",dto);
	}
	
	public List<ReviewDTO> getAllList(String sessionID){
		return mybatis.selectList("Review.getAllList",sessionID);
		
	}

	public int reviewCount(String id) {
		return mybatis.selectOne("Review.reviewCount",id);

	}


	public String reviewerInfoByRecipient(String id) {
		return  mybatis.selectOne("Review.reviewerInfo",id);
	}

	public List<HashMap<Object, Object>> reviewList(String id) {
		return mybatis.selectList("Review.reviewList",id);

	}

	public List<HashMap<Object, Object>> sysName(String id) {
		return mybatis.selectList("Review.sysName",id);
	}

	public int checkReview(int seq) {
		return mybatis.selectOne("Review.checkReview",seq);
	}

	public List<ReviewDTO> reveiwed(String id) {
		return mybatis.selectList("Review.reviwed",id);
	}
}
