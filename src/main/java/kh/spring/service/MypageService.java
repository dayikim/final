package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.ApprovalDAO;
import kh.spring.dao.BookingDAO;
import kh.spring.dao.BorrowDAO;
import kh.spring.dao.LendDAO;
import kh.spring.dao.MypageDAO;
import kh.spring.dao.PaymentDAO;
import kh.spring.dao.PointAccountDAO;
import kh.spring.dao.PointDAO;
import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dao.RequestTalentDAO;
import kh.spring.dao.ReviewDAO;
import kh.spring.dao.SellTalentDAO;
import kh.spring.dao.SnsDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.ApprovalDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.PaymentDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointAccountDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.ReviewDTO;
import kh.spring.dto.SellTalentDTO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO dao;
	@Autowired
	private ProfileFilesDAO pdao; // 프로필
	@Autowired
	private PointAccountDAO ppdao; // 포인트
	
	@Autowired
	private ReviewDAO rdao; // 포인트

	@Autowired
	private PaymentDAO paydao;//결제

	@Autowired
	private BookingDAO bdao; // 재능 예약 여부
	@Autowired
	private ApprovalDAO adao; // 거래 승인 여부
	@Autowired
	private LendDAO ldao; // 물건 대여
	@Autowired
	private BorrowDAO bwdao; // 물건 대여 요청
	@Autowired
	private SellTalentDAO stdao; // 재능 대여
	@Autowired
	private RequestTalentDAO rtdao; // 재능 대여 요청

	// 마이페이지 정보 출력
	public PersonDTO mypageList(String sessionID){
		return dao.mypageList(sessionID);
	}

	// 프로필 사진 출력
	public ProfileFilesDTO profileSelect(String sessionID) {
		return pdao.profileSelect(sessionID);
	}

	// 마이페이지정보확인
	public List<PersonDTO>modify(String id){
		return dao.modify(id);
	}

	//   정보수정
	public String modifyProc(PersonDTO dto) {
		return dao.modifyProc(dto);
	}
	
	//마이페이지 년도가져오기
	public String year(String id) {
		return dao.year(id);
	}
	
	//마이페이지 월 가져오기
	public String month(String id) {
		return dao.month(id);
	}
	
	//마이페이지 날짜 가져오기
	public String day(String id) {
		return dao.day(id);
	}

	// 프로필 사진 입력
	public int profileInsert(MultipartFile after_profile, String parents, String realPath){
		File filesPath = new File(realPath); // 파일을 저장하기 위한 저장소 설정
		if(filesPath.exists()) {filesPath.mkdir();}

		System.out.println(filesPath.getAbsolutePath()); // 저장소 경로 get


		String oriName = after_profile.getOriginalFilename(); // after_profile의 oriName 얻기!
		String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;

		try {
			after_profile.transferTo(new File(filesPath.getAbsoluteFile()+"/"+sysName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pdao.profileInsert(new ProfileFilesDTO(0,oriName,sysName,parents,null));

	}

	// 기존 프로필 사진 삭제
	public int delete(String sessionID) {
		return pdao.delete(sessionID);
	}


	// 포인트 충전 내역 출력

	public List<PointAccountDTO> pointChargeList(String sessionID) {
		String charge = "포인트 충전";
		String insert = "거래금 입금";
		HashMap<String, String> param = new HashMap<>();
		param.put("id", sessionID);
		param.put("charge", charge);
		param.put("insert", insert);
		return ppdao.pointChargeList(param);
	}

	// 포인트 사용 내역 출력
	public List<PointAccountDTO> pointUseList(String sessionID) {
		String use = "포인트차감";
		HashMap<String, String> param = new HashMap<>();
		param.put("use", use);
		param.put("id", sessionID);
		return ppdao.pointUseList(param);
	}

	// 현재 빌린 상품 출력(미완)
	public List<PaymentDTO> borrowProduct(String sessionID) {
		String y = "y";
		HashMap<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("id", sessionID);
		return paydao.borrowProduct(param);
	}

	// 현재 빌려준 상품 출력(미완)
	public List<PaymentDTO> lendProduct(String sessionID) {
		String y = "y";
		HashMap<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("id", sessionID);
		return paydao.lendProduct(param);
	}


	//////////////////////////////////////////////////////////////////////////////////////////////거래 요청 목록(판매자 입장)

	// 거래 요청 목록 - 물품
	public List<HashMap<String,Object>> requestRentalProduct(String sessionID) {
		String y = "y";
		String able = "물품";
		Map<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("able", able);      
		param.put("id", sessionID);

		return bdao.requestRentalProduct(param);
	}
	
	// 거래 완료 버튼 뽑기 - 물품
	public List<ApprovalDTO> dealSuccessSelect(String sessionID) {
		return adao.dealSuccessSelect(sessionID);
	}

	// 요청 거절을 눌렀을 경우 - 물품
	public int dealFailProduct(String sessionID, int parent) {
		String able = "물품";
		HashMap<String, Object> param = new HashMap<>();
		param.put("sessionID", sessionID);
		param.put("parent", parent);
		param.put("able", able);

		return bdao.dealFailProduct(param);
	}


	// 거래 승인을 눌렀을 경우 - 물품
	public int dealSuccess(String writer, String booker, int parent) {
		String y = "y";
		return adao.dealSuccess(new ApprovalDTO(0,writer,booker,y,parent,null));
	}

	////////////////////////////////////////////////////////////////////////////////////////////// 예약 내역 (구매자 입장)

	// 예약 내역 목록 - 재능(승인 대기중)
	public List<HashMap<String,Object>> buyRequestTalent(String sessionID) {
		String y = "y";
		String boardtype="재능";
		Map<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("id", sessionID);
		param.put("talent", boardtype);
		return bdao.buyRequestTalent(param);
	}
	
	

	//구매자 기준 승인 완료 출력
	public List<ApprovalDTO> customerDealSuccess(String id){
		return adao.customerDealSuccess(id);
	}
	
	
	//결제 완료된 예약 내역
	public List<HashMap<String, Object>> buyRequestTalent2(String sessionID) {
		String y = "y";
		String boardtype="재능";
		Map<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("id", sessionID);
		param.put("talent", boardtype);
		return bdao.buyRequestTalent2(param);
	}
	
	// 예약 내역 목록 - 물품 (승인 대기중 상태)
	public List<HashMap<String, Object>> buyRequestProduct(String sessionID) {
		String y = "y";
		String boardtype="물품";
		Map<String, String> param = new HashMap<>();
		param.put("y", y);
		param.put("id", sessionID);
		param.put("product", boardtype);
		return bdao.buyRequestProduct(param);
	}
	
	// 예약 내역 목록 - (결제하기 버튼 생성)
		public List<HashMap<String, Object>> buyRequestProduct2(String sessionID) {
			String y = "y";
			String boardtype="물품";
			Map<String, String> param = new HashMap<>();
			param.put("y", y);
			param.put("id", sessionID);
			param.put("product", boardtype);
			return bdao.buyRequestProduct2(param);
		}
	
		// 예약 내역 목록 - (결제하기 버튼 생성)
		public List<HashMap<String, Object>> paymentcomplete(String sessionID) {
			String y = "y";
			String boardtype="물품";
			Map<String, String> param = new HashMap<>();
			param.put("y", y);
			param.put("id", sessionID);
			param.put("product", boardtype);
			
			return bdao.paymentcomplete(param);
		}


	// 예약 취소 - 재능
	public int bookingFail(String sessionID, int parent) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("sessionID", sessionID);
		param.put("parent", parent);

		return bdao.bookingFail(param);
	}
	//승인 여부 확인
	public String isApproval(String id, int parentseq) {
		Map<Object, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("parentseq", parentseq);
		return adao.isApproval(param);
	}


	/////////////////////////////////////////////////////////////////////////////////////////////// 내 게시물 보기

	// 내가 쓴 게시글 목록 - 판매글
	public List<LendDTO> myRequestSellProduct(String sessionID) {
		return ldao.myRequestSellProduct(sessionID);
	}

	// 내가 쓴 게시글 목록 - 대여 요청글
	public List<BorrowDTO> myRequestBuyProduct(String sessionID) {
		return bwdao.myRequestBuyProduct(sessionID);
	}

	////////////////////////////////////////////////////////////////////////////////////////////거래 완료 목록

	// 거래 완료 목록 출력 - 물품 대여
	public  List<HashMap<Object, Object>> dealEndProductSellList(String id, String product) {
		String y="y";
		Map<Object, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("product", product);
		param.put("y", y);
		return dao.dealEndProductSellList(param);
	}

	// 거래 완료 목록 출력 -물품 빌리기
	public List<HashMap<Object, Object>> dealEndProductBuyList(String id, String product) {
		String y="y";
		Map<Object, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("product", product);
		param.put("y", y);
		return dao.dealEndProductBuyList(param);
	}

	// 거래 완료 목록 출력 - 재능 구매완료
	public List<HashMap<Object, Object>> dealEndTalentSellList(String id, String talent) {
		Map<Object, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("talent", talent);
		return dao.dealEndTalentSellList(param);
	}

	// 거래 완료 목록 출력 - 재능 판매완료
	public List<HashMap<Object, Object>> dealEndTalentBuyList(String id, String talent) {
		Map<Object, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("talent", talent);
		return dao.dealEndTalentBuyList(param);
	}
	// 해당 게시글의 거래 갯수
	public int paymentCount(String sessionID) {
		String paymentable ="y";
		String boardtype="재능";
		Map<Object, Object> param = new HashMap<>();
		param.put("id", sessionID);
		param.put("talent", boardtype);
		param.put("y", paymentable);
		return dao.paymentCount(param);
	}
	//거래 완료 후 승인 내역 삭제
	public int approvalDelete(String sessionID, int parentseq) {
		Map<Object, Object> param = new HashMap<>();
		param.put("id", sessionID);
		param.put("parentseq", parentseq);
		
		return adao.approvalDelete(param);
	}
	//거래 후 거래후 booking 내역 삭제
	public int bookingDelete(String sessionID, int parentseq) {
		Map<Object, Object> param = new HashMap<>();
		param.put("id", sessionID);
		param.put("parentseq", parentseq);
		return bdao.bookingDelete(param);
	}

	public List<HashMap<String, Object>> reviewd(String id) {
		return rdao.reveiwed(id);
	}
	
	//판매자-> 구매자
	public List<ReviewDTO> reviewedBySeller(String id) {
		return rdao.reviewedBySeller(id);
	}
	//구매자-> 판매자
	public List<ReviewDTO> reviewedByBuyer(String id) {
		return rdao.reviewedByBuyer(id);
	}
	
	// 리뷰 쓰기 팝업 띄우기 - 구매상품
	public List<HashMap<Object, Object>> ReviewwriteForSell(int parentseq) {
		return rdao.ReviewwriteForSell(parentseq);
	}
	// 리뷰 쓰기 팝업 띄우기 - 빌린상품

	public List<HashMap<Object, Object>> ReviewwriteForBuy(int parentseq) {
		// TODO Auto-generated method stub
		return rdao.ReviewwriteForBuy(parentseq);
	}
	// 리뷰 보기 팝업 띄우기 -구매상품

	public List<HashMap<Object, Object>> ReadReviewForSell(int parentseq) {
		return rdao.ReadReviewForSell(parentseq);
	}
	
	// 리뷰 보기 팝업 띄우기 -빌린상품
	public List<HashMap<Object, Object>> ReadReviewForBuy(int parentseq) {
		return rdao.ReadReviewForBuy(parentseq);
	}
	
	


	




}

