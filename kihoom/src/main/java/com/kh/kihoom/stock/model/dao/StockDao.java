package com.kh.kihoom.stock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.stock.model.vo.Stock;
import com.kh.kihoom.stock.model.vo.StockCategory;

@Repository
public class StockDao {

	public int selectStockChoose(SqlSessionTemplate sql, Stock s) {
		return sql.selectOne("stockMapper.selectStockChoose", s);
	}
	
	
	public int insertStockChoose(SqlSessionTemplate sql, Stock s) {
		return sql.insert("stockMapper.insertStockChoose",s);
	}
	
	public int deleteStockChosse(SqlSessionTemplate sql, Stock s) {
		return sql.delete("stockMapper.deleteStockChosse", s);
	}
	
	public ArrayList<Stock> selectStockAccount(SqlSessionTemplate sql, int memNo){
		return (ArrayList)sql.selectList("stockMapper.selectStockAccount", memNo);
	}
	
	public ArrayList<Stock> selectChooseList(SqlSessionTemplate sql, int memNo){
		return (ArrayList)sql.selectList("stockMapper.selectChooseList", memNo);
	}
	
	public int insertAddAccount(SqlSessionTemplate sql, Stock s) {
		return sql.insert("stockMapper.insertAddAccount", s);
	}
	
	public ArrayList<StockCategory> selectCategoryList(SqlSessionTemplate sql , ArrayList<String> categoryList){
		return (ArrayList)sql.selectList("stockMapper.selectCategoryList", categoryList);
	}
	
	
}
