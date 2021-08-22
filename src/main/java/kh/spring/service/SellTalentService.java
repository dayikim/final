package kh.spring.service;

import java.io.File;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BookingDAO;
import kh.spring.dao.PersonDAO;
import kh.spring.dao.SellTalentDAO;
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dto.BookingDTO;
import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TBoardFilesDTO;

@Service
public class SellTalentService {

	@Autowired
	private SellTalentDAO stdao;
	
	@Autowired
	private PersonDAO pdao;


	@Autowired
	private TBoardFilesDAO fdao;

	@Autowired
	private BookingDAO bdao;
	
	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);

	}
	public SellTalentDTO detailView(int seq) {
		return stdao.detailView(seq);
	}
	
	//사진리스트
	public List<TBoardFilesDTO> selectAll(int seq){
		System.out.println("컨->서 : " + seq);
		return fdao.tlsSelectAll(seq);
	}
	
	//예약하기
	public int booking(String seller, String booker, String bookable, int parentseq) {
	      Map<Object,Object>param = new HashMap();
	      param.put("seller", seller);
	      param.put("booker",booker);
	      param.put("bookable", bookable);
	      param.put("parentseq", parentseq);
	      return bdao.booking(param);
	}
	//예약 여부 체크
	   public int checkBooking(String booker, int parentseq) {
	      Map<Object,Object>param = new HashMap();
	      param.put("booker",booker);
	      param.put("parentseq", parentseq);
	      return bdao.checkBooking(param);
	   
	}
	
	 //글수정
	public void boardModify(SellTalentDTO dto,String realPath,String[] delSeq,MultipartFile[] file,int parent)throws Exception{
			
		stdao.boardModify(dto);
			
		if(delSeq != null) {
			for (String target : delSeq) {
				String sysName = fdao.getTlsSysName(Integer.parseInt(target));
				sysName = Normalizer.normalize(sysName, Form.NFC);
				File targetFile = new File(realPath + "/" + sysName);
				boolean result = targetFile.delete();
				if (result) {
					fdao.tlsDelete(Integer.parseInt(target));
				}
			}
		}
			
			File filesPath = new File(realPath);
			if(!filesPath.exists()) {filesPath.mkdir();}
			for(MultipartFile temp:file) {
				if(temp.getSize()>0) {
					String oriName = temp.getOriginalFilename();
					String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
					HashMap<String,Object> map = new HashMap<>();
					map.put("oriName", oriName);
					map.put("sysName",sysName);
					map.put("parentSeq",parent);
					if(fdao.tlsUpload(map)>0) {
						temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
					}
				}
			}
		}
		
	   

	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void sellingWrite(SellTalentDTO stdto,String realPath, MultipartFile[] file,int parent)throws Exception{
		stdao.boardWrite(stdto);
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile temp:file) {
			if(temp.getSize()>0) {
				String oriName = temp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				HashMap<String,Object> map = new HashMap<>();
				map.put("oriName", oriName);
				map.put("sysName",sysName);
				map.put("parentSeq",parent);
				if(fdao.tlsUpload(map)>0) {
					System.out.println(filesPath.getAbsolutePath() +"/" + sysName);
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}

	public int getSeq() {
		return stdao.getSeq();
	}
	
	public List<SellTalentDTO> getAllList() {
		return stdao.getAllList();
	}
	public int delete(int seq) {
		return stdao.delete(seq);
	}

	public String getId() {
		return stdao.getId();
	}
	//판매자 찾기
	public String getWriter(int seq) {
		return stdao.getWriter(seq);
	}
	

	
}
