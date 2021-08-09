package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.SnsDTO;
import kh.spring.service.SnsService;

@Controller
@RequestMapping("/sns")
public class SnsController {
	
	@Autowired
	private SnsService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<SnsDTO>list = service.selectAll();
		model.addAttribute("list", list);
		return "sns/main";
	}
	
	@RequestMapping("/write")
	public String write(SnsDTO dto) throws Exception{
		String id = (String)session.getAttribute("loginID");
		dto.setId(id);
		String region = service.region(id);
		dto.setRegion(region);
		
		service.insert(dto);		
		
		return "redirect:/sns/main";
	}
	
	@RequestMapping("/like")
	public String like(int seq) {
		System.out.println(seq);
		int love1 = service.getLove(seq);
		System.out.println(love1);
		
		int love = love1+1;		
		System.out.println(love);
		
		int count = service.like(seq, love);
		return "redirect:/sns/main";
		
	}
	
	@RequestMapping("/delete")
	public String delete(int seq) {
		service.delete(seq);
		return "redirect:/sns/main";
	}
	
	@RequestMapping("/modify")
	public String modify(int seq,Model model) {
		String contents = service.select(seq);
		model.addAttribute("contents", contents);
		model.addAttribute("seq", seq);
		
		List<SnsDTO>list = service.selectAll();		
		model.addAttribute("list", list);
		return "sns/modify";
	}
	
	@RequestMapping("/modiProc")
	public String modiProc(SnsDTO dto) {
		int seq = dto.getSeq();
		String contents = dto.getContents();
		service.modify(dto);
		return "redirect:/sns/main";
	}

}
