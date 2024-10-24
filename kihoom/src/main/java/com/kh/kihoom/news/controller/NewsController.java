package com.kh.kihoom.news.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

@Controller
public class NewsController {
	
	private static final String serviceKey = "ZnJHRJcFm1CHgoqO9w%2BLRHa4cDabVANf76N8bG6DVVZBPZp7ZYtg1dmCIu2Ru5CAjhOvZNF9zGHtP4rwJnX4lg%3D%3D";
	private static final String apiKey = "27453aadccd3440e8817528adb6d4d98";
	// 세계뉴스 jsp
	@RequestMapping(value = "view.ne")
	public String mainViewNews() {
		return "news/newsMain";
	}
	
	// 세계뉴스 API
	@ResponseBody
	@RequestMapping(value = "global.ne", produces = "application/json; charset=utf-8")
	public String globalNews() throws IOException {
		
		String url = "https://apis.data.go.kr/B410001/kotra_overseasMarketNews/ovseaMrktNews/ovseaMrktNews";
		url += "?serviceKey=" + serviceKey;
		url += "&numOfRows=30";
		url += "&pageNo=1";
		url += "&search5=I001209";
		url += "&search6=ECNMY";
		
		URL requesturl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requesturl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line=br.readLine())!=null) {
			responseText+=line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
		
	}
	
	// 뉴스찾기 jsp
	@RequestMapping(value = "searchView.ne")
	public String searchNewsView() {
		return "news/newsSearch";
	}
	
	// 딥서치 뉴스찾기 API
	@ResponseBody
	@RequestMapping(value = "search.ne", produces = "application/json; charset=utf-8")
	public String searchNews(String articles, String keyword) throws IOException {
		
		String url = "https://api-v2.deepsearch.com/v1/" + articles;
		url += "?keyword=title:(" + URLEncoder.encode(keyword, "utf-8") + ")";
		url += "&api_key=" + apiKey;
		url += "&page_size=30";
		
		URL requetUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requetUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line=br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	
	

}
