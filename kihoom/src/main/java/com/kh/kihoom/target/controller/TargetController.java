package com.kh.kihoom.target.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TargetController {
	
	@RequestMapping("target.ta")
	public String targetMainView() {
		return "acountBook/targetMain";
	}

}
