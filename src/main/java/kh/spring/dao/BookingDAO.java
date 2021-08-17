package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BookingDTO;

@Component
public class BookingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public int booking(BookingDTO dto) {
		return mybatis.insert("Booking.booking",dto);
	}
	
	// 거래 요청 목록 - 재능(판매자)
	public List<HashMap<String,String>> requestRentalTalent(Map<String, String> param) {
		return mybatis.selectList("Booking.requestRentalTalent", param);
	}
	
	// 예약 내역 출력 - 재능(구매자)
	public List<HashMap<String,String>> buyRequestTalent(Map<String, String> param) {
		return mybatis.selectList("Booking.buyRequestTalent", param);
	}

}
