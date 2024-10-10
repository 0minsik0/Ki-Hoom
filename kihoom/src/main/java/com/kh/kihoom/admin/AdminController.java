package com.kh.kihoom.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("admin.ad")
	public String adminMain() {
		return "admin/admin";
	}
	
	@RequestMapping("adminMember.ad")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	@RequestMapping("adminBoard.ad")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	
	

}
