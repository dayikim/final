package kh.spring.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.LendDAO;
import kh.spring.dao.LendFilesDAO;
import kh.spring.dao.PersonDAO;
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
	
	//글쓰기 및 이미지
	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void lendWrite(LendDTO dto,String realPath, LendFilesDTO fdto, MultipartFile[] file)throws Exception{
		dao.boardWrite(dto);
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile temp:file) {
			if(temp.getSize()>0) {
				String oriName = temp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				fdto.setOriName(oriName);
				fdto.setSysName(sysName);
				fdto.setParentSeq(dto.getSeq());
				if(fdao.upload(fdto)>0) {
					System.out.println(filesPath.getAbsolutePath() +"/" + sysName);
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}

	
	
}
