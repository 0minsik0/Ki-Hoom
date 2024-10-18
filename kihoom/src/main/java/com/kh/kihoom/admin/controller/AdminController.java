package com.kh.kihoom.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kihoom.admin.model.service.AdminServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl aService;
	
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
