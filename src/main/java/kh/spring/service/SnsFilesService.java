package kh.spring.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.SnsFilesDAO;
import kh.spring.dto.SnsFilesDTO;

@Service
public class SnsFilesService {
	
	@Autowired
	private SnsFilesDAO dao;
	
	public int getSeq() {
		return dao.getSeq();
	}
	
	public void insert(int seq, String oriName, String sysName, int parentseq,String id) {
		Map<String,Object> param = new HashMap();
		param.put("seq", seq);
		param.put("oriName", oriName);
		param.put("sysName", sysName);
		param.put("parent", parentseq);
		param.put("id", id);
		dao.insert(param);
	}
	
	public void delete(int seq) {
		dao.delete(seq);
	}
	
	public int deleteFile(int seq) {
		return dao.deleteFile(seq);
	}
	
	public List<SnsFilesDTO> modiFile(int parent){
		return dao.modiFile(parent);
	}
	
	public List<SnsFilesDTO> fileList(){
		return dao.fileList();
	}
	
	public List<SnsFilesDTO> sendList(HttpSession session) throws Exception{
		List<SnsFilesDTO> sendfileList = new ArrayList<SnsFilesDTO>();
		for(SnsFilesDTO sfd : this.fileList()) {
			sfd.setSysName(toBinary(session,sfd.getSysName()));
			sendfileList.add(sfd);
		}
		return sendfileList;
	}
	
	public String toBinary(HttpSession session,String sysName) throws Exception {
		return Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("files")+"/"+sysName));
	}
	
	public String toProfileBinary(HttpSession session,String sysName) throws Exception {
		return Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("resources/imgs/mypage")+"/"+sysName));
	}
	
	private byte[] getFileBinary(String filepath) {
		File file = new File(filepath);
		byte[] data = new byte[(int) file.length()];
		try (FileInputStream stream = new FileInputStream(file)) {
			stream.read(data, 0, data.length);
		} catch (Throwable e) {
			e.printStackTrace();
		}
			return data;
	}
	
	public List<SnsFilesDTO> snsFileList(HttpSession session,int firstseq, int lastseq ) throws Exception{
		List<SnsFilesDTO> list = new ArrayList<SnsFilesDTO>();
		Map<String, Integer> temp = new HashMap<String, Integer>();
		temp.put("firstseq", firstseq);
		temp.put("lastseq", lastseq);
		for(SnsFilesDTO sfd : dao.snsgetFileList(temp)) {
			sfd.setSysName(toBinary(session,sfd.getSysName()));
			list.add(sfd);
		}
		
		return list;
		
	}

}
