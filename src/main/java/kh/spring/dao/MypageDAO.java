package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PaymentDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.ReviewDTO;

@Component
public class MypageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 마이페이지 정보 출력
	public PersonDTO mypageList(String sessionID){
		return mybatis.selectOne("MyPage.mypageList",sessionID);
	}

	//마이페이지정보확인
	public List<PersonDTO> modify(String id){
		return mybatis.selectList("MyPage.modify", id);
	}

	//정보수정
	public String modifyProc(PersonDTO dto) {
		return mybatis.selectOne("MyPage.modifyProc", dto);
	}
	
	//물품 거래 완료 내역 출력 (판매자인 경우) -->

	public List<HashMap<Object, Object>> dealEndProductSellList(Map<Object, Object> param) {
		return mybatis.selectList("MyPage.dealEndProductSellList", param);

	}
//물품 거래 완료 내역 출력 (구매자인 경우)
	public List<HashMap<Object, Object>> dealEndProductBuyList(Map<Object, Object> param) {
		return mybatis.selectList("MyPage.dealEndProductBuyList",param);
	}
	//재능 거래 완료 내역 출력 (구매자인 경우)
	public List<HashMap<Object, Object>> dealEndTalentBuyList(Map<Object, Object> param) {
		return mybatis.selectList("MyPage.dealEndTalentBuyList",param);
	}

	public List<HashMap<Object, Object>> dealEndTalentSellList(Map<Object, Object> param) {
		return mybatis.selectList("MyPage.dealEndTalentSellList",param);

	}
	//거래완료 후, 판매자 정보 출력
	public List<HashMap<Object, Object>> sellerInfo(String id) {
		return mybatis.selectList("MyPage.sellerInfo",id);
	}

	public List<ReviewDTO> content(Map<Object, Object> param) {
		return mybatis.selectList("Review.reviewContents",param);
	}

}
