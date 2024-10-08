package com.kh.kihoom.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StockContoller {

	private static final String appkey="PSNzdnf4UtNBnrduPUlJ7PgXsZr4sjyLQFvw";
	private static final String appsecret="B6vHu51s3xKL6hsTajHeQUaZlwB2Ec+57AjtH+h6HpOAMDNln+9mmRTPPpb7i8XlQT5QPGa+6mkMq1qTv8L18h2rd3y66EVLdO3fGThig7JZpfaJYjwwWrLjf0G36IVcAri/rdDFmnmkcHftOb41gycA71frsuX9Cv8rt6EaTBGkDhx/xYg=";
	
	
	/**
	 * @return 
	 * 주식 투자 메인 화면
	 */
	@RequestMapping("stock.st")
	public String stockMain() {
		return "stock/stockMain";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="")
	public String stockKey() {
		return "";
	}
	
	
	
}
