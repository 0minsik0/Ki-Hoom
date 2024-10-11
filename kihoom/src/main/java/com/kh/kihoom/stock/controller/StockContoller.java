package com.kh.kihoom.stock.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class StockContoller {

	private static final String tAppkey="PSNzdnf4UtNBnrduPUlJ7PgXsZr4sjyLQFvw";
	private static final String tAppsecret="B6vHu51s3xKL6hsTajHeQUaZlwB2Ec+57AjtH+h6HpOAMDNln+9mmRTPPpb7i8XlQT5QPGa+6mkMq1qTv8L18h2rd3y66EVLdO3fGThig7JZpfaJYjwwWrLjf0G36IVcAri/rdDFmnmkcHftOb41gycA71frsuX9Cv8rt6EaTBGkDhx/xYg=";
	
	private static final String appkey ="PSIfx1pdjQlgcjk1c7lNhaBHWnB15rr7T5JS";
	private static final String appsecret ="lIs9yZIdbWjft8pCctH/fh8MfXsRvZqnqAjowhY+OCnOPFjNLO3MxYOhCLg0rOZubmLqJPQlaYw7lO6vp1N89l+xL9bfrzvh3+3OZET6WoeT83jRfaVXqEyzz8N6W/LMGJOTiyl+AQCfy3F4o9aJMTUYGsXI+zIPY5yxjpGtTYSyfoS8vAM=";
	
	
	
	/**
	 * @return 
	 * 주식 투자 메인 화면
	 */
	@RequestMapping("stock.st")
	public String stockMain() {
		return "stock/stockMain";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="stockKey.st" ,produces="aplication/json; charset=utf-8")
	public String stockTKey() {
		JSONObject key = new JSONObject();
		key.put("appkey", tAppkey);
		key.put("appsecret", tAppsecret);
		return key.toJSONString();
	}
	
	
	
	/**
	 * 현재 시세가
	 */
	@ResponseBody
	@RequestMapping(value="nowquotes.st", produces ="apllication/json; charset=utf-8")
	public String inquirePrice(String authorization) throws IOException, IOException {
		
		String url = "https://openapivts.koreainvestment.com:29443/uapi/domestic-stock/v1/quotations/inquire-price";
		url +="?fid_cond_mrkt_div_code=J" + //FID 조건 시장 분류 코드
                "&fid_input_iscd=000660"; //FID 입력 종목코드
		
		/*
		url += "?authorization="+ authorization;
		url += "&appkey="+ appkey;
		url += "&appsecret="+ appsecret;
		url += "&content-type="+ "application/json; charset=utf-8";
		url += "&content-type="+ "application/json; charset=utf-8";
		*/
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		//System.out.println(authorization);
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer "+ authorization);
		conn.setRequestProperty("appkey", tAppkey);
		conn.setRequestProperty("appsecret", tAppsecret);
		conn.setRequestProperty("tr_id", "FHKST01010100 ");
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String resoponseText = "";
		String line = "";
		
		while((line=br.readLine())!= null) {
			resoponseText += line;
		}
		
		br.close();
		conn.disconnect();
		
		return resoponseText;
	}
	
	
	/**
	 * 거래량 조회
	 */
	@ResponseBody
	@RequestMapping(value="volumeRank.st",produces="apllication/json; charset=utf-8")
	public String volumeRank() throws IOException {
		
		String url = "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/volume-rank";
		url += "?FID_COND_MRKT_DIV_CODE=J";
		url += "&FID_COND_SCR_DIV_CODE=20171";
		url += "&FID_INPUT_ISCD=0000";
		url += "&FID_DIV_CLS_CODE=0";
		url += "&FID_BLNG_CLS_CODE=0";
		url += "&FID_TRGT_CLS_CODE=111111111";
		url += "&FID_TRGT_EXLS_CLS_CODE=0000000000";
		url += "&FID_INPUT_PRICE_1=";
		url += "&FID_INPUT_PRICE_2=";
		url += "&FID_VOL_CNT=";
		url += "&FID_INPUT_DATE_1=";
		
		
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0b2tlbiIsImF1ZCI6ImYwNDVjOTZjLWUzNzctNDRjZC1hZjFmLTJhMjg0YmJlMjcwZiIsInByZHRfY2QiOiIiLCJpc3MiOiJ1bm9ndyIsImV4cCI6MTcyNzk0NDE0MywiaWF0IjoxNzI3ODU3NzQzLCJqdGkiOiJQU0lmeDFwZGpRbGdjamsxYzdsTmhhQkhXbkIxNXJyN1Q1SlMifQ.9-HtPkRBwzERKYiO5mke0uuU3vwFIjYkaIm8FnoGgtGvFb4YlBSoshR5SgnIJffri3Lk1hB_HpG-SvnOEEaOwQ");
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHPST01710000");
		conn.setRequestProperty("custtype", "P");
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText = "";
		String line ="";
		
		while((line=br.readLine())!= null) {
			responseText +=line;
		}
		
		br.close();
		conn.disconnect();
		
		return responseText;
		
		
		
		

	}
	
	
	
}
