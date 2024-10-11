package com.kh.kihoom.scheduleData.run;

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

public class SubInforJavaApp {
	
	//OpenAPI서버로 요청하고자 하는 url 만들기
			String url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
			
			public static final String serviceKey = "AgoV%2BZ2j5pq8LO%2BIue%2FQxk4cMHNb9rWqswfLyXF%2BKlOiFEGhbKEWFwykZWKjdS7fJepYEeOQGo%2Ba9GgTlkQWHg%3D%3D";
			
			public static void main(String[] args) throws IOException{

				
				//OpenAPI서버로 요청하고자 하는 url 만들기
				String url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
				
				//url += "?serviceKey= Zd7dRgZbuuOm45dh0lD3AsbumQkKiBti7QMD01aKHAgTlImhn%2BsLSluo4RT8JEHZsY7CU5z80ybabpRE7L3IQg%3D%3D"; //서비스키가 제대로 부여되지 않으면 
				//SERVICE_KEY_IS_NOT_REGISTERED_ERROR가 발생함
				
				url += "?serviceKey=" + serviceKey;
				url += "&sidoName=" + URLEncoder.encode("서울", "UTF-8"); 
				url+= "&returnType=json";
				//요청 시 전달값 중 한글이 있을 경우 이 UTF-8로 인코딩해주는 작업을 꼭 해줘야함.☆
				
				//&returnType=xml&numOfRows=100&pageNo=1&sidoName=%EC%84%9C%EC%9A%B8&ver=1.0
				
				//url += "&returnType=xml";
				
				//System.out.println(url);
				

				//** httpURLConnection 객체를 활용해서 OpenAPI 요청 절차 **
				//1. 요청하고자 하는 URL부터 전달 java.net.URL객체 생성
				URL requestUrl = new URL(url);

				//2. 1번과정으로 생성된 URL 객체 가지고 HttpURLConnection 객체 생성
				HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection(); 
				
				//3. 요청에 필요한 Header 설정하기 
				urlConnection.setRequestMethod("GET");
				
				//4. 해당 OpenAPI 서버로 요청 보낸 후 입력 스트림을 통해 응답데이터 읽어들이기
				BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()) ); 
				
				String responseText="";
				String line;
				while((line = br.readLine())!=null) {
					responseText+=line;
				}
				//System.out.println(responseText);
				
				
			
				//JsonObejct, JsonArray, JsonElement를 이용해서 파싱할 수 있음(gson라이브러리)  => 내가 원하는 데이터만을 추출할 수 있음
				//각각 item정보를 => AirVO객체에 담고 =>ArrayList 차곡차곡 쌓기
				JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
				
				//System.out.println(totalObj);
				
				JsonObject responseObj = totalObj.getAsJsonObject("response");//response속성 접근
				JsonObject bodyObj = responseObj.getAsJsonObject("body"); //body 속성접근 = {} JsonObejct
				int totalCount = bodyObj.get("totalCount").getAsInt(); //totalCount속성 접근 => 40 int
				JsonArray itemArr = bodyObj.getAsJsonArray("items"); //items 속성 접근 => [JsonArray]
				
				ArrayList<SubInformation> list = new ArrayList<SubInformation>();
				
				
				for(int i=0; i<itemArr.size(); i++) {
					JsonObject item = itemArr.get(i).getAsJsonObject();
					//System.out.println(item);
				
					SubInformation sub = new SubInformation();
					sub.setStationName(item.get("stationName").getAsString());
					sub.setDataTime(item.get("dataTime").getAsString());
					sub.setKhaiValue(item.get("khaiValue").getAsString());
					sub.setPm10Value(item.get("pm10Value").getAsString());
					sub.setSo2Value(item.get("so2Value").getAsString());
					sub.setCoValue(item.get("coValue").getAsString());
					sub.setNo2Value(item.get("no2Value").getAsString());
					sub.setO3Value(item.get("o3Value").getAsString());
					
					list.add(sub);
				}
				//System.out.println(list);
				for(SubInformation s:list) {
					System.out.println(s);
				}
				
				//5. 다 사용한 스트림 반납
				br.close();
				urlConnection.disconnect();
				
			
				
				
			}
}
