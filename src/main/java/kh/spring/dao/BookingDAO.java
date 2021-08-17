package kh.spring.dao;

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

}
