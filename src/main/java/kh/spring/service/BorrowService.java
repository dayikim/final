package kh.spring.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BorrowDAO;
import kh.spring.dao.BwBoardFilesDAO;
import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;

@Service
public class BorrowService {

	@Autowired
	private BorrowDAO dao;

	@Autowired
	private BwBoardFilesDAO fdao;
	
	public int getSeq() {
		return dao.getSeq();
	}
	
	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void boardwrite(BorrowDTO dto,String realPath, BorrowBoardFilesDTO fdto, MultipartFile[] file)throws Exception{
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
	
	
}
