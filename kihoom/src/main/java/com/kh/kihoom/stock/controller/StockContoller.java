package com.kh.kihoom.stock.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.kihoom.stock.model.service.StockServiceImpl;
import com.kh.kihoom.stock.model.vo.Stock;
import com.kh.kihoom.stock.model.vo.StockCategory;


@Controller
public class StockContoller {

	
	// 한국투자증권 모의 투자 인증키
	private static final String tAppkey="PSNzdnf4UtNBnrduPUlJ7PgXsZr4sjyLQFvw";
	private static final String tAppsecret="B6vHu51s3xKL6hsTajHeQUaZlwB2Ec+57AjtH+h6HpOAMDNln+9mmRTPPpb7i8XlQT5QPGa+6mkMq1qTv8L18h2rd3y66EVLdO3fGThig7JZpfaJYjwwWrLjf0G36IVcAri/rdDFmnmkcHftOb41gycA71frsuX9Cv8rt6EaTBGkDhx/xYg=";
	
	
	//한국투자증권 실전 인증키
	private static final String appkey ="PSIfx1pdjQlgcjk1c7lNhaBHWnB15rr7T5JS";
	private static final String appsecret ="lIs9yZIdbWjft8pCctH/fh8MfXsRvZqnqAjowhY+OCnOPFjNLO3MxYOhCLg0rOZubmLqJPQlaYw7lO6vp1N89l+xL9bfrzvh3+3OZET6WoeT83jRfaVXqEyzz8N6W/LMGJOTiyl+AQCfy3F4o9aJMTUYGsXI+zIPY5yxjpGtTYSyfoS8vAM=";
	
	
	// 네이버 인증키
	private static final String naverId ="ZPsZLlyR0_kD8ni2BjxA";
	private static final String naverSecret ="C6VrkqKczu";
	
	
	//공공서비스 인증키
	private static final String apiKey ="nOK8KJwcjNmRHtG8JQVv9s8rtoFYk%2Fhf%2FGsSdzHgtl%2FGbGcd73kk5A45ykvBzUwzj1X4gJCKAo38%2BJmVCEhO0A%3D%3D";
	
	private static String token ="";
	
	private static String testToken="";
	
	
	private static String approvalKey="";
	
	
	
	@Autowired
	private StockServiceImpl sService;
	
	
	
	
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
	
	
	
