package com.kh.kihoom.acountBook.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.kihoom.acountBook.model.service.AcountServiceImpl;
import com.kh.kihoom.acountBook.model.vo.Acount;

import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.common.template.Pagination;
import com.kh.kihoom.member.model.vo.Member;

@Controller
public class AcountBookController {
	
	@Autowired
	private AcountServiceImpl aService;
	
	private static final String clientId = "b0fe461d-f5c1-454f-87af-6f063de143bf";
	private static final String clientSecret = "10d37300-57c4-44c8-94cb-a2d5e938ce76";

	// 가게부 메인화면
	@RequestMapping("acountBook.ac")
	public ModelAndView acountBookView(@RequestParam(value="cpage", defaultValue = "1") int currentPage,
								 ModelAndView mv, HttpSession session, Acount acount) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memNo = loginUser.getMemNo();
		
		int listCount = aService.selectListCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Acount> list = aService.selectList(pi, memNo);
		
		ArrayList<Acount> totalList = aService.totalList(memNo);
		
		ArrayList<Acount> monthList = aService.monthList(memNo);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("totalList", totalList)
		  .addObject("monthList", monthList)
		  .setViewName("acountBook/acountBookMain");

		return mv;
	}
	
	// 계좌 조회를 위한 토큰받기위한 인증
	@ResponseBody
	@RequestMapping(value = "certification.ac", produces = "application/json; charset=utf-8")
	public String certificationAcount() throws IOException {
		
		String url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		url += "?response_type=code";
		url += "&client_id=" + clientId;
		url += "&redirect_uri=http://localhost:8888/kihoom/acountBook.ac";
		url += "&scope=" + URLEncoder.encode("login transfer inquiry", "utf-8");
		url += "&state=123456789012345678901234567890" + (int)((Math.random()*99)+10);
		url += "&auth_type=0";

		return "{\"url\":\"" + url + "\"}";
	}
	
	// 계좌 조회를 위한 토큰 발급
	@ResponseBody
	@RequestMapping(value = "passport.ac", produces = "application/json; charset=utf-8")
	public String passportAcount(String code) throws IOException {
		
		String url = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		url += "?code=" + code;
		url += "&client_id=" + clientId;
		url += "&client_secret=" + clientSecret;
		url += "&redirect_uri=http://localhost:8888/kihoom/acountBook.ac";
		url += "&grant_type=authorization_code";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnetction = (HttpURLConnection)requestUrl.openConnection();
		urlConnetction.setRequestMethod("POST");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnetction.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnetction.disconnect();
		
		return responseText;
	}
	
	
	// 가게부 수기작성 페이지화면
	@RequestMapping("inputView.ac")
	public String acountBookInputView() {
		return "inputAcountBook";
	}
	
	// 수기작성 페이징바
	@RequestMapping(value = "list.ac")
	public ModelAndView acountList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, 
								   ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
					
		int memNo = loginUser.getMemNo();
		
		int listCount = aService.selectListCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Acount> list = aService.selectList(pi, memNo);
		
		mv.addObject("pi", pi)
		.addObject("list", list)
		.setViewName("acountBook/acountBookMain");
			
		return mv;

	}
	
	// 가게부 수기작성 insert
	@RequestMapping("input.ac")
	public String inputAcountBook(Acount a, HttpSession session) {
		
		int result = aService.insertAcountBook(a);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:acountBook.ac";
		}else {
			session.setAttribute("alertMsg", "등록이 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	// 월별 수입 통계
	@ResponseBody
	@RequestMapping(value = "monthIn.ac", produces = "application/json; charset=utf-8")
	public String monthInAmount(Acount a) {
		ArrayList<Acount> list = aService.mInList(a);
		return new Gson().toJson(list);
	}
	
	// 월별 지출 통계
	@ResponseBody
	@RequestMapping(value = "monthOut.ac", produces = "application/json; charset=utf-8")
	public String monthOutAmount(Acount a) {
		ArrayList<Acount> list = aService.mOutList(a);
		return new Gson().toJson(list);
	}
	
	
	
}
