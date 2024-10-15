package com.kh.kihoom.stock.model.service;

import java.util.ArrayList;

import com.kh.kihoom.stock.model.vo.Stock;

public interface StockService {
	//관심 조회
	int selectStockChoose(Stock s);
	
	//관심 등록 
	int insertStockChoose(Stock s);
	
	//관심 등록 삭제
	int deleteStockChosse(Stock s);
	
	ArrayList<Stock> selectStockAccount(int memNo);
	
	
	ArrayList<Stock> selectChooseList(int memNo);
	
	int insertAddAccount(Stock s);
}
