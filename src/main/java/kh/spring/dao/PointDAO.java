package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ChargingDTO;
import kh.spring.dto.PointDTO;

@Component
public class PointDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int charging(ChargingDTO dto) {
		return mybatis.insert("Point.charge",dto);
	}
	public int amount(String sessionID) {
		return mybatis.selectOne("Point.amount",sessionID);
	}
	
	public List<PointDTO> pointChargeList(String sessionID) {
		return mybatis.selectList("Point.pointChargeList",sessionID);
	}
	

	
}