	@ResponseBody
	@RequestMapping(value="chooseStock.st")
	public String chooseStock(String code, String userNo) {
		
	
		
		Stock s = new Stock();
		s.setStockNo(code);
		s.setMemNo(Integer.parseInt(userNo));
		
//		System.out.println(s);
		
		
		
		int result = sService.selectStockChoose(s);
		
//		System.out.println(result);
		
		String resultStr = "";
		
		if(result==0) {
			int insert= sService.insertStockChoose(s);
			
			if(insert>0) {
				resultStr="iyyy";
			}else {
				resultStr = "innn";
			}
		}else {
			int delete = sService.deleteStockChosse(s);
			if(delete>0) {
				resultStr="dyyy";
			}else {
				resultStr = "dnnn";
			}
		}
		
		
		return resultStr;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("selectChoose.st")
	public String selectChooseStock(String code, String userNo) {
		Stock s = new Stock();
		s.setStockNo(code);
		s.setMemNo(Integer.parseInt(userNo));
		
//		System.out.println(s);
		
		
		int result = sService.selectStockChoose(s);
		
		
		
		return result+"";
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
	public ModelAndView detailForm(String code,String codeName,ModelAndView mv) throws IOException {
		
		
		if(approvalKey.equals("")) {
			approvalKey();
		}
		
		mv.addObject("code", code).addObject("codeName", codeName).addObject("approvalKey", approvalKey).setViewName("stock/stockDeteil");
		
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
	
	
	
	
	@ResponseBody
	@RequestMapping(value="dailyPrice.st", produces="aplication/json; charset=utf-8")
	public String dailyPrice(String code, String daliy) throws IOException {
		String url = "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/inquire-daily-price";
		

		url += "?FID_COND_MRKT_DIV_CODE=J";
		url += "&FID_INPUT_ISCD="+code;
		url += "&FID_PERIOD_DIV_CODE="+daliy;
		url += "&FID_ORG_ADJ_PRC=0";


		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization", "Bearer " +  token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHKST01010400");

		
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
	
	
	
	
	@ResponseBody
	@RequestMapping(value="naverNew.st", produces="aplication/json; charset=utf-8")
	public String naverNewsStock(String codeName) throws IOException {
		String url = "https://openapi.naver.com/v1/search/news.json";
		
		url+= "?query="+URLEncoder.encode(codeName,"UTF-8");
		url+="&display=50";
		url+="&sort=date";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("X-Naver-Client-Id", naverId);
		conn.setRequestProperty("X-Naver-Client-Secret", naverSecret);
		
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
	
	

	@ResponseBody
	@RequestMapping(value="selectStockAccount.st",produces="aplication/json; charset=utf-8")
	public String selectStockAccount(String userNo) {
		
		ArrayList<Stock> list = sService.selectStockAccount(Integer.parseInt(userNo));
		
		
		
		return new Gson().toJson(list);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="selectChooseList.st",produces="aplication/json; charset=utf-8")
	public String selectChooseList(String userNo) throws IOException {
		
		ArrayList<Stock> list = sService.selectChooseList(Integer.parseInt(userNo));
		
		ArrayList<String> slist = new ArrayList<String>();
		
		for(Stock s : list) {

			String resoponseText = selectListStock(s.getStockNo());
			
			JsonObject jo = JsonParser.parseString(resoponseText).getAsJsonObject().get("output1").getAsJsonObject();
			jo.addProperty("stock_no", s.getStockNo());
			
			slist.add(jo.toString());
			
	

		}

		
		return new Gson().toJson(slist);
	}
	
	
	
	
	public String selectListStock(String code) throws IOException {
		
		String url ="https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/inquire-time-itemchartprice";
		
		String time =new SimpleDateFormat("hhmmss").format(new Date());
		
		
		url += "?FID_COND_MRKT_DIV_CODE=J";
		url += "&FID_INPUT_ISCD="+code;
		url += "&FID_ETC_CLS_CODE=";
		url += "&FID_INPUT_HOUR_1="+time;
		url += "&FID_PW_DATA_INCU_YN=Y";
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		//System.out.println(authorization);
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer "+ token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHKST03010200");
		conn.setRequestProperty("tr_cont", "P");
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		Stock s = new Stock();
		String resoponseText = "";
		String line = "";
		
		while((line=br.readLine())!= null) {
			resoponseText += line;
		}
		
		br.close();
		conn.disconnect();
//		System.out.println(resoponseText);
		
		
		
		return resoponseText;
		
		
	}

	
	@ResponseBody
	@RequestMapping(value="investOpinion.st", produces="aplication/json; charset=utf-8")
	public String investOpinion(String code) throws IOException {
		String url ="https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/invest-opinion";
		
		String year = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
//		System.out.println();
		
		Date d = new Date();
		d.setMonth(Integer.parseInt(year.substring(4, 6))-1-3);
		
		String beforeYear = new SimpleDateFormat("yyyyMMdd").format(d);
//		System.out.println(beforeYear);
		
		url +="?FID_COND_MRKT_DIV_CODE=J";
		url +="&FID_COND_SCR_DIV_CODE=16633";
		url +="&FID_INPUT_ISCD="+code;
		url +="&FID_INPUT_DATE_2=00"+year;
		url +="&FID_INPUT_DATE_1=00"+beforeYear;
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer "+ token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHKST663300C0");
		conn.setRequestProperty("tr_cont", "P");
		
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
	
	
	@ResponseBody
	@RequestMapping(value="category.st",  produces="aplication/json; charset=utf-8")
	public String category() throws IOException {
		String url = "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/quotations/inquire-index-category-price";
		url += "?FID_COND_MRKT_DIV_CODE=U";
		url += "&FID_INPUT_ISCD=0001";
		url += "&FID_COND_SCR_DIV_CODE=20214";
		url += "&FID_MRKT_CLS_CODE=K";
		url += "&FID_BLNG_CLS_CODE=3";
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestProperty("authorization","Bearer "+token);
		conn.setRequestProperty("appkey", appkey);
		conn.setRequestProperty("appsecret", appsecret);
		conn.setRequestProperty("tr_id", "FHPUP02140000");
		conn.setRequestProperty("custtype", "P");
		
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
		
		return responseText;
	}
	
	
	@ResponseBody
	@RequestMapping(value="buyStoct.st", produces="aplication/json; charset=utf-8")
	public String orderCash(String code,String division,String orderCount,String orderPrice, String firstAccount, String secondAccount ) throws IOException {
		
		if(testToken.equals("")) {
			testToeknP();
		}
		
		String url = "https://openapivts.koreainvestment.com:29443/uapi/domestic-stock/v1/trading/order-cash";
		
		JSONObject body = new JSONObject();
		body.put("CANO", firstAccount);
		body.put("ACNT_PRDT_CD", secondAccount);
		body.put("PDNO", code);
		body.put("ORD_DVSN", division);
		body.put("ORD_QTY", orderCount);
		body.put("ORD_UNPR", orderPrice);
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
	
		conn.setRequestMethod("POST");
		conn.setRequestProperty("authorization","Bearer "+ testToken);
		conn.setRequestProperty("appkey", tAppkey);
		conn.setRequestProperty("appsecret", tAppsecret);
		conn.setRequestProperty("tr_id", "VTTC0802U");
		
		conn.setDoOutput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(body.toJSONString().getBytes("UTF-8"));
		os.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		

		String responseText = "";
		String line= "";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		conn.disconnect();
		
		return responseText;
		
	}
	
	
	public void testToeknP() throws IOException {
		
		String url = "https://openapivts.koreainvestment.com:29443/oauth2/tokenP";
		
		
		JSONObject body = new JSONObject();
		body.put("grant_type", "client_credentials");
		body.put("appkey", tAppkey);
		body.put("appsecret", tAppsecret);
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(body.toJSONString().getBytes("UTF-8"));
		os.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText = "";
		String line= "";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		conn.disconnect();
		
		testToken= JsonParser.parseString(responseText).getAsJsonObject().get("access_token").getAsString();
	
		
	}
	
	
	@RequestMapping("addAccount.st")
	public ModelAndView addAccount(String memNo,String firstAccount, String secondAccount,ModelAndView mv) {
		
		Stock s = new Stock();
		s.setMemNo(Integer.parseInt(memNo));
		s.setStockAccount(firstAccount+"-"+secondAccount);
		
		int result = sService.insertAddAccount(s);
		
		
		if(result>0) {
			mv.addObject("alertMsg", "성공적으로 등록되었습니다.");
		}else {
			mv.addObject("alertMsg", "계좌등록에 실패했습니다.");
		}
		
		mv.setViewName("redirect:stock.st");
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectbuyStockList.st", produces="aplication/json; charset=utf-8")
	public String selectbuyStockList(String firstAccount, String secondAccount) throws IOException {
		
		if(testToken.equals("")) {
			testToeknP();
		}
		

		
		
		String url ="https://openapivts.koreainvestment.com:29443/uapi/domestic-stock/v1/trading/inquire-balance";
		url += "?CANO="+firstAccount; // 계좌 앞
		url += "&ACNT_PRDT_CD="+secondAccount; //계좌 뒤
		url += "&AFHR_FLPR_YN=N";
		url += "&OFL_YN=";
		url += "&INQR_DVSN=01";
		url += "&UNPR_DVSN=01";
		url += "&FUND_STTL_ICLD_YN=Y";
		url += "&FNCG_AMT_AUTO_RDPT_YN=N";
		url += "&PRCS_DVSN=00";
		url += "&CTX_AREA_FK100=";
		url += "&CTX_AREA_NK100=";
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("authorization","Bearer "+ testToken);
		conn.setRequestProperty("appkey", tAppkey);
		conn.setRequestProperty("appsecret", tAppsecret);
		conn.setRequestProperty("tr_id", "VTTC8434R");
		
		conn.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String responseText = "";
		String line= "";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		conn.disconnect();
		
		return responseText;
	}
	
	
	@ResponseBody
	@RequestMapping(value="searchStock.st", produces="aplication/json; charset=utf-8")
	public String searchStock(String search) throws IOException {
		
		String url ="https://apis.data.go.kr/1160100/service/GetKrxListedInfoService/getItemInfo";
		url += "?serviceKey="+apiKey;
		url += "&likeItmsNm="+URLEncoder.encode(search, "utf-8");
		url += "&resultType=json";
		
//		System.out.println(url);
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		conn.setRequestMethod("GET");
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		
		String responseText = "";
		String line= "";
		
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		
		br.close();
		conn.disconnect();
		
		return responseText;
	}

	
	
	@ResponseBody
	@RequestMapping(value="categoryList.st" , produces="aplication/json; charset=utf-8")
	public String categoryList(String category) {
		
		String[] categoryArr = category.split(",");
		
		ArrayList<String> categoryList = new ArrayList<String>(Arrays.asList(categoryArr));
		
//		System.out.println(categoryList);
		
		ArrayList<StockCategory> list = sService.selectCategoryList(categoryList);
		
		return new Gson().toJson(list);
	}

	
	
	
}
