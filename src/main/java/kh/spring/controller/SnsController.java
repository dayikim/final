package kh.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kh.spring.dao.ProfileFilesDAO;
import kh.spring.dto.SnsDTO;
import kh.spring.dto.SnsFilesDTO;
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
	@Autowired
	private ProfileFilesDAO pffd;
	private int seq = 0;
	
	@RequestMapping("/main")
	public String main(Model model) throws Exception {
		String id= (String)session.getAttribute("loginID"); //글 목록
		
		List<SnsDTO>list = service.initpage(id); //SNS에서 초기에 로딩되는 페이지 (최신 글 순 5개가 출력됨)
		model.addAttribute("list", list);
		model.addAttribute("snslength",service.selectAll(id).size());
		
		List<String> initProfile = new ArrayList<String>();
		for(SnsDTO sd : list) {
			initProfile.add(pffd.profileSelect(sd.getId()) != null?
							fservice.toProfileBinary(session, pffd.profileSelect(sd.getId()).getSysName()):
							null);
		}
		model.addAttribute("initprofile", initProfile);
		
		for(SnsDTO sd : list) {
		System.out.println("처음 로딩되는 페이지: " +sd.getSeq());
		}
		List<String> ldto = service.existlike(id); //좋아요목록
		model.addAttribute("isLove",ldto);

		List<SnsFilesDTO>fdto = fservice.sendList(session); //파일목록
		model.addAttribute("file", fdto);
		return "sns/main";
	}
	
	@RequestMapping("/modifyfile")
	@ResponseBody
	public String modifyfile(int parent) {
		List<SnsFilesDTO>list = fservice.modiFile(parent);
		Gson gs = new Gson();
		return gs.toJson(list);
	}
	
	@RequestMapping("page")
	@ResponseBody
	public String page(int count) {
		String id = (String)session.getAttribute("loginID");
		int viewcount = 5;
		List<SnsDTO>list = service.page(id,viewcount,count);
		for(SnsDTO sd : list) {
			System.out.println("페이스북에서 가져오는 seq: " +sd.getSeq());
			}
		Gson g = new Gson();
		String result = g.toJson(list);
		return result;
		
	}
	
	@RequestMapping("snspicture")
	@ResponseBody
	public String snspicture(int firstseq, int lastseq) throws Exception {
		List<SnsFilesDTO>fdto = fservice.snsFileList(session, firstseq, lastseq);
		Gson g = new Gson();
		return g.toJson(fdto);
	}
	
	@RequestMapping("snsprofileimage")
	@ResponseBody
	public String snsprofileimage(String id) throws Exception {	
		return pffd.profileSelect(id) != null ? fservice.toProfileBinary(session, pffd.profileSelect(id).getSysName()) : null;
	}
	
	@RequestMapping("isliked")
	@ResponseBody
	public String isliked() throws Exception {	
		List<String> ldto = service.existlike((String)session.getAttribute("loginID"));
		Gson g = new Gson();
		return g.toJson(ldto);
	}
	
	@RequestMapping("/write")
	@ResponseBody
	public String write(String contents,String category) throws Exception{
		String id = (String)session.getAttribute("loginID");
		int seq = service.seq();
		String region = service.region(id);
		service.insert(seq, id, contents, category, region);
		session.setAttribute("temp_seq", seq);
		System.out.println(seq);
		return String.valueOf(seq);
	}
	
	@RequestMapping("/file")
	@ResponseBody
	public String file(MultipartHttpServletRequest request) throws Exception{
		System.out.println(seq);
			List<MultipartFile> fileList = request.getFiles("file");
			String realPath = session.getServletContext().getRealPath("files");
			String istransfer = "false";
			
			File filesPath = new File(realPath);
			if(!filesPath.exists()) {filesPath.mkdir();}
			for(MultipartFile tmp : fileList ) {
				System.out.println(tmp.getOriginalFilename());
			}
			for(MultipartFile tmp : fileList ) {
				String oriName = tmp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;	
				fservice.insert(oriName, sysName, (Integer)session.getAttribute("temp_seq"), (String)session.getAttribute("loginID"));
				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName)); 
				istransfer = "ture"; 				  
			}	
	return "istransfer";
}
	
	@RequestMapping("/delete")
	public String delete(int seq) {
		service.delete(seq);
		fservice.delete(seq);
		return "redirect:/sns/main";
	}
	
	@RequestMapping("/delfile")
	@ResponseBody
	public int delfile(int seq) {
		int result = fservice.deleteFile(seq);
		return result;
	}
	
	@RequestMapping("/modify")
	public String modify(int seq, Model model) throws Exception {
		String id = (String)session.getAttribute("loginID");
		String contents = service.select(seq);
		model.addAttribute("contents", contents);
		model.addAttribute("seq", seq);
		
		List<SnsDTO>list = service.selectAll(id); //글목록
		model.addAttribute("list", list);
		
		List<String> initProfile = new ArrayList<String>(); //프로필
		for(SnsDTO sd : list) {
			initProfile.add(pffd.profileSelect(sd.getId()) != null?
							fservice.toProfileBinary(session, pffd.profileSelect(sd.getId()).getSysName()):null);
		}
		model.addAttribute("initprofile", initProfile);
		
		List<String> ldto = service.existlike(id); //좋아요목록
		model.addAttribute("isLove",ldto);
		
		List<SnsFilesDTO>fdto = fservice.sendList(session); //파일목록
		model.addAttribute("file", fdto);

		return "sns/modify";
	}
	
	@RequestMapping("/modiProc")
	public String modiProc(String contents, String category, int seq1) throws Exception{
		seq = seq1;
		System.out.println(contents + category + seq);
		String id = (String)session.getAttribute("loginID");
		service.modify(contents, category, seq, id);
		
		return "redirect:/sns/main";
	}
	
	@RequestMapping("love") //좋아요반영
	@ResponseBody
	public int love(int seq,int love) {
		String id = (String)session.getAttribute("loginID");
		int countexists = service.getlike(id,seq);
		int resultcode = 1;
		if(countexists == 0) { //처음눌렀을때
			service.love(seq, love);
			service.pluslove(id, seq);
			resultcode = 1;
		}else {
			int count = service.getcount(id, seq);
			if(count ==1) { //취소했을때
				service.cancellove(seq, love);
				service.minuslove(id, seq);
				resultcode = 0;
			}else { //취소후 다시눌렀을때
				service.love(seq, love);
				service.updatecount(id, seq);
				resultcode = 1;
			}
		}		
		return resultcode;
	}
	
	@RequestMapping("/download") //사진다운로드
	public void download(String oriName, String sysName, HttpServletResponse resp) throws Exception{
		String filesPath = session.getServletContext().getRealPath("files");
		File targetFile = new File(filesPath + "/" + sysName);
		
		resp.setContentType("application/octet-stream; charset=utf-8");
		resp.setHeader("content-Disposition", "attachment;filename=\""+ oriName + "\"");
		
		try(ServletOutputStream sos = resp.getOutputStream();){
			FileUtils.copyFile(targetFile, sos);
			sos.flush();
		}
	}
	
	// 나의 커뮤니티 sns에서 글삭제
	@RequestMapping("/myDelete")
	public String myDelete(int seq) {
		service.delete(seq);
		fservice.delete(seq);
		return "redirect:/my/selectMySns";
	} 
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "Error";
	}
		
}
