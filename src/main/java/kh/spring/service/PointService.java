package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.PointDAO;
import kh.spring.dto.PointDTO;


@Service
public class PointService {

	@Autowired
	private PointDAO dao;
	

	public int charging(PointDTO dto) throws Exception{
		return dao.charging(dto);
	}
	
	public int amount() {
		return dao.amount();
	}

	
}
