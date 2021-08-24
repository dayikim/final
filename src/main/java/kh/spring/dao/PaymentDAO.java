package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

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
	//해당 게시글 결제여부
	public int isPayment(int parentseq) {
		return mybatis.selectOne("Point.isPayment",parentseq);
	}
	public List<PaymentDTO> searchseqByPayment(String sessionID) {
		return mybatis.selectList("Point.searchseqByPayment",sessionID);
	}
	
	// 현재 빌린 상품
	public List<PaymentDTO> borrowProduct(HashMap<String,String> param) {
		return mybatis.selectList("Point.borrowProduct", param);
	}
	
	// 현재 빌려준 상품
	public List<PaymentDTO> lendProduct(HashMap<String, String> param){
		return mybatis.selectList("Point.lendProduct", param);
	}
}