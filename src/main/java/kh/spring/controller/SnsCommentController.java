package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
	public String write(SnsCommentDTO dto,int seq, String contents) {
		String id = (String)session.getAttribute("loginID");
		int comment_seq = service.comment_seq();
		dto.setId(id);
		dto.setContents(contents);
		dto.setParentSeq(seq);
		dto.setSeq(comment_seq);
		
		System.out.println(comment_seq);
		service.insert(dto);
		
		
		Gson gs = new Gson();
		System.out.println(service.getComment(comment_seq).getId());
		return gs.toJson(service.getComment(comment_seq));
		
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
	
	@RequestMapping("/modify")
	@ResponseBody
	public String modify(int seq, String contents) {
		System.out.println(seq);
		System.out.println(contents);
		service.modify(seq, contents);
		return service.modify(seq, contents)>0 ? "success":"false";
	}
	
	// 내 sns 댓글 삭제
	@RequestMapping("/myDelete")
	public String myDelete(int seq) {
		service.delete(seq);
		return "redirect:/my/selectMySns";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "Error";
	}
}