package com.kh.kihoom.aichat.model.service;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Service;


@Service
public class OpenAIService {

    private static final String API_KEY = "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"; // 여기에 OpenAI API Key를 직접 입력

    public String getAIResponse(String question) {
        OkHttpClient client = new OkHttpClient();

        String jsonRequestBody = "{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"" + question + "\"}], \"max_tokens\": 500}";

        RequestBody body = RequestBody.create(MediaType.get("application/json; charset=utf-8"), jsonRequestBody);

        Request request = new Request.Builder()
            .url("https://api.openai.com/v1/chat/completions")
            .addHeader("Authorization", "Bearer " + API_KEY)
            .post(body)
            .build();
        
        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
            	return new String(response.body().bytes(), StandardCharsets.UTF_8);
            } else {
                return "API 호출 실패: " + response.message();
            }

        } catch (IOException e) {
            e.printStackTrace();
            return "API 호출 중 오류 발생: " + e.getMessage();
        }
    }
}