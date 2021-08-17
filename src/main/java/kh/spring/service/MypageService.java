package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BookingDAO;
import kh.spring.dao.MypageDAO;
import kh.spring.dao.PointDAO;
import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dao.SnsDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;

@Service
public class MypageService {

   @Autowired
   private MypageDAO dao;
   @Autowired
   private ProfileFilesDAO pdao; // 프로필
   @Autowired
   private PointDAO ppdao; // 포인트
   @Autowired
   private BookingDAO bdao; // 재능 예약
   @Autowired
   private SnsDAO sdao; // 커뮤니티

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
   public List<PointDTO> pointChargeList(String sessionID) {
      return ppdao.pointChargeList(sessionID);
   }
   
   ////////////////////////////////////////////////////////////////////////////////////////////// 거래 요청 목록(판매자 입장)
   
   // 거래 요청 목록 - 재능
   public List<HashMap<String,String>> requestRentalTalent(String sessionID) {
	   String y = "y";
	   Map<String, String> param = new HashMap<>();
	   param.put("y", y);
	   param.put("id", sessionID);
	   
	   return bdao.requestRentalTalent(param);
   }
   
   
   //////////////////////////////////////////////////////////////////////////////////////////////
   
   // 나의 커뮤니티 목록 출력
   public String selectMySns(String sessionID) {
      return "";
   }

}

