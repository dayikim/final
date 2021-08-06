package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kh.spring.dto.TalentBoardDTO;

import kh.spring.service.TalentBoardService;

@Controller
@RequestMapping("/TBoard")
public class TalentBoardController {
	
	@Autowired
	private TalentBoardService B_Service;
	
//	@Autowired
//	private TalentFileService F_Service;	
	
	@Autowired
	 private HttpSession session;
	
	
	@RequestMapping("write")
	public String write() {
		return "/talentboard/write";
	}
	@RequestMapping("detailView")
	public String post(int seq,Model model) throws Exception {
		System.out.println(seq);
		TalentBoardDTO dto = B_Service.detailView(seq);
		model.addAttribute("post",dto);
		
////		List<TalentFilesDTO> fileList = F_Service.selectAll(seq); //첨부파일 목록 출력   
//        System.out.println("파일이 비어 있나요?? "+fileList.isEmpty());//파일이 있나요?
//        model.addAttribute("filelist", fileList);//파일리스트를 request애 담는다.
//		
		return "/talentboard/detailView";
	}
	@RequestMapping("userProfile")
	public String userProfile() {
		return "/talentboard/userProfile";
	}
	
	@RequestMapping("sellingList")
	public String sellingList() {
		return "/talentboard/userProfile";
	}
	
	@RequestMapping("Review")
	public String Review() {
		return "/talentboard/userProfile";
	}
}
