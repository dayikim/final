package kh.spring.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.config.SHA256;
import kh.spring.dto.PersonDTO;
import kh.spring.service.PersonService;
import kh.spring.service.certificationService;
import kh.spring.config.VerifyRecaptcha;

@Controller
@RequestMapping("/person")
public class PersonController {
	
	@Autowired
	private PersonService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/join")
	public String join() {
		return "person/join";
	}
	
	@RequestMapping(value = "send",  produces = "application/String; charset=utf-8")
	@ResponseBody
	public String send(String phone) {
		System.out.println(phone);
		Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phone);
        System.out.println("인증번호 : " + numStr);
        certificationService.certifiedPhoneNumber(phone,numStr);
        return numStr;
    }
	
	@ResponseBody
	@RequestMapping(value="duplCheck",produces="text/html;charset=utf-8")
	public String duplCheck(String id) {
		
		int result = service.idDuplCheck(id);
		return String.valueOf(result);		
	}
	
	@RequestMapping("/joinProc")
	public String joinProc(PersonDTO dto) throws Exception{	
		String shaPass = SHA256.getSHA512(dto.getPw());
		int zero = 0;
		dto.setPw(shaPass);
		dto.setLoginFailCount(zero);
		service.insert(dto);
		return "person/joincomplete";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "person/login";
	}
	
	@RequestMapping("/loginProc")
	@ResponseBody
	public String loginProc(String id,String pw1) {
		String pw = SHA256.getSHA512(pw1);
		int login = service.login(id, pw);
		if(login > 0) {
			session.setAttribute("loginID", id);
			service.resetlogincount(id); //로그인실패카운트 리셋
		}
		return String.valueOf(login);
	}
	
	@RequestMapping("/checkid")
	@ResponseBody
	public String checkid(String id) {
		int checkid = service.checkid(id);
		if(checkid > 0) {
			service.failcount(id);
		}
		return String.valueOf(checkid);
	}
	
	@RequestMapping("/checkcount")
	@ResponseBody
	public int checkcount(String id) {
		int checkcount = service.checkcount(id);
		System.out.println(checkcount);
		return checkcount;
	}
	
    @ResponseBody
    @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
    public int VerifyRecaptcha(HttpServletRequest request) {
        VerifyRecaptcha.setSecretKey("6Ldka9IbAAAAALFJ8c8Q6AfJ8M2si8Wq35Rs1OrC");
        String gRecaptchaResponse = request.getParameter("recaptcha");
        System.out.println(gRecaptchaResponse);
        //0 = 성공, 1 = 실패, -1 = 오류
        try {
            if(VerifyRecaptcha.verify(gRecaptchaResponse))
                return 0;
            else return 1;
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }
	
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		return "person/findId";
	}
	
	@RequestMapping("/findIdProc")
	@ResponseBody
	public String findIdProc(PersonDTO dto) {
		String id = service.findid(dto);
		return id;
	}
	
	@RequestMapping("/checkId")
	public String checkId(String id,Model model) {
		String cid = id;
		model.addAttribute("id", cid);
		return "person/checkId";
		
	}
	
	@RequestMapping("/findPw")
	public String findPw() {
		return "person/findPw";
	}
	
	@RequestMapping("/checkInfo")
	@ResponseBody
	public String checkInfo(PersonDTO dto) {
		String info = service.checkInfo(dto);
		System.out.println(info);
		return info;
	}
	
	@RequestMapping("/updatePw")
	public String updatePw(String id,Model model) {
		String pid = id;
		model.addAttribute("id", pid);
		return "person/updatePw";
	}
	
	@RequestMapping("/pwProc")
	public String pwProc(PersonDTO dto) {
		String shaPass = SHA256.getSHA512(dto.getPw());
		dto.setPw(shaPass);
		service.pswd(dto);
		return "redirect:/";
	}
}