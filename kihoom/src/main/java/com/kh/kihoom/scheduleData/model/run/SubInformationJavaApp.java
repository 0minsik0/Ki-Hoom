package com.kh.kihoom.scheduleData.model.run;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.kihoom.scheduleData.model.vo.SubInformation;

public class SubInformationJavaApp {

    public static final String serviceKey = "AgoV%2BZ2j5pq8LO%2BIue%2FQxk4cMHNb9rWqswfLyXF%2BKlOiFEGhbKEWFwykZWKjdS7fJepYEeOQGo%2Ba9GgTlkQWHg%3D%3D";

    public static void main(String[] args) throws IOException {

        // OpenAPI서버로 요청하고자 하는 url 만들기
        String url = "https://api.odcloud.kr/api/ApplyhomeInfoDetailSvc/v1/getUrbtyOfctlLttotPblancDetail?page=1";
        url += "&serviceKey=" + serviceKey;
        url += "&returnType=json";
        url += "&perPage=10000";

        // 1. URL 객체 생성
        URL requestUrl = new URL(url);

        // 2. HttpURLConnection 객체 생성
        HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
        urlConnection.setRequestMethod("GET");

        // 3. 요청에 따른 응답 데이터 받기
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
        StringBuilder responseText = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            responseText.append(line);
        }

        // 4. JSON 파싱
        JsonObject totalObj = JsonParser.parseString(responseText.toString()).getAsJsonObject();
        JsonArray dataArray = totalObj.getAsJsonArray("data"); // 'data' 배열을 가져옵니다.

        // SubInformation 객체로 변환할 리스트 생성
        ArrayList<SubInformation> list = new ArrayList<>();

        // 5. data 배열의 각 항목을 SubInformation 객체로 변환
        for (int i = 0; i < dataArray.size(); i++) {
            JsonObject item = dataArray.get(i).getAsJsonObject(); // 각 아이템을 JsonObject로 변환

            SubInformation sub = new SubInformation();
            sub.setHouseManageNo(item.get("houseManageNo").getAsString());
            sub.setPblancNo(item.get("pblancNo").getAsString());
            sub.setHouseNm(item.get("houseNm").getAsString());
            sub.setHouseSecd(item.get("houseSecd").getAsString());
            sub.setHouseSecdNm(item.get("houseSecdNm").getAsString());
            sub.setHouseDtlSecd(item.get("houseDtlSecd").getAsString());
            sub.setHouseDtlSecdNm(item.get("houseDtlSecdNm").getAsString());
            sub.setSearchHouseSecd(item.get("searchHouseSecd").getAsString());
            sub.setHssplyZip(item.get("hssplyZip").getAsString());
            sub.setHssplyAddres(item.get("hssplyAddres").getAsString());
            sub.setTotSuplyHshldco(item.get("totSuplyHshldco").getAsInt());
            sub.setRcritPblancDe(item.get("rcritPblancDe").getAsString());
            sub.setSubscrptRceptBgnde(item.get("subscrptRceptBgnde").getAsString());
            sub.setSubscrptRceptEndde(item.get("subscrptRceptEndde").getAsString());
            sub.setPrzwnerPresnatnDe(item.get("przwnerPresnatnDe").getAsString());
            sub.setCntrctCnclsBgnde(item.get("cntrctCnclsBgnde").getAsString());
            sub.setCntrctCnclsEndde(item.get("cntrctCnclsEndde").getAsString());
            sub.setHmpgAdres(item.get("hmpgAdres").getAsString());
            sub.setBsnsMbyNm(item.get("bsnsMbyNm").getAsString());
            sub.setMdhsTelno(item.get("mdhsTelno").getAsString());
            sub.setMvnPrearngeYm(item.get("mvnPrearngeYm").getAsString());
            sub.setPblancUrl(item.get("pblancUrl").getAsString());

            list.add(sub);
        }

        // 6. 리스트 출력
        for (SubInformation s : list) {
            System.out.println(s); // 출력 테스트
        }

        // 7. 스트림과 연결 해제
        br.close();
        urlConnection.disconnect();
    }
}
