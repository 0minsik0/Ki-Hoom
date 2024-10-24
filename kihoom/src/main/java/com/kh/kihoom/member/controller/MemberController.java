package com.kh.kihoom.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kihoom.member.model.service.MailSendService;
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
	

	//@Autowired
	//private IUserService service;
	@Autowired
	private MailSendService mailService;
	
	
	
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
		/*저장용
		{
			"model": "text-davinci-003",
			"message":"",
			"temperature":1,
			"max_tokens":256,
			"top_p":1,
			"frequency_penalty":0,
			"presence_penalty":0
		
		}
		*/
		
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
		
		
		
		//아이디 중복확인
		
		@RequestMapping("./idCheck")
		@ResponseBody
		public int idCheck(@RequestParam("memId") String id) {
		
			Member m = new Member();

			m.setMemId(id);
    
			int cnt = mService.idCheck(m);
					
			return cnt;
		}
		
		
		
		@RequestMapping("findId.1")
		public String findIdPage(HttpSession session) {
			return "member/findId1";
		}
		
		
		@RequestMapping("findId.2") //아이디 찾기1
		public ModelAndView findId1(Member m , HttpSession session, ModelAndView mv) {
					
			List<Member> memInfor = mService.findId(m);
			
				// 아이디가 비지 않고 비밀번호가 일치했을경우. 로그인 성공
				
			session.setAttribute("searchId", memInfor);
			mv.setViewName("member/findId2");
	
			return mv;
			
			
		}
		
	
		
		//비밀번호 찾기 페이지 이동
		@RequestMapping("findPwd.1")
		public String findPwdPage(HttpSession session) {
			return "member/findPwd1";
		}
		
		//비밀번호 찾기 페이지2 이동(1에서 아이디 받은 정보 이동)
		@RequestMapping("findPwd.2")
		public String findPwd2(@RequestParam("memId") String memId, HttpSession session) {
		    session.setAttribute("memId", memId); 
		    return "member/findPwd2";
		}
		
		@RequestMapping("findPwd.3") //아이디, 
		public String findPwd3Page(@RequestParam("userEmail1") String emailPart1, 
		                           @RequestParam("userEmail2") String emailPart2, 
		                           HttpSession session) {
		    String email = emailPart1 + emailPart2;
		    session.setAttribute("email", email); // 세션에 이메일 저장
		    return "member/findPwd3"; // pwd3.jsp로 이동
		}

		
		// POST 요청 시, 비밀번호 변경 처리
		@RequestMapping("changePwd") //비밀번호 변경 
		public String changePassword(@RequestParam("changePwd") String newPwd, 
		                             HttpSession session, 
		                             Model model) {
		    // 세션에서 아이디와 이메일 값을 가져옴
		    String memId = (String) session.getAttribute("memId");
		    String email = (String) session.getAttribute("email");

		    // 유효성 체크
		    if (newPwd == null || newPwd.isEmpty() || memId == null || email == null) {
		        model.addAttribute("errorMsg", "입력된 값이 잘못되었습니다.");
		        return "member/findPwd3";
		    }

		    // 비밀번호 암호화
		    String encPwd = bcryptPasswordEncoder.encode(newPwd);

		    // Member 객체에 값 설정
		    Member m = new Member();
		    m.setMemId(memId);
		    m.setEmail(email);
		    m.setMemPwd(encPwd);

		    // 비밀번호 업데이트
		    int result = mService.updatePassword(m);

		    if (result > 0) {
		        session.invalidate(); // 세션 초기화
		        session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
		        return "redirect:/loginView.lo"; // 로그인 페이지로 리다이렉트
		    } else {
		        model.addAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
		        return "member/findPwd3"; // 다시 비밀번호 변경 페이지로 이동
		    }
		}
		
		//회원가입 페이지 이동
		@GetMapping("/userJoin")
		public void userJoin() {}
		
		//이메일 인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
			
				
		}
		
	
}
