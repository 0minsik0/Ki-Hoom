package com.kh.kihoom.stock.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.stock.model.dao.StockDao;
import com.kh.kihoom.stock.model.vo.Stock;
import com.kh.kihoom.stock.model.vo.StockCategory;

@Service
public class StockServiceImpl implements StockService{

	@Autowired
	private SqlSessionTemplate sql;
	@Autowired
	private StockDao sDao;

	@Override
	public int selectStockChoose(Stock s) {
		// TODO Auto-generated method stub
		return sDao.selectStockChoose(sql,s);
	}

	@Override
	public int insertStockChoose(Stock s) {
		// TODO Auto-generated method stub
		return sDao.insertStockChoose(sql,s);
	}

	@Override
	public int deleteStockChosse(Stock s) {
		// TODO Auto-generated method stub
		return sDao.deleteStockChosse(sql,s);
	}

	@Override
	public ArrayList<Stock> selectStockAccount(int memNo) {
		// TODO Auto-generated method stub
		return sDao.selectStockAccount(sql,memNo);
	}

	@Override
	public ArrayList<Stock> selectChooseList(int memNo) {
		// TODO Auto-generated method stub
		return sDao.selectChooseList(sql,memNo);
	}

	@Override
	public int insertAddAccount(Stock s) {
		// TODO Auto-generated method stub
		return sDao.insertAddAccount(sql, s);
	}

	@Override
	public ArrayList<StockCategory> selectCategoryList(ArrayList<String> categoryList) {
		// TODO Auto-generated method stub
		return sDao.selectCategoryList(sql, categoryList);
	}





}
