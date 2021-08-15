package kh.spring.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import kh.spring.dao.ChatFileDAO;
import kh.spring.dto.ChatFileDTO;

@Service
public class FileService {

	@Autowired
	ChatFileDAO cfd;
	
	
	public int uploadfile(int seq,String oriName,String sysName,String roomid,String id) { 
		 return cfd.insertFile(new ChatFileDTO(seq,oriName, sysName,roomid,id)); 
	}
	
	
	public String toBinary(HttpSession session,String sysName) throws Exception {
		/*
		 * for(MultipartFile tmp : binaryTofileList) { BufferedImage image =
		 * ImageIO.read(tmp.getInputStream()); ByteArrayOutputStream baos = new
		 * ByteArrayOutputStream(); ImageIO.write(image, "png", baos); String
		 * encodedImage =Base64Utils.encodeToString(baos.toByteArray());
		 * System.out.println(tmp.getName()+" / "+encodedImage); baos.close(); }
		 * 
		 * }
		 */
		/*
		 * List<String> list = new ArrayList(); for(ChatFileDTO cfdto:
		 * cfd.getList(roomid)) {
		 * list.add(Base64.getEncoder().encodeToString(getFileBinary(session.
		 * getServletContext().getRealPath("files")+"/"+cfdto.getSysName()))); }
		 */
		return Base64.getEncoder().encodeToString(getFileBinary(session.getServletContext().getRealPath("files")+"/"+sysName));
	}
	
	private byte[] getFileBinary(String filepath) {
		File file = new File(filepath);
		byte[] data = new byte[(int) file.length()];
		try (FileInputStream stream = new FileInputStream(file)) {
			stream.read(data, 0, data.length);
		} catch (Throwable e) {
			e.printStackTrace();
		}
			return data;
	}
	
	public void download(HttpSession session,HttpServletResponse resp,int seq) throws Exception {
		ChatFileDTO temp = getFile(seq);
		String filesPath = session.getServletContext().getRealPath("files");
		File targetFile = new File(filesPath+"/"+temp.getSysName());
		
		temp.setOriName(new String(temp.getOriName().getBytes(),"ISO_8859-1"));
		
		resp.setContentType("application/octet-stream; charset =utf8");
		resp.setHeader("content-Disposition", "attachment;filename=\""+temp.getOriName()+"\"");
		
		try(FileInputStream fis = new FileInputStream(targetFile);
			ServletOutputStream sos = resp.getOutputStream();	
				){
			FileUtils.copyFile(targetFile, sos);
			sos.flush();
		} 
	}
	
	public ChatFileDTO getFile(int seq) {
		return cfd.getFile(seq);
	}
	
	public int getSeq() {
		return cfd.getSeq();
	}
	
	
}
