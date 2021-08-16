package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<SnsFilesDTO> fileList(){
		return dao.fileList();
	}

}
