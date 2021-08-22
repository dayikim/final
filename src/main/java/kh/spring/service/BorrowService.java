package kh.spring.service;

import java.io.File;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.maven.shared.invoker.SystemOutLogger;
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
		System.out.println("컨->서 : " + seq);
		return dao.detailview(seq);
	}
	
	//사진리스트
	public List<BorrowBoardFilesDTO> selectAll(int seq){
		System.out.println("컨->서 : " + seq);
		return fdao.selectAll(seq);
	}
	
	//글 번호
	public int getSeq() {
		return dao.getSeq();
	}
	
	//글삭제
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	//글수정
	public void boardModify(BorrowDTO dto,String realPath, String[] delSeq,MultipartFile[] file,int parent)throws Exception{
		
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
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+oriName;
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
	
	//글쓰기
	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void boardwrite(BorrowDTO dto,String realPath,MultipartFile[] file, int parent)throws Exception{
		
		dao.boardWrite(dto);
		
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
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}
	
	
}
