package kh.spring.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BorrowDAO;
import kh.spring.dao.BwBoardFilesDAO;
import kh.spring.dao.PersonDAO;
import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.PersonDTO;

@Service
public class BorrowService {

	@Autowired
	private BorrowDAO dao;

	@Autowired
	private BwBoardFilesDAO fdao;
	
	@Autowired
	private PersonDAO pdao;
	
	//프로파일
	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);

	}
	
	//게시글보기
	public BorrowDTO detailView(int seq) {
		return dao.detailview(seq);
	}
	
	//사진리스트
	public List<BorrowBoardFilesDTO> selectAll(int seq){
		return fdao.selectAll(seq);
	}
	
	//글 번호
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
