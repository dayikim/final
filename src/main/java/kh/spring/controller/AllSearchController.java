package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BorrowDTO;
import kh.spring.dto.LendDTO;
import kh.spring.dto.LendFilesDTO;
import kh.spring.dto.RequestTalentDTO;
import kh.spring.dto.SellTalentDTO;
import kh.spring.service.AllSearchService;


@Controller
@RequestMapping("/AllBoardList")
public class AllSearchController {
	
	@Autowired
	private AllSearchService service;
	
	@RequestMapping(value="lendList",produces="text/html;charset=utf8")	
	public String lendList(String choice, String search,String cpage, Model model) {
				
		List<String> ldPageNavi = service.getLdPageNavi(choice, search,cpage);
		List<LendDTO> ldlist = service.getLdList(choice, search,cpage); //대여하기 리스트 
		
		List<LendFilesDTO> flist = service.getFiles();
		System.out.println(flist.get(0).getParentSeq());
		
		model.addAttribute("list", ldlist); //대여하기 리스트 
		model.addAttribute("flist",flist);
		model.addAttribute("navi", ldPageNavi); //대여하기 카운트
		model.addAttribute("search", search); //검색어
		model.addAttribute("choice",choice);
		return "toBoard/lendList";
		
	}
	
	@RequestMapping(value="borrowList",produces="text/html;charset=utf8")
	public String borrowList(String choice, String search,String cpage, Model model) {
						
		List<String> bwPageNavi = service.getBwPageNavi(choice, search,cpage);
		List<BorrowDTO> bwlist = service.getBwList(choice, search,cpage);
		
		model.addAttribute("navi", bwPageNavi);
		model.addAttribute("list", bwlist);
		model.addAttribute("search", search); //검색어
		model.addAttribute("choice",choice);//카테고리		
		return "toBoard/borrowList";		
	}
	
	@RequestMapping(value="tlSellList",produces="text/html;charset=utf8")
	public String tlSellList(String choice, String search,String cpage, Model model) {
			
		System.out.println(choice);
		
		List<String> tlsPageNavi = service.getTlsPageNavi(choice, search,cpage);
		List<SellTalentDTO> tlslist = service.getTlsList(choice, search,cpage);
		
		model.addAttribute("navi", tlsPageNavi);
		model.addAttribute("list", tlslist);
		model.addAttribute("search", search); //검색어
		model.addAttribute("choice",choice);//카테고리		
		return "toBoard/tlSellList";		
	}
	
	@RequestMapping(value="tlRequestList",produces="text/html;charset=utf8")
	public String tlRequestList(String choice, String search,String cpage, Model model) {
	
		System.out.println(choice);
		
		List<String> tlrPageNavi = service.getTlrPageNavi(choice, search,cpage);
		List<RequestTalentDTO> tlrlist = service.getTlrList(choice, search,cpage);
		
		model.addAttribute("navi", tlrPageNavi);
		model.addAttribute("list", tlrlist);
		model.addAttribute("search", search); //검색어
		model.addAttribute("choice",choice);//카테고리		
		return "toBoard/tlRequestList";		
	}
	
	
}
