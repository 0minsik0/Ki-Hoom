package com.kh.kihoom.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.kihoom.member.model.service.KakaoService;
import com.kh.kihoom.member.model.service.MemberServiceImpl;

import com.kh.kihoom.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
public class KakaoController {
    private KakaoService kakaoService;
    private MemberServiceImpl mService;
    
    @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
        System.out.println("code:: " + code);

        // 접속토큰 get
        String kakaoToken = kakaoService.getReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
        log.info("result:: " + result);
        String snsId = (String) result.get("id");
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String userpw = snsId;

        // 분기
        Member m = new Member();
        // 일치하는 snsId 없을 시 회원가입
        System.out.println(mService.kakaoLogin(snsId));
        if (mService.kakaoLogin(snsId) == null) {
            log.warn("카카오로 회원가입");
            m.setMemName(userName);
            m.setSnsId(snsId);
            m.setEmail(email);
            mService.kakaoJoin(m);
        }

        // 일치하는 snsId가 있으면 멤버객체에 담음.
        log.warn("카카오로 로그인");
        String memId = mService.findUserIdBy2(snsId);
        m = mService.findByUserId(memId);
        log.warn("member:: " + m);
            /*Security Authentication에 붙이는 과정*/
        CustomUser user = new CustomUser(vo);
        log.warn("user : " + user);
        List<GrantedAuthority> roles = CustomUser.getList(vo);
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
        log.warn("auth : " + auth);
        SecurityContextHolder.getContext().setAuthentication(auth);

        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);

        return "redirect:/";

    }

}