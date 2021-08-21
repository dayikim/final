package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PointAccountDTO;

@Component
public class PointAccountDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	//포인트 증감
	public int add(PointAccountDTO padto) {
		return mybatis.insert("Point.add",padto);
	}
	//포인트 차감
	public int minus(PointAccountDTO padto) {
		return mybatis.insert("Point.minus",padto);
	}
	
    //잔고에 나의 포인트 액수 확인
	public int checkAmount(String sessionID) {
		return mybatis.selectOne("Point.checkAmount",sessionID);
	}
	
	// 포인트 충전 내역 리스트 출력
	public List<PointAccountDTO> pointChargeList(String sessionID) {
		return mybatis.selectList("Point.pointChargeList", sessionID);
	}
	
	// 포인트 사용 내역 리스트 출력
	public List<PointAccountDTO> pointUseList(String sessionID) {
		return mybatis.selectList("Point.pointUseList", sessionID);
	}

	
	
}
