package com.kh.kihoom.scheduleData.model.run;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.kihoom.scheduleData.model.vo.SubInformation;

public class AirPollutionJavaApp {

	public static final String serviceKey = "AgoV%2BZ2j5pq8LO%2BIue%2FQxk4cMHNb9rWqswfLyXF%2BKlOiFEGhbKEWFwykZWKjdS7fJepYEeOQGo%2Ba9GgTlkQWHg%3D%3D";
	
	public static void main(String[] args) throws IOException{

		
		//OpenAPI서버로 요청하고자 하는 url 만들기
		String url = "";

		
		url += "?serviceKey=" + serviceKey; 
		url+= "&returnType=json";
		
		URL requestUrl = new URL(url);

		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection(); 
		
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()) ); 
		
		String responseText="";
		String line;
		while((line = br.readLine())!=null) {
			responseText+=line;
		}
		
		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
		
		/*
		JsonObject responseObj = totalObj.getAsJsonObject("response");//response속성 접근
		JsonObject bodyObj = responseObj.getAsJsonObject("body"); //body 속성접근 = {} JsonObejct
		int totalCount = bodyObj.get("totalCount").getAsInt(); //totalCount속성 접근 => 40 int
		JsonArray itemArr = bodyObj.getAsJsonArray("items"); //items 속성 접근 => [JsonArray]
		*/
		
		ArrayList<SubInformation> list = new ArrayList<SubInformation>();
		
		/*
		for(int i=0; i<totalObj.size(); i++) {
			JsonObject item = totalObj.get(i).getAsJsonObject();
			//System.out.println(item);
		
			SubInformation sub = new SubInformation();
			sub.setHouseManageNo(item.get("houseManageNo").getAsString());

			
			list.add(sub);
		}
		
		for(SubInformation s:list) {
			System.out.println(list); //출력 테스트
		}
		
		br.close();
		urlConnection.disconnect();
		*/
	
		
		
	}

}
