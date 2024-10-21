package com.kh.kihoom.stock.stockChatWebsocket.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class StockChat {
	private int memNo;
	private String memId;
	private String message;
	private String date;
	
	
}
