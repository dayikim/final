package kh.spring.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BookingDAO {
   @Autowired
   private SqlSessionTemplate mybatis;
   
//   public int booking(BookingDTO dto) {
//      return mybatis.insert("Booking.booking",dto);
//   }
   
   //////////////////////////////////////////////////////////////////////////// 거래 요청 목록 (판매자 입장)
   
   // 거래 요청 목록 - 물품(판매자)
   public List<HashMap<String,Object>> requestRentalProduct(Map<String, String> param) {
		return mybatis.selectList("Booking.requestRentalProduct", param);
	}
   
   // 거래 요청 취소 - 물품(판매자)
   public int dealFailProduct(HashMap<String, Object> param) {
      return mybatis.delete("Booking.dealFailProduct", param);
   }
   
   // 거래 요청 목록 - 재능(판매자)
   public List<HashMap<String,Object>> requestRentalTalent(Map<String, String> param) {
      return mybatis.selectList("Booking.requestRentalTalent", param);
   }
   
   // 거래 요청 취소 - 재능(판매자)
   public int dealFailTalent(HashMap<String, Object> param) {
      return mybatis.delete("Booking.dealFailTalent", param);
   }
   
   
   //////////////////////////////////////////////////////////////////////////// 예약 내역 출력 (구매자 입장)
   
   // 예약 내역 출력 - 재능(구매자)
   public List<HashMap<String,Object>> buyRequestTalent(Map<String, String> param) {
      return mybatis.selectList("Booking.buyRequestTalent", param);
   }
   
   // 예약 취소 - 재능
   public int bookingFail(HashMap<String, Object> param) {
      return mybatis.delete("Booking.bookingFail", param);
   }

   public int booking(Map<Object, Object> param) {
      return mybatis.insert("Booking.booking",param);
   }

   public int checkBooking(Map<Object, Object> param) {
      return mybatis.selectOne("Booking.checkBooking",param);
   }

}