package com.kh.kihoom.account;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
	public String getAccount(Model model) {
		String url = "https://testapi.openbanking.or.kr/v2.0/user/me?user_seq_no=1101057415";
		String token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDU3NDE1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE3MzU3OTk3NTQsImp0aSI6IjE5NjU5MWU5LTIxOGEtNDY0Ny1hMmU4LTM0NTk5YTBhZDcwNiJ9.KLl-entBkPBYNFBLyg8cK__zZSwVSqDDcBfBvxGKgMM";
		
		RestTemplate restTempl = new RestTemplate();
		HttpHeaders header = new HttpHeaders();
		
		header.set("Authorization", token);
		
		HttpEntity<String> entity = new HttpEntity<>(header);

        ResponseEntity<Account> account = restTempl.exchange(
        	url,
            HttpMethod.GET,
            entity,
            Account.class
        );
        
        // API 응답에서 res_list를 가져옵니다.
        List<AccountDetails> accountDetailsList = account.getBody().getResList();
        
        // 필요한 정보만 추출하여 모델에 추가합니다.
        if (accountDetailsList != null && !accountDetailsList.isEmpty()) {
            for (AccountDetails acc : accountDetailsList) {
                String fintechUseNum = acc.getFintechUseNum(); // 핀테크 번호
                String accountNumMasked = acc.getAccountNumMasked(); // 마스킹된 계좌 번호
                String bankName = acc.getBankName(); // 은행 이름
                
                // 모델에 필요한 정보 추가
                model.addAttribute("fintechUseNum", fintechUseNum);
                model.addAttribute("accountNumMasked", accountNumMasked);
                model.addAttribute("bankName", bankName);
            }
        }
        
        System.out.println(account);
        
        return "main";
	}
	
}
