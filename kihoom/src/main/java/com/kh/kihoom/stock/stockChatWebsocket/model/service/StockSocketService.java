package com.kh.kihoom.stock.stockChatWebsocket.model.service;

import java.util.ArrayList;

import com.kh.kihoom.stock.stockChatWebsocket.model.vo.StockChat;

public interface StockSocketService {

	int insertMessage(StockChat sc);

	ArrayList<StockChat> selectMessageList();

}
