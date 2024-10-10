package com.kh.kihoom.acountBook.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AcountBookController {
	
	private static final String clientId = "b0fe461d-f5c1-454f-87af-6f063de143bf";
	private static final String clientSecret = "10d37300-57c4-44c8-94cb-a2d5e938ce76";

	@RequestMapping("acountBook.ac")
	public String acountBookView() {
		return "acountBook/acountBookMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "certification.ac", produces = "application/json; charset=utf-8")
	public String certificationAcount() throws IOException {
		
		String url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		url += "?response_type=code";
		url += "&client_id=" + clientId;
		url += "&redirect_uri=http://localhost:8888/kihoom/acountBook.ac";
		url += "&scope=" + URLEncoder.encode("login transfer", "utf-8");
		url += "&state=123456789012345678901234567890" + (int)((Math.random()*99)+10);
		url += "&auth_type=0";
		
		return "{\"url\":\"" + url + "\"}";
	}
	
	@RequestMapping("inputView.ac")
	public String acountBookInputView() {
		return "inputAcountBook";
	}
	
	@RequestMapping("input.ac")
	public String inputAcountBook() {
		return "redirect:inputAcountBook";
	}
}
