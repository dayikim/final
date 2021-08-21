package kh.spring.controller;


import java.io.File;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	HttpSession session;
	
	@Autowired
	FileService fs;
	
	private int seq;
	
	private boolean upload_process;
	
	
	@RequestMapping(value = "/upload")
	@ResponseBody
	public String upload(MultipartHttpServletRequest request) throws Exception{
			/*
			 * for(MultipartFile tmp : binaryTofileList ) { BufferedImage image =
			 * ImageIO.read(tmp.getInputStream()); ByteArrayOutputStream baos = new
			 * ByteArrayOutputStream((int)tmp.getSize()); ImageIO.write(image, "png", baos);
			 * String encodedImage =Base64Utils.encodeToString(baos.toByteArray());
			 * System.out.println( tmp.getName()+" / "+encodedImage); baos.close(); }
			 */
		List<MultipartFile> fileList = request.getFiles("file");
		String realPath = session.getServletContext().getRealPath("files");
		System.out.println("파일 컨트롤러안에 있는 업로드 매소드: "+realPath);
		String istransfer = "false";
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		for(MultipartFile tmp : fileList ) {
			seq= fs.getSeq();
			String oriName = tmp.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
			System.out.println(oriName);
			System.out.println(sysName);
			
			if(fs.uploadfile(seq,oriName, sysName, (String)session.getAttribute("roomid"), (String)session.getAttribute("loginID"))>0) { 
				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName)); 
				istransfer ="true"; 
			}
				  
		}
		
		return "istransfer";
	
	}
	
	@RequestMapping("/download")
	public void down(int seq, HttpServletResponse resp) throws Exception {
		fs.download(session, resp, seq);
	}

	public int getSeq() {
		return seq;
	}
	
	public boolean getprocess() {
		return this.upload_process;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
}
	

