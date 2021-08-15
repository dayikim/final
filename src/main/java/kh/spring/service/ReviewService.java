package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ReviewDAO;
import kh.spring.dto.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	
	public int write(ReviewDTO dto) {
		return dao.write(dto);
	}
	
	public List<ReviewDTO> getAllList(String sessionID){
		return dao.getAllList(sessionID);
		
	}

	
}
