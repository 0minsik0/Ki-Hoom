package com.kh.kihoom.account;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.kihoom.account.vo.Account;
import com.kh.kihoom.account.vo.AccountDetails;

@Controller
public class AccountAPI {
	
	@ResponseBody
	@RequestMapping(value = "acc.do")
	public String userAccount(HashMap<String, String> p) throws IOException {
		
		String clientId = "04929eed-efab-41de-87b0-82722b6813c0";
		String redirectUri = "http://localhost:8888/kihoom";
		String scope = "login inquiry transfer";
		String state = "12345678901234567890123456789012";
		
		String url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		url += "?response_type=code";
		url += "&client_id=" + clientId;
		url += "&redirect_uri=" + redirectUri;
		url += "&scope=" + scope;
		url += "&state=" + state;
		
//		URL requestUrl = new URL(url);
//		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
//		urlConnection.setRequestMethod("GET");
//		
//		BufferedReader br = new BufferedReader( new InputStreamReader(urlConnection.getInputStream()) );
//		
//		System.out.println(br);
//		
//		br.close();
//		urlConnection.disconnect();
		
		return url;
	}
	
	@RequestMapping("account.me")
	public String getAccount(Model model) throws IOException {
	    String url = "https://testapi.openbanking.or.kr/v2.0/user/me?user_seq_no=1101057415";
	    String token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDU3NDE1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE3MzU3OTk3NTQsImp0aSI6IjE5NjU5MWU5LTIxOGEtNDY0Ny1hMmU4LTM0NTk5YTBhZDcwNiJ9.KLl-entBkPBYNFBLyg8cK__zZSwVSqDDcBfBvxGKgMM";

	    // URL 연결
	    URL requestUrl = new URL(url);
	    HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
	    urlConnection.setRequestMethod("GET");

	    // Authorization 헤더 추가
	    urlConnection.setRequestProperty("Authorization", token);

	    // 응답 읽기
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	    StringBuilder responseText = new StringBuilder();
	    String line;

	    while ((line = br.readLine()) != null) {
	        responseText.append(line);
	    }

	    br.close();
	    urlConnection.disconnect();
	    
	    // JSON 데이터를 Jackson을 사용해 파싱
	    ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode rootNode = objectMapper.readTree(responseText.toString());
	    
	    ArrayList<String> fintechUseNums = new ArrayList();
	    ArrayList<String> accountNumMaskeds = new ArrayList();
	    ArrayList<String> bankNames = new ArrayList();
	    
	    // 핀테크 번호, 계좌 번호, 은행 이름 추출
	    JsonNode resList = rootNode.path("res_list");
	    
	    if (resList.isArray()) {
	        for (JsonNode account : resList) {
	            String fintechUseNum = account.path("fintech_use_num").asText();
	            String accountNumMasked = account.path("account_num_masked").asText();
	            String bankName = account.path("bank_name").asText();

	            // 각 정보를 리스트에 추가
	            fintechUseNums.add(fintechUseNum);
	            accountNumMaskeds.add(accountNumMasked);
	            bankNames.add(bankName);
	        }
	    }

	    // 리스트를 모델에 추가하여 JSP에서 출력할 수 있도록 함
	    model.addAttribute("fintechUseNums", fintechUseNums);
	    model.addAttribute("accountNumMaskeds", accountNumMaskeds);
	    model.addAttribute("bankNames", bankNames);
	    

	    return "common/main";
	}
	
}
