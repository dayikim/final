package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PointAccountDTO;

@Component
public class PointAccountDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public int minus(PointAccountDTO padto) {
		return mybatis.insert("Point.minus",padto);
	}
	
}
