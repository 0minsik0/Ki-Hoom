package com.kh.kihoom.stock.stockChatWebsocket;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.kihoom.stock.stockChatWebsocket.model.service.StockSocketServiceImpl;
import com.kh.kihoom.stock.stockChatWebsocket.model.vo.StockChat;


public class ChatHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Autowired
	private StockSocketServiceImpl stockService;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		ArrayList<StockChat> list = stockService.selectMessageList();
		
		
		
		for(StockChat sc:list) {
			JSONObject jo =new JSONObject();
			jo.put("userNo", sc.getMemNo()+"");
			jo.put("userId", sc.getMemId());
			jo.put("msg", sc.getMessage());
			jo.put("date", sc.getDate());
			
			session.sendMessage(new TextMessage(jo.toJSONString()));
		}
		
		
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println(message.getPayload());
		
		JsonObject jo = JsonParser.parseString(message.getPayload()).getAsJsonObject();
		
//		System.out.println(jo);
		int userNo = jo.get("userNo").getAsInt();
		String userId = jo.get("userId").getAsString();
		String msg = jo.get("msg").getAsString();
		String date = jo.get("date").getAsString();
		
		
		StockChat sc = new StockChat();
		sc.setMemNo(userNo);
		sc.setMemId(userId);
		sc.setMessage(msg);
		sc.setDate(date);
		
		int result = stockService.insertMessage(sc);
		
		if(result>0) {
			session.sendMessage(new TextMessage(message.getPayload()));
		}else {
			session.sendMessage(new TextMessage("insert fail"));
		}

//		for(WebSocketSession sess: sessionList) {
//			sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
//		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

}
