package com.kh.kihoom.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PwdTest {
    public static void main(String[] args) {
        // BCryptPasswordEncoder
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        
        String pw = "1234";  // 암호화 전 비번
        String pw1 = "pass01";
        String pw2 = "pass02";
        String pw3 = "pass03";
        String pw4 = "pass04";

        // 암호화
        String encodedpw = passwordEncoder.encode(pw);
        String encodedpw1 = passwordEncoder.encode(pw1);
        String encodedpw2 = passwordEncoder.encode(pw2);
        String encodedpw3 = passwordEncoder.encode(pw3);
        String encodedpw4 = passwordEncoder.encode(pw4);

        // 암호화된 비밀번호
        System.out.println("암호화된 비밀번호: " + encodedpw);
        System.out.println("pass01" + encodedpw1);
        System.out.println("pass02" + encodedpw2);
        System.out.println("pass03" + encodedpw3);
        System.out.println("pass04" + encodedpw4);
    
    }
}