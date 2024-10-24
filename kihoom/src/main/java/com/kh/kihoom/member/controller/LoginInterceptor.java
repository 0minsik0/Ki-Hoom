package com.kh.kihoom.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{ 
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")!= null ){
			//현재 요청을 보낸 사람이 로그인 되어있을 경우 =>컨트롤러 실행
			return true;
		}else {
			//로그인이 되어있지 않을 경우 =>Controller 실행 x
			
			session.setAttribute("alertMsg", "로그인 후 이용이 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		//근데 로그인 안했으면 false를 리턴시켜서 가지 못하게 만들어야함
	}
	
	
	
}
