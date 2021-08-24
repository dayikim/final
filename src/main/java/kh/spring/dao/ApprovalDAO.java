package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ApprovalDTO> dealSuccessSelect(String sessionID) {
		return mybatis.selectList("Approval.dealSuccessSelect",sessionID);
	}
	

	//판매자가 승인해주었나요?
	public String isApproval(Map<Object,Object>param) {
		return mybatis.selectOne("Approval.isApproval",param);
	}
	//구매자 기준 승인 완료된 리스트.
	public List<ApprovalDTO> customerDealSuccess(String sessionID) {
		return mybatis.selectList("Approval.customerDealSuccess",sessionID);
	}
	
}
