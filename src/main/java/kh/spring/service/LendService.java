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
import kh.spring.dao.LendDAO;
import kh.spring.dao.LendFilesDAO;
import kh.spring.dao.PersonDAO;
import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.LendFilesDTO;
import kh.spring.dto.PersonDTO;

@Service
public class LendService {
	
	@Autowired
	private LendDAO dao;
	
	@Autowired
	private LendFilesDAO fdao;
	
	@Autowired
	private PersonDAO pdao;
	
	@Autowired
	private BookingDAO bdao;
	
	//예약
	public int booking(String seller, String booker, String bookable, int parentseq,String boardtype) {
	      Map<Object,Object>param = new HashMap();
	      param.put("seller", seller);
	      param.put("booker",booker);
	      param.put("bookable", bookable);
	      param.put("parentseq", parentseq);
	      param.put("boardtype", boardtype);
	      return bdao.booking(param);
	}
	
	public int checkBooking(String booker, int parentseq) {
	      Map<Object,Object>param = new HashMap();
	      param.put("booker",booker);
	      param.put("parentseq", parentseq);
	      return bdao.checkBooking(param);
	   
	}
	
	//프로파일
	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);
	}
	
	//게시글 보기
	public LendDTO detailView(int seq) {
		return dao.detailview(seq);
	}
	
	//글쓰기 번호
	public int getSeq() {
		return dao.getSeq();
	}
	
	//사진리스트
	public List<LendFilesDTO> selectAll(int seq){
		return fdao.selectAll(seq);
	}
	
	//글 삭제
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	//글수정
	public void boardModify(LendDTO dto,String realPath,String[] delSeq,List<MultipartFile> file,int parent)throws Exception{
			
		dao.boardModify(dto);
			
		if(delSeq != null) {
			for (String target : delSeq) {
				String sysName = fdao.getSysName(Integer.parseInt(target));
				sysName = Normalizer.normalize(sysName, Form.NFC);
				File targetFile = new File(realPath + "/" + sysName);
				boolean result = targetFile.delete();
				if (result) {
					fdao.delete(Integer.parseInt(target));
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
				if(fdao.upload(map)>0) {
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}
	
	//글쓰기 및 이미지
	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void lendWrite(LendDTO dto,String realPath, List<MultipartFile> file, int parent)throws Exception{
		dao.lendWrite(dto);
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile temp:file) {
			if(temp.getSize()>0) {
				String oriName = temp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "") +oriName;
				HashMap<String,Object> map = new HashMap<>();
				map.put("oriName", oriName);
				map.put("sysName",sysName);
				map.put("parentSeq",parent);
				if(fdao.upload(map)>0) {
					System.out.println(filesPath.getAbsolutePath() +"/" + sysName);
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}
    //판매자 찾기
	public String getId(int seq) {
		return dao.getId(seq);
	}
	
	//해당 게시글은 lendboard인가요?

	public int isitLend(int seq, String id, String category) {
		Map<Object, Object> param = new HashMap<>();
		param.put("writer", id);
		param.put("seq",seq);
		param.put("category", category);
		return dao.isitLend(param);
	}

	public List<HashMap<String, Object>> detailViewPic(int seq, String id) {
		Map<Object, Object> param = new HashMap<>();
		param.put("writer", id);
		param.put("seq",seq);
		return dao.detailViewPic(param);
	}


	
	
}
