package kh.spring.service;

import java.io.File;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BookingDAO;
import kh.spring.dao.PersonDAO;
import kh.spring.dao.RequestTalentDAO;
import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dto.BookingDTO;
import kh.spring.dto.BorrowBoardFilesDTO;
import kh.spring.dto.BorrowDTO;
import kh.spring.dto.PersonDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.dto.TBoardFilesDTO;

@Service
public class RequestTalentService {

	@Autowired
	private RequestTalentDAO rtdao;
	
	@Autowired
	private PersonDAO pdao;


	@Autowired
	private TBoardFilesDAO fdao;

	@Autowired
	private BookingDAO bdao;
	
	public PersonDTO memberInfoById(String id) {
		return pdao.memberInfoById(id);

	}
	public RequestTalentDTO detailView(int seq) {
		return rtdao.detailView(seq);
	}
	
	//글수정
		public void boardModify(RequestTalentDTO dto,String realPath, TBoardFilesDTO fdto,String[] delSeq,MultipartFile[] file)throws Exception{
			
			rtdao.boardModify(dto);
			
			if(delSeq != null) {
				for (String target : delSeq) {
					String sysName = fdao.getTlrSysName(Integer.parseInt(target));
					sysName = Normalizer.normalize(sysName, Form.NFC);
					File targetFile = new File(realPath + "/" + sysName);
					boolean result = targetFile.delete();
					if (result) {
						fdao.tlrDelete(Integer.parseInt(target));
					}
				}
			}
			
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
						temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
					}
				}
			}
		}


	@Transactional //DML: insert,delete,update 트렌젝션에 영향을 받음!
	public void requestWrite(RequestTalentDTO rtdto,String realPath, TBoardFilesDTO fdto, MultipartFile[] file)throws Exception{
		rtdao.boardWrite(rtdto);
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile temp:file) {
			if(temp.getSize()>0) {
				String oriName = temp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				fdto.setOriName(oriName);
				fdto.setSysName(sysName);
				fdto.setParentSeq(rtdto.getSeq()-1);
				if(fdao.upload(fdto)>0) {
					System.out.println(filesPath.getAbsolutePath() +"/" + sysName);
					temp.transferTo(new File(filesPath.getAbsolutePath() +"/" + sysName));
				}
			}
		}
	}

	public int getSeq() {
		return rtdao.getSeq();
	}
	public List<RequestTalentDTO> getAllList() {
		return rtdao.getAllList();
	}
	public int delete(int seq) {
		return rtdao.delete(seq);
	}

	
	
}
