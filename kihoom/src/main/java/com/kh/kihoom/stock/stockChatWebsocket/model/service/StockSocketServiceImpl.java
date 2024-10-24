package com.kh.kihoom.stock.stockChatWebsocket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.kihoom.stock.stockChatWebsocket.model.dao.StockSocketDao;
import com.kh.kihoom.stock.stockChatWebsocket.model.vo.StockChat;

@Service
public class StockSocketServiceImpl implements StockSocketService{

	
	@Autowired
	private SqlSessionTemplate sql;
	@Autowired
	private StockSocketDao socketDao;
	
	
	@Override
	public int insertMessage(StockChat sc) {
		// TODO Auto-generated method stub
		return socketDao.insertMessage(sql, sc);
	}

	@Override
	public ArrayList<StockChat> selectMessageList() {
		// TODO Auto-generated method stub
		return socketDao.selectMessageList(sql);
	}

}
