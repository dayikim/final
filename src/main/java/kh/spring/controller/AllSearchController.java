package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.TalentBoardDTO;
import kh.spring.service.AllSearchService;


@Controller
@RequestMapping("/AllBoardList")
public class AllSearchController {
	
	@Autowired
	private AllSearchService service;
	
	@RequestMapping(value="allList",produces="text/html;charset=utf8")	
	public String allList(String search, Model model) {
		
		List<LendDTO> ldlist = service.lendSearch(search); //대여하기 리스트 
		List<BorrowDTO> bwlist = service.borrowSearch(search); //대여요청 리스트
		List<TalentBoardDTO> tlslist = service.tlSellSearch(search); //재능등록 리스트
		List<TalentBoardDTO> tlrlist = service.tlRequestSearch(search); //재능요청 리스트
		
		int ldcount = service.lendCount(search); //대여하기 카운트
		int bwcount = service.borrowCount(search); //대여요청 카운트
		int tlscount = service.tlSellCount(search); //재능등록 카운트
		int tlrcount = service.tlRequsetCount(search); //재능요청 카운트
		
		 
		
		model.addAttribute("ldList", ldlist); //대여하기 리스트 
		model.addAttribute("bwList", bwlist); //대여요청 리스트
		model.addAttribute("tlsList", tlslist); //재능등록 리스트
		model.addAttribute("tlrList", tlrlist); //재능요청 리스트
		model.addAttribute("ldCount", ldcount); //대여하기 카운트
		model.addAttribute("bwCount", bwcount); //대여요청 카운트
		model.addAttribute("tlsCount", tlscount); //재능등록 카운트
		model.addAttribute("tlrCount", tlrcount); //재능요청 카운트
		model.addAttribute("search", search); //검색어
		
		return "borrowBoard/SearchAllBoardList";
		
	}

}
