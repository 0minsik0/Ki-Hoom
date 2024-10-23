package com.kh.kihoom.target.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.common.template.Pagination;
import com.kh.kihoom.member.model.vo.Member;
import com.kh.kihoom.target.model.service.TargetServiceImpl;
import com.kh.kihoom.target.model.vo.Target;

@Controller
public class TargetController {
	
	@Autowired
	private TargetServiceImpl tService;
	
	@RequestMapping("target.ta")
	public ModelAndView targetMainView(@RequestParam(value = "cpage", defaultValue = "1") int currentPage
									   , ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		
		int listCount = tService.targetCountList(memNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Target> list = tService.targetList(pi, memNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("target/targetMain");
		
		return mv;
	}

}
