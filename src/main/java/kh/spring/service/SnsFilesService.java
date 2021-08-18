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
	
	
	public void insert(String oriName, String sysName, int parent,String id) {
		Map<String,Object> param = new HashMap();
		param.put("oriName", oriName);
		param.put("sysName", sysName);
		param.put("parent", parent);
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

}
