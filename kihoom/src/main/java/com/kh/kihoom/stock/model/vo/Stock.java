package com.kh.kihoom.stock.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Stock {

	
	private String stockNo;
	private String sotckId;
	private int memNo;
	private String stockAccount;
	private String price;
	private String prdyCtrt; // 전일 대비율
	private String prdyvrssvolRate; //전일 대비 거래량비율
	
}
