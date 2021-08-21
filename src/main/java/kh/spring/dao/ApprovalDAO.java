package kh.spring.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ApprovalDTO;

@Component
public class ApprovalDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 거래 승인을 눌렀을 경우
	public int dealSuccess(ApprovalDTO dto) {
		return mybatis.insert("Approval.dealSuccess", dto);
	} 

	// 거래 승인된 애들만 목록 출력(결제 완료 버튼을 위해)
	public int dealSuccessSelect(HashMap<String,Object> param) {
		return mybatis.selectOne("Approval.dealSuccessSelect",param);
	}
}
