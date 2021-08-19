package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PaymentDTO;
@Component
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public int payment(PaymentDTO dto) {
		return mybatis.insert("Point.payment",dto);
	}
	}
