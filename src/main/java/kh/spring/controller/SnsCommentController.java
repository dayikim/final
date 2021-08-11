package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.SnsCommentDTO;
import kh.spring.service.SnsCommentService;
import kh.spring.service.SnsService;

@Controller
@RequestMapping("/snscomm")
public class SnsCommentController {
	
	@Autowired
	private SnsCommentService service;
	@Autowired
	private SnsService rservice;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/write")
	@ResponseBody
	public int write(SnsCommentDTO dto,int seq, String contents) {
		String id = (String)session.getAttribute("loginID");
		dto.setId(id);
		dto.setContents(contents);
		dto.setParentSeq(seq);
		
		int result = service.insert(dto);
		return result;
		
	}
	
	@RequestMapping("/delete")
	public String delete(int seq) {
		service.delete(seq);
		return "redirect:/sns/main";
	}
	
	@RequestMapping("/replyList")
	@ResponseBody
	public String replyList(int parentSeq) {
		List<SnsCommentDTO>list = service.replyList(parentSeq);
		Gson gs = new Gson();
		return gs.toJson(list);
	}

}
//post.board?post="+parent