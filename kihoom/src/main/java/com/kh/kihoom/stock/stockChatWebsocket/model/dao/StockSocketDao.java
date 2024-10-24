package com.kh.kihoom.stock.stockChatWebsocket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kihoom.stock.stockChatWebsocket.model.vo.StockChat;

@Repository
public class StockSocketDao {

	public int insertMessage(SqlSessionTemplate sql, StockChat sc) {
		return sql.insert("stockMapper.insertMessage", sc);
	}
	
	public ArrayList<StockChat> selectMessageList(SqlSessionTemplate sql){
		return (ArrayList)sql.selectList("stockMapper.selectMessageList");
	}
	
}
