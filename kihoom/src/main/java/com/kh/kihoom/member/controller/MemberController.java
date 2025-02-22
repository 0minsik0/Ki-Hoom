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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
				mv.setViewName("redirect:acountBook.ac");
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
		
		// 마이페이지 이동
		@RequestMapping("mypage.lo")
		public String mypage() {
			return "member/mypage";
		}
		
		// 회원정보 수정
		@RequestMapping("update.me")
		public String updateMember(Member m, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
			
			String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
			
			m.setMemPwd(encPwd);
			
		    int result = mService.updateMember(m);
		    
		    if (result > 0) {

		    	Member updateMem = mService.loginMember(m);
		        
		        session.setAttribute("loginUser", updateMem);
		        
		        redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 회원정보가 수정되었습니다. 수정하기를 눌러주세요.");
		        return "redirect:mypage.lo";
		    } else {
		        model.addAttribute("errorMsg", "회원정보 수정 실패");
		        return "common/errorPage";
		    }
		}
		
		// 회원탈퇴
		@RequestMapping("delete.me")
		public String deleteMember(String memId, String memPwd, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
			String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
			System.out.println(encPwd);
			if(bcryptPasswordEncoder.matches(memPwd, encPwd)) { // 비번 맞음 => 탈퇴처리
				
				int result = mService.deleteMember(memId);
				
				if(result > 0) { // 탈퇴처리 성공
					session.removeAttribute("loginUser");
					redirectAttributes.addFlashAttribute("alertMsg", "탈퇴 완료");
					return "redirect:/login.lo";
				}else { // 탈퇴처리 실패
					model.addAttribute("errorMsg", "회원탈퇴 실패");
					return "common/errorPage";
				}
				
			}else {
				redirectAttributes.addFlashAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해주세요.");
				return "redirect:mypage.lo";
			}
		}
		
		
		
}
