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
		
		List<LendDTO> ldlist = service.lendSearch(search);
		List<BorrowDTO> bwlist = service.borrowSearch(search);
		List<TalentBoardDTO> tllist = service.talentSearch(search);
		
		int ldcount = service.lendCount(search);
		int bwcount = service.borrowCount(search);
		int tlcount = service.talentCount(search);
		
		model.addAttribute("ldList", ldlist);
		model.addAttribute("bwList", bwlist);
		model.addAttribute("tlList", tllist);
		model.addAttribute("ldCount", ldcount);
		model.addAttribute("bwCount", bwcount);
		model.addAttribute("tlCount", tlcount);
		model.addAttribute("search", search);
		
		return "borrowBoard/SearchAllBoardList";
		 
	}

}
