package kh.spring.service;

import java.io.File;
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
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.BookingDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardDTO;

@Service
public class TalentBoardService {

	@Autowired
	private TalentBoardDAO tdao;//삭제 예정
	
	@Autowired
	private PersonDAO pdao;


	@Autowired
	private TBoardFilesDAO fdao;

	@Autowired
	private BookingDAO bdao;
	
	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);

	}
	public TalentBoardDTO detailView(int seq) {
		return tdao.detailView(seq);
	}

	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
//	public void boardwrite(TalentBoardDTO dto,String realPath, TBoardFilesDTO fdto, MultipartFile[] file)throws Exception{
//		tdao.boardWrite(dto);
//		File filesPath = new File(realPath);
//		if(!filesPath.exists()) {filesPath.mkdir();}
//		for(MultipartFile temp:file) {
//			if(temp.getSize()>0) {
//				String oriName = temp.getOriginalFilename();
//				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
//				fdto.setOriName(oriName);
//				fdto.setSysName(sysName);
//				fdto.setParentSeq(dto.getSeq()-1);
//				if(fdao.upload(fdto)>0) {
//					System.out.println(filesPath.getAbsolutePath() +"/" + sysName);
//					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
//				}
//			}
//		}
//	}

	public int getSeq() {
		return tdao.getSeq();
	}
	public List<TalentBoardDTO> getAllList() {
		return tdao.getAllList();
	}
	public int delete(int seq) {
		return tdao.delete(seq);
	}

}
