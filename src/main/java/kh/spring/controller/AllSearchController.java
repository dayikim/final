package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.service.AllSearchService;


@Controller
@RequestMapping("/AllBoardList")
public class AllSearchController {
	
	@Autowired
	private AllSearchService service;
	
	@RequestMapping(value="lendList",produces="text/html;charset=utf8")	
	public String lendList(String category, String search,String cpage, Model model) {
		
		System.out.println(category + " : " + search + " : " + cpage);
		
		List<String> ldPageNavi = service.getLdPageNavi(category, search,cpage);
		
		List<LendDTO> ldlist = service.getLdList(category, search,cpage); //대여하기 리스트 
		
//		int ldcount = service.lendCount(search); //대여하기 카운트
		
		model.addAttribute("ldList", ldlist); //대여하기 리스트 		
		model.addAttribute("ldNavi", ldPageNavi); //대여하기 카운트
		model.addAttribute("search", search); //검색어
		model.addAttribute("category",category);
		return "borrowBoard/borrowTabExam";
		
	}
	
	@RequestMapping(value="borrowList",produces="text/html;charset=utf8")
	@ResponseBody
	public String borrowList(String category, String search,String cpage, Model model) {
		
//		int bwcount = service.borrowCount(search); //대여요청 카운트
		
		System.out.println(category + " : " + search + " : " + cpage);
		
		List<String> bwPageNavi = service.getBwPageNavi(category, search,cpage);
		
		List<BorrowDTO> bwlist = service.getBwList(category, search,cpage);
		 
		HashMap<String,Object> map = new HashMap<>();
		map.put("bwList", bwlist); //대여요청 리스트
		map.put("bwNavi", bwPageNavi); //대여요청 카운트
		map.put("search", search); //검색어
		map.put("category",category);//카테고리
		
		Gson g = new Gson();
		
		return g.toJson(map);		
	}
	
//	@RequestMapping(value="",produces="text/html;charset=utf8")	
//	public String (String category, String search,String cpage, Model model) {
		
		
//		int ldcount = service.lendCount(search); //대여하기 카운트
//		int bwcount = service.borrowCount(search); //대여요청 카운트
//		int tlscount = service.tlSellCount(search); //재능등록 카운트
//		int tlrcount = service.tlRequsetCount(search); //재능요청 카운트
		
		 
		
//		model.addAttribute("ldList", ldlist); //대여하기 리스트 
//		model.addAttribute("bwList", bwlist); //대여요청 리스트
//		model.addAttribute("tlsList", tlslist); //재능등록 리스트
//		model.addAttribute("tlrList", tlrlist); //재능요청 리스트
	
//		model.addAttribute("ldCount", ldcount); //대여하기 카운트
//		model.addAttribute("bwCount", bwcount); //대여요청 카운트
//		model.addAttribute("tlsCount", tlscount); //재능등록 카운트
//		model.addAttribute("tlrCount", tlrcount); //재능요청 카운트
	
//		model.addAttribute("search", search); //검색어
		
//		return "borrowBoard/borrowTabExam";		
//	}

}
