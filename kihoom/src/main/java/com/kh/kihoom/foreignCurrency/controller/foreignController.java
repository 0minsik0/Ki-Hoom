package com.kh.kihoom.foreignCurrency.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class foreignController {
	
	private static final String serviceKey = "ZqFGRkcBWRxahw7BPdKMW8CMyh2hfm0f";
	
	@ResponseBody
	@RequestMapping(value="foreign.fo", produces="application/json")
	public String foreignCurrency() throws IOException{
		
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYYMMdd");
		String formatedNow = now.format(formatter);
		
		
		String url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON";
		url += "?authkey=" + serviceKey;
		url += "&searchdate=" + formatedNow;
		url += "&data=AP01";

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
		
		
	}
	
	@RequestMapping("foreign.fo")
	public String foreignCurrencyMain() {
		return "foreignCurrency/foreignCurrencyMain";
	}

}
