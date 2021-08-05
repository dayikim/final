package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.dao.MyPageDAO;


public class MyPageService {
	@Autowired
	private MyPageDAO dao;
}
