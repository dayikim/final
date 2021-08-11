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
	

	@RequestMapping("/list")	
	public String firstList(String search, Model model) {
		
		List<BorrowDTO> list = null;
		
		int totalRow = service.getPageCount(search);
			
		model.addAttribute("list",list);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("search", search);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("pageNum",strpageNum);
		
		return "borrowBoard/borrowlist";
		
		
		 
	}
	
	

}
