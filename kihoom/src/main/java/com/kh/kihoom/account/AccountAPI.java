package com.kh.kihoom.account;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AccountAPI {
	
	@ResponseBody
	@RequestMapping(value = "acc.do")
	public String userAccount(HashMap<String, String> p) throws IOException {
		
		String clientId = "04929eed-efab-41de-87b0-82722b6813c0";
		String redirectUri = "http://localhost:8888/kihoom";
		String scope = "login inquiry transfer";
		String state = "12345678901234567890123456789012";
		
		String url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		url += "?response_type=code";
		url += "&client_id=" + clientId;
		url += "&redirect_uri=" + redirectUri;
		url += "&scope=" + scope;
		url += "&state=" + state;
		
//		URL requestUrl = new URL(url);
//		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
//		urlConnection.setRequestMethod("GET");
//		
//		BufferedReader br = new BufferedReader( new InputStreamReader(urlConnection.getInputStream()) );
//		
//		System.out.println(br);
//		
//		br.close();
//		urlConnection.disconnect();
		
		return url;
	}
	
}
