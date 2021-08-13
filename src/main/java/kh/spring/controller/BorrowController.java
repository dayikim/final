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
	

	@RequestMapping("/listAll")	
	public String listAll(String category, String search, String cpage, Model model) {
		
		List<String> pageNavi = service.getPageNavi(category, search,cpage);
		
		List<BorrowDTO> list = service.getList(category, search,cpage);
		

		model.addAttribute("navi", pageNavi);
		model.addAttribute("bwList", list);
		model.addAttribute("search", search);
		
		return "borrowBoard/borrowlist"; 
	}

}
