package kh.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.PersonDAO;
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dao.TalentBoardDAO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.TBoardFilesDTO;
import kh.spring.dto.TalentBoardDTO;

@Service
public class TalentBoardService {

	@Autowired
	private TalentBoardDAO dao;

	@Autowired
	private PersonDAO pdao;

	@Autowired
	private TBoardFilesDAO fdao;

	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);

	}
	public TalentBoardDTO detailView(int seq) {
		return dao.detailView(seq);
	}

	


	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void boardwrite(TalentBoardDTO dto,String realPath, TBoardFilesDTO fdto, MultipartFile[] file)throws Exception{
		dao.boardWrite(dto);
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile temp:file) {
			if(temp.getSize()>0) {
				String oriName = temp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				fdto.setOriName(oriName);
				fdto.setSysName(sysName);
				fdto.setParentSeq(dto.getSeq()-1);
				if(fdao.upload(fdto)>0) {
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}

	public int getSeq() {
		return dao.getSeq();
	}
	public List<TalentBoardDTO> getAllList() {
		return dao.getAllList();
	}



}
