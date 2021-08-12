package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.PersonDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.ProfileFilesDTO;
import kh.spring.service.MypageService;
import kh.spring.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	@Autowired
	private  PointService PointService;

	@Autowired
	private MypageService MypageService;

	@Autowired
	private HttpSession session;

	@RequestMapping(value="ToCharging",produces="text/html;charset=utf8")
	public String tocharing( Model model) {
		String sessionID = (String) session.getAttribute("loginID");
		PersonDTO pdto = MypageService.mypageList(sessionID); // 내 정보 출력
		ProfileFilesDTO pfdto = MypageService.profileSelect(sessionID); // 내 프사 출력
		session.setAttribute("myInfo", pdto); // 내 정보
		model.addAttribute("profile",pfdto); //프로필
		return "/point/charging";
	}

	@RequestMapping(value="charging", produces="text/html;charset=utf8")
	public String Charging(PointDTO pointdto, Model model) throws Exception {
		String sessionID = (String) session.getAttribute("loginID");
		pointdto.setId(sessionID);
		PointService.charging(pointdto);
		return "/mypage/mypage";


	}

}

