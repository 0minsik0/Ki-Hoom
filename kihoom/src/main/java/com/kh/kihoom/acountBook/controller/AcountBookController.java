package com.kh.kihoom.acountBook.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AcountBookController {
	
	private static final String clientId = "b0fe461d-f5c1-454f-87af-6f063de143bf";
	private static final String clientSecret = "10d37300-57c4-44c8-94cb-a2d5e938ce76";

	// 가게부 메인화면
	@RequestMapping("acountBook.ac")
	public String acountBookView() {
		return "acountBook/acountBookMain";
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
	
	// input 폼 안에있는 값 디비저장
	@RequestMapping("input.ac")
	public String inputAcountBook() {
		return "redirect:inputAcountBook";
	}
	
	
	
}
