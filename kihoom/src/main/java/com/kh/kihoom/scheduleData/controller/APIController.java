package com.kh.kihoom.scheduleData.controller;

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
public class APIController {

	private static final String serviceKey ="AgoV%2BZ2j5pq8LO%2BIue%2FQxk4cMHNb9rWqswfLyXF%2BKlOiFEGhbKEWFwykZWKjdS7fJepYEeOQGo%2Ba9GgTlkQWHg%3D%3D";
	
	@ResponseBody
	@RequestMapping(value = " 예비 ", produces = "application/json; charset=utf-8")
	public String HousingSub(String location) throws IOException{
		
		String url = "https://api.odcloud.kr/api/ApplyhomeInfoDetailSvc/v1/getUrbtyOfctlLttotPblancDetail?page=1&perPage=10"; //page, perPage 삭제
		url += "&serviceKey=" + serviceKey;
		url += "&returnType=json"; 
		url += "&numOfRows=10000000";
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br= new BufferedReader( new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) !=null) {
			responseText +=line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}



}
