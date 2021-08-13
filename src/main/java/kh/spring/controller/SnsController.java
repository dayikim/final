package kh.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.SnsDTO;
import kh.spring.service.SnsCommentService;
import kh.spring.service.SnsFilesService;
import kh.spring.service.SnsService;

@Controller
@RequestMapping("/sns")
public class SnsController {
	
	@Autowired
	private SnsService service;
	@Autowired
	private SnsCommentService scservice;
	@Autowired
	private SnsFilesService fservice;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<SnsDTO>list = service.selectAll();
		model.addAttribute("list", list);
		
		
		
//		List<SnsCommentDTO>comment = scservice.selectAll();
//		model.addAttribute("comment", comment);
		return "sns/main";
	}
	
	@RequestMapping("/write")
	public String write(SnsDTO dto, MultipartFile[] file) throws Exception{
		String id = (String)session.getAttribute("loginID");
		dto.setId(id);
		String region = service.region(id);
		dto.setRegion(region);		
		service.insert(dto);	
		int parent = service.seq();//작성한글번호
		
		String realPath = session.getServletContext().getRealPath("files");
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile tmp : file) {
			String oriName = tmp.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+ "_"+oriName;
			fservice.insert(oriName, sysName, parent);
			tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
		}
		
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
	public String modiProc(SnsDTO dto, MultipartFile[] file) throws Exception{
		int seq = dto.getSeq();
		int parent = dto.getSeq();
		String contents = dto.getContents();
		service.modify(dto);
		
		String realPath = session.getServletContext().getRealPath("files");
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile tmp : file) {
			String oriName = tmp.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+ "_"+oriName;
			fservice.insert(oriName, sysName, parent);
			tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
		}
		
		return "redirect:/sns/main";
	}
	
	@RequestMapping("love")
	@ResponseBody
	public String love(int seq,int love) {
		service.love(seq, love);		
		return "redirect:/sns/main";
	}

}
