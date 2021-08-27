package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int checkReview(Map<Object, Object> param) {
		return mybatis.selectOne("Review.checkReview",param);
	}

	public List<HashMap<String, Object>> reveiwed(String id) {
		return mybatis.selectList("Review.reviwed",id);
	}

	public List<ReviewDTO> reviewedBySeller(String id) {
		return mybatis.selectList("Review.reviewedBySeller",id);
	}

	public List<ReviewDTO> reviewedByBuyer(String id) {
		return mybatis.selectList("Review.reviewedByBuyer",id);
	}
	//판매자 리뷰쓰기
	public List<HashMap<Object, Object>> ReviewwriteForSell(int parentseq) {
		return mybatis.selectList("Review.writeReviewForSell",parentseq);
	}
	//구매자 리뷰쓰기
	public List<HashMap<Object, Object>> ReviewwriteForBuy(int parentseq) {
		return mybatis.selectList("Review.writeReviewForBuy",parentseq);
	}
	//판매자 리뷰 보기
	public List<HashMap<Object, Object>> ReadReviewForSell(int parentseq) {
		return mybatis.selectList("Review.ReadReviewForSell",parentseq);
	}
	//구매자 리뷰 보기
	public List<HashMap<Object, Object>> ReadReviewForBuy(int parentseq) {
		return mybatis.selectList("Review.ReadReviewForBuy",parentseq);

	}







}
