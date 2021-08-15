package kh.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.TalentBoardDTO;

@Repository
public class AllSearchDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	

}
