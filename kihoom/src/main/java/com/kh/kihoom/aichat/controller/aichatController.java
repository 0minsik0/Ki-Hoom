package com.kh.kihoom.aichat.controller;


//import com.example.demo.dto.GPTRequest;
//import com.example.demo.dto.GPTResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.kh.kihoom.aichat.dto.GPTRequest;
import com.kh.kihoom.aichat.dto.GPTResponse;

@RestController
@RequestMapping("/gpt")
@RequiredArgsConstructor
public class aichatController {

    @Value("${gpt.model}")
    private String model;

    @Value("${gpt.api.url}")
    private String apiUrl;
    private final RestTemplate restTemplate;

    
    @GetMapping("/aichat.ac")
    public String chat(@RequestParam("prompt") String prompt){

        GPTRequest request = new GPTRequest(
                model,prompt,1,256,1,2,2);

        GPTResponse gptResponse = restTemplate.postForObject(
                apiUrl
                , request
                , GPTResponse.class
        );


        return gptResponse.getChoices().get(0).getMessage().getContent();


    }
    
}
