package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TalentBoardController {
	@RequestMapping("write")
	public String write() {
		return "/talentboard/write";
	}
	
}
