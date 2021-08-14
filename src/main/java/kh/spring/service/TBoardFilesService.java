package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.TBoardFilesDAO;
import kh.spring.dto.TBoardFilesDTO;

@Service
public class TBoardFilesService {
	
	@Autowired
	private TBoardFilesDAO tfdao;
	
//	public List<TBoardFilesDTO>getpictures(int){
//		return dao.getpictures()
//	}
// 
}
