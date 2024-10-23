package com.kh.kihoom.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kihoom.member.model.service.MemberServiceImpl;
import com.kh.kihoom.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Controller
public class MemberController {
		
	@Autowired //mService가 필요할때마다 만들어줌
	//DI(Dependency Injection) 특징
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
		
	
		//로그아웃, 로그인을 안했을 시 -> 로그인 페이지로 이동
		@RequestMapping("loginView.lo")
		public String loginView(HttpSession session) {
			session.invalidate(); //세션 초기화
			return "member/loginView";
		}
		
		
		//로그인
		@RequestMapping("login.lo")
		public ModelAndView loginMember(Member m , HttpSession session, ModelAndView mv) {
		
			
			Member loginUser=mService.loginMember(m);
		
			if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) { //일단 아이디조차도 틀렸으면 로그인 시도조차 할 필요가 없음
				
				// 아이디가 비지 않고 비밀번호가 일치했을경우. 로그인 성공
				
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}else {
				//로그인 실패
				mv.addObject("errorMsg","로그인 실패");
				mv.setViewName("member/loginView");
			}
			
			return mv;

		}
		
		/*
		//카카오 페이지 컨트롤러
		@Controller
		@RequestMapping("/login")
		public class KakaoPageController {

		    @Value("${kakao.client_id}")
		    private String client_id;

		    @Value("${kakao.redirect_uri}")
		    private String redirect_uri;

		    @GetMapping("/page")
		    public String loginPage(Model model) {
		        String location = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirect_uri;
		        model.addAttribute("location", location);

		        return "login";
		    }
		}
		
		
		//카카오톡 로그인 컨트롤러
		@Slf4j
		@RestController
		@RequiredArgsConstructor
		@RequestMapping("")
		public class KakaoLoginController {

		    @GetMapping("/callback")
		    public ResponseEntity<?> callback(@RequestParam("code") String code) {

		        return new ResponseEntity<>(HttpStatus.OK);
		    }
		}
		*/
		
		
	
		//회원가입
		@RequestMapping("insert.me")
		public String insertMember(Member m, Model model, HttpSession session) {
			

			//bcryptPasswordEncoder 암호화
			String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
			System.out.println("암호문:"+ encPwd);
			
			m.setMemPwd(encPwd);

			int result=mService.insertMember(m);
			
			if(result>0) { //회원가입 완료
				session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
				return "member/loginView";
				
			}else { //회원가입 실패
				model.addAttribute("errorMsg","회원가입 실패!");
				return "member/memberEnrollForm";
			}
		}
		
		
		
		// 회원가입 페이지 이동
		@RequestMapping("memberEnrollForm.me")
		public String memberEnrollForm() {
		    return "member/memberEnrollForm";  // 회원가입 폼으로 이동
		}
		
		
		
}
