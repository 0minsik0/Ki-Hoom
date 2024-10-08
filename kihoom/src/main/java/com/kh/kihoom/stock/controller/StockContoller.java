package com.kh.kihoom.stock.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class StockContoller {

	private static final String tAppkey="PSNzdnf4UtNBnrduPUlJ7PgXsZr4sjyLQFvw";
	private static final String tAppsecret="B6vHu51s3xKL6hsTajHeQUaZlwB2Ec+57AjtH+h6HpOAMDNln+9mmRTPPpb7i8XlQT5QPGa+6mkMq1qTv8L18h2rd3y66EVLdO3fGThig7JZpfaJYjwwWrLjf0G36IVcAri/rdDFmnmkcHftOb41gycA71frsuX9Cv8rt6EaTBGkDhx/xYg=";
	
	private static final String appkey ="PSIfx1pdjQlgcjk1c7lNhaBHWnB15rr7T5JS";
	private static final String appsecret ="lIs9yZIdbWjft8pCctH/fh8MfXsRvZqnqAjowhY+OCnOPFjNLO3MxYOhCLg0rOZubmLqJPQlaYw7lO6vp1N89l+xL9bfrzvh3+3OZET6WoeT83jRfaVXqEyzz8N6W/LMGJOTiyl+AQCfy3F4o9aJMTUYGsXI+zIPY5yxjpGtTYSyfoS8vAM=";
	
	private static String token ="";
	
	private static String approvalKey="";
	
	/**
	 * @return 
	 * 주식 투자 메인 화면
	 * @throws 
	 */
	@RequestMapping("stock.st")
	public String stockMain() throws IOException {
		
		if(token.equals("")) {
			token();
			
		}
		
		
		return "stock/stockMain";
	}
	
	
	
	
	
	
	
	
	public void token() throws IOException {
		
		String url = "https://openapi.koreainvestment.com:9443/oauth2/tokenP";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		//String data ="grant_type=client_credentials&appkey="+appkey+"&appsecret="+appsecret;
		
		JSONObject data  = new JSONObject();
		data.put("grant_type", "client_credentials");
		data.put("appkey", appkey);
		data.put("appsecret", appsecret);
		
		
		conn.setRequestMethod("POST");
		//conn.setRequestProperty(key, value);
		conn.setDoOutput(true);
		conn.setDoInput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(data.toJSONString().getBytes("UTF-8"));
		//os.flush();
		os.close();
		
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText ="";
		
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		
		conn.disconnect();
		//System.out.println(responseText);
		JsonObject jo = JsonParser.parseString(responseText).getAsJsonObject();
		
		//System.out.println();
		
		token =jo.get("access_token").getAsString();
		
		
		
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 현재 시세가
	 */
	@ResponseBody
	@RequestMapping(value="nowquotes.st", produces ="apllication/json; charset=utf-8")
	public String inquirePrice(String code) throws IOException, IOException {
		
		String url = "https://openapivts.koreainvestment.com:29443/uapi/domestic-stock/v1/quotations/inquire-price";
		url +="?fid_cond_mrkt_div_code=J" ; //FID 조건 시장 분류 코드
		url +=   "&fid_input_iscd="+code; //FID 입력 종목코드
		
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
		conn.setRequestProperty("authorization","Bearer "+ token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
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
		conn.setRequestProperty("authorization","Bearer "+token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHPST01710000");
		conn.setRequestProperty("custtype", "P");
		//conn.setRequestProperty("tr_cont", "1");
		
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
	
	
	@ResponseBody
	@RequestMapping(value="fluctuation.st", produces="aplication/json; charset=utf-8")
	public  String fluctuation(int no) throws IOException {
		// 등락률 순위
		
		String url = "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/ranking/fluctuation";
		/*
		 * /uapi/domestic-stock/v1/ranking/fluctuation?fid_cond_mrkt_div_code=J&fid_cond_scr_div_code=20170&fid_input_iscd=0000&fid_rank_sort_cls_code=0&fid_input_cnt_1=0&fid_prc_cls_code=0&fid_input_price_1=&fid_input_price_2=&fid_vol_cnt=&fid_trgt_cls_code=0&fid_trgt_exls_cls_code=0&fid_div_cls_code=0&fid_rsfl_rate1=&fid_rsfl_rate2=
		
		System.out.println("https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/ranking/fluctuation?fid_cond_mrkt_div_code=J&fid_cond_scr_div_code=20170&fid_input_iscd=0000&fid_rank_sort_cls_code=0&fid_input_cnt_1=0&fid_prc_cls_code=0&fid_input_price_1=&fid_input_price_2=&fid_vol_cnt=&fid_trgt_cls_code=0&fid_trgt_exls_cls_code=0&fid_div_cls_code=0&fid_rsfl_rate1=&fid_rsfl_rate2=");
		*/
		
		url += "?fid_rsfl_rate2=";
		url += "&fid_cond_mrkt_div_code=J";
		url += "&fid_cond_scr_div_code=20170";
		url += "&fid_input_iscd=0000";
		//0000(전체) 코스피(0001), 코스닥(1001), 코스피200(2001)
		url += "&fid_rank_sort_cls_code="+no;
		//0:상승율순 1:하락율순 2:시가대비상승율 3:시가대비하락율 4:변동율
		url += "&fid_input_cnt_1=0";
		url += "&fid_prc_cls_code=0";
		url += "&fid_input_price_1=";
		url += "&fid_input_price_2=";
		url += "&fid_vol_cnt=";
		url += "&fid_trgt_cls_code=0";
		url += "&fid_trgt_exls_cls_code=0";
		url += "&fid_div_cls_code=0";
		url += "&fid_rsfl_rate1=";
		//System.out.println(url);
		
		
		
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer "+ token);
		conn.setRequestProperty("appkey", appkey	);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHPST01700000");
		conn.setRequestProperty("custtype", "P");
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText ="";
		
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		
		conn.disconnect();

		
		return responseText;
	
		
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="market.st", produces="aplication/json; charset=utf-8")
	public String market() throws IOException {
		// 시장가치
		String year = new SimpleDateFormat("yyyy").format(new Date());
		
		String url = "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/ranking/market-value";
		
		url += "?fid_trgt_cls_code=0";
		url += "&fid_cond_mrkt_div_code=J";
		url += "&fid_cond_scr_div_code=20179";
		url += "&fid_input_iscd=0000";
		url += "&fid_div_cls_code=0";
		url += "&fid_input_price_1=";
		url += "&fid_input_price_2=";
		url += "&fid_vol_cnt=";
		url += "&fid_input_option_1="+year;
		url += "&fid_input_option_2=3";
		url += "&fid_rank_sort_cls_code=23";
		url += "&fid_blng_cls_code=0";
		url += "&fid_trgt_exls_cls_code=0";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization", "Bearer " +  token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHPST01790000");
		conn.setRequestProperty("custtype", "P");
		
		conn.connect();
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText = "";
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		br.close();
		
		conn.disconnect();
		
		//System.out.println(responseText);
		return responseText;
		
	}
	
	
	
	@RequestMapping("detail.st")
	public ModelAndView detailForm(String code,ModelAndView mv) throws IOException {
		
		
		if(approvalKey.equals("")) {
			approvalKey();
		}
		
		mv.addObject("code", code).addObject("approvalKey", approvalKey).setViewName("stock/stockDeteil");
		
		return mv;
	}
	
	
	
	
	/**
	 * @throws 실시간 웹소켓 키
	 */
	public void approvalKey() throws  IOException {
		
		String url = "https://openapi.koreainvestment.com:9443/oauth2/Approval";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		//String data ="grant_type=client_credentials&appkey="+appkey+"&appsecret="+appsecret;
		
		JSONObject data  = new JSONObject();
		data.put("grant_type", "client_credentials");
		data.put("appkey", appkey);
		data.put("secretkey", appsecret);
		
		
		conn.setRequestMethod("POST");
		conn.setRequestProperty("content-type", "application/json");
		//conn.setRequestProperty(key, value);
		conn.setDoOutput(true);
		conn.setDoInput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(data.toJSONString().getBytes("UTF-8"));
		//os.flush();
		os.close();
		
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText ="";
		
		String line ="";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		
		conn.disconnect();
		//System.out.println(responseText);
		JsonObject jo = JsonParser.parseString(responseText).getAsJsonObject();
		
		//System.out.println(responseText);
		
		approvalKey =jo.get("approval_key").getAsString();
		
		
		
		
		
	}
	
	
	
	
	
	
}
