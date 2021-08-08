package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.service.BorrowService;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
	
	@Autowired
	private BorrowService service;
	
	@ResponseBody
	@RequestMapping(value="list",produces="text/html;charset=utf-8")
	public String join(String search, HttpServletRequest request, HttpSession session) {
		//서치 값 확인한다
		System.out.println(search);
		
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		System.out.println(strPageNum);
		
//		service.getPage(search,strPageNum);
		return "board/borrowlist";
	}

}
