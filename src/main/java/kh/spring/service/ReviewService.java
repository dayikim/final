package kh.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PersonDAO;
import kh.spring.dao.ReviewDAO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private PersonDAO pdao;
	
	public int write(ReviewDTO dto) {
		return dao.write(dto);
	}
	
	public List<ReviewDTO> getAllList(String sessionID){
		return dao.getAllList(sessionID);
		
	}

	public int reviewCount(String id) {
		return dao.reviewCount(id);
	}

	public String reviewerInfoByRecipient(String id) {
		return dao.reviewerInfoByRecipient(id);
	}

	public PersonDTO memberInfoById(String reviewer) {
		return pdao.memberInfoById(reviewer);
	}
	
	public List<HashMap<Object,Object>> reviewList(String id){//(lend,selltalent)판매목록 리스트
		return dao.reviewList(id);

		}

	public List<HashMap<Object, Object>> sysName(String id) {
		return dao.sysName(id);
	}


	
}
