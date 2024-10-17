package com.kh.kihoom.schedule.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kihoom.member.model.service.MemberServiceImpl;
import com.kh.kihoom.member.model.vo.Member;

@Controller
public class ScheduleController {
	
	/**
	 * @return 
	 * 스케줄화면
	 */
	@RequestMapping("schedule.sc")
	public String scheduleView() {
		
		

		return "schedule/scheduleView";
	}
	

	
}
