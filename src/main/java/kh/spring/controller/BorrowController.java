package kh.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.BorrowDTO;
import kh.spring.service.BorrowService;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
	
	@Autowired
	private BorrowService service;
	
	
	@RequestMapping(value="/firstlist")	
	public String firstList(String search, String pageNum, Model model) {
		System.out.println("여기는 첫검색");
		
		List<BorrowDTO> firstlist = null;
		int strpageNum = 1;
		
		if (pageNum != null) {
			strpageNum = Integer.parseInt(pageNum);
			firstlist = service.getPageList(search,strpageNum);
		}else if (pageNum == null) {
			
			firstlist = service.getPageList(search,strpageNum);
		}

		int totalRow = service.getPageCount(search);
		
		// 한페이지에 보여줄 게시글 수
		final int PAGE_ROW_COUNT = 9;

		
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		
		System.out.println("service에서 온 페이지값 " + totalPageCount);
		System.out.println("service에서 온 리스트 " +firstlist);
		
		model.addAttribute("list",firstlist);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("search", search);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("pageNum",strpageNum);
		
		return "borrowBoard/borrowlist";
		 
	}
	
	@RequestMapping(value="/list",produces="text/html;charset=utf-8")
	@ResponseBody
	public String join(String search, String pageNum, HttpSession session) {
		System.out.println("여기는 다음검색창");
				
		//글의 개수		
		int totalRow = service.getPageCount(search);
		
		// 한페이지에 보여줄 게시글 수
		final int PAGE_ROW_COUNT = 9;

		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		
		List<BorrowDTO> list = null;
		int strpageNum =1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if (pageNum != null) {
			strpageNum = Integer.parseInt(pageNum);
			list = service.getPageList(search,strpageNum);
		}else if (pageNum == null) {			
			list = service.getPageList(search,strpageNum);
		}
				
		System.out.println("service에서 온 페이지값 " + totalPageCount);
		System.out.println("service에서 온 리스트 " +list);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("list", list);
		result.put("totalPageCount", totalPageCount);
		result.put("search",search);
		result.put("totalRow", totalPageCount);
		result.put("pageNum",strpageNum);
		
		Gson gs = new Gson(); 
				
		System.out.println("쥐슨 : " + gs.toJson(result));
		
		return gs.toJson(result);

	}

}
