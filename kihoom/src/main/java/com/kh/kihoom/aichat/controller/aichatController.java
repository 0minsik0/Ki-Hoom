package com.kh.kihoom.aichat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kihoom.aichat.model.service.OpenAIService;

@Controller
public class aichatController {

    @Autowired
    private OpenAIService openAIService;
    
    @RequestMapping("AIChat.ai")
	public String AIChatMain() {
		return "aichat/aichat";
	}
    
    @PostMapping("/askQuestion")
    public ResponseEntity<String> askQuestion(@RequestParam String question) {
        // OpenAI에서 받은 응답
        String aiResponse = openAIService.getAIResponse(question);
        
        // 응답 인코딩을 UTF-8로 설정
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8")
            .body(aiResponse);
    }
}
