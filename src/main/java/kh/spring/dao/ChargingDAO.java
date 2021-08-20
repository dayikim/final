package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ChargingDTO;
import kh.spring.dto.PointDTO;
@Component
public class ChargingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//포인트 충전하기
	public int charging(ChargingDTO dto) {
		return mybatis.insert("Point.charge",dto);
	}
	
	//포인트 잔액확인
	public int pointAmount(String sessionID) {
		return mybatis.selectOne("Point.pointAmount",sessionID);
	}
	
	public List<PointDTO> pointChargeList(String sessionID) {
		return mybatis.selectList("Point.pointChargeList",sessionID);
	}
	
}
