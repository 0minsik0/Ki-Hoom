package com.kh.kihoom.aichat.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kihoom.member.model.service.MemberServiceImpl;
import com.kh.kihoom.member.model.vo.Member;

@Controller
public class aichatController {
		
	    // 회원가입 페이지 이동
		@RequestMapping("aichat.ac")
		public String aichat() {
		    return "aichat/aichat";  // 회원가입 폼으로 이동
		}
		
		
		
}
