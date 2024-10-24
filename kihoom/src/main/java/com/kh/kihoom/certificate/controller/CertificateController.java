package com.kh.kihoom.certificate.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CertificateController {

	@RequestMapping("certificateMain.ce")
	public String certificateMain() {
		
		return "certificate/certificateMain";
	}
	
	
	@ResponseBody
	@RequestMapping(value="subsidyList.ce" , produces="aplication/json; charset=utf-8")
	public String subsidyList(String page) throws IOException {
		String url = "https://api.odcloud.kr/api/gov24/v3/serviceList";
		url += "?page="+page;
		url += "&perPage=10";
		url += "&returnType=json";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		
		conn.setRequestProperty("Authorization", "Infuser nOK8KJwcjNmRHtG8JQVv9s8rtoFYk/hf/GsSdzHgtl/GbGcd73kk5A45ykvBzUwzj1X4gJCKAo38+JmVCEhO0A==");
		
		conn.connect();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText ="";
		
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
//			System.out.println(line);
		}
		
		br.close();
		
		conn.disconnect();
//		System.out.println(responseText);
		return responseText;
	}
	
	
	@ResponseBody
	@RequestMapping(value="subsidyDetail.ce" , produces="aplication/json; charset=utf-8")
	public String subsidyDetail(String Id) throws IOException {
		String url = "https://api.odcloud.kr/api/gov24/v3/serviceDetail";
		url += "?page=1";
		url += "&perPage=1";
		url += "&returnType=json";
		url += "cond%5B%EC%84%9C%EB%B9%84%EC%8A%A4ID%3A%3AEQ%5D="+ Id;
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		
		conn.setRequestProperty("Authorization", "Infuser nOK8KJwcjNmRHtG8JQVv9s8rtoFYk/hf/GsSdzHgtl/GbGcd73kk5A45ykvBzUwzj1X4gJCKAo38+JmVCEhO0A==");
		
		conn.connect();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText ="";
		
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
//			System.out.println(line);
		}
		
		br.close();
		
		conn.disconnect();
//		System.out.println(responseText);
		return responseText;
	}
	
	
	
}
