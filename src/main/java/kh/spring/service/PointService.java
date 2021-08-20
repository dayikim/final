package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChargingDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dao.PointAccountDAO;
import kh.spring.dao.PointDAO;
import kh.spring.dto.ChargingDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.dto.PointAccountDTO;


@Service
public class PointService {

	@Autowired
	private ChargingDAO cdao;
	
	@Autowired
	private PaymentDAO paydao;
	
	@Autowired
	private PointAccountDAO padao;
	
	//포인트 충전액
	public int charging(ChargingDTO dto) throws Exception{
		return cdao.charging(dto);
	}
	
	//포인트 증가
		public int add(PointAccountDTO padto) {
			return padao.add(padto);
		}
		
     //잔고에 나의 포인트 액수 확인
		public int checkAmount(String sessionID) {
			return padao.checkAmount(sessionID);
		}
		
//	//결제시, 결제금액 대비 포인트 금액 비교
	public int pointCheck(String sessionID, int point) {
		int sum= padao.checkAmount(sessionID);
		int leftpoint = sum-point;
		System.out.println("현재 포인트: "+leftpoint);
		
		if(leftpoint<0) { //사용 포인트 초과
			return 0;
		}else {   //사용가능
			return 1;
		}
	}

//	public int amount(String sessionID) { //임시 충전 합계금
//		return cdao.amount(sessionID);
//	}
	
    //결제하기
	public int payment(PaymentDTO dto) {
		return paydao.payment(dto);
	}
	
  //포인트 차감
	public int minus(PointAccountDTO padto) {
		return padao.minus(padto);
		
	}

	

	
}
