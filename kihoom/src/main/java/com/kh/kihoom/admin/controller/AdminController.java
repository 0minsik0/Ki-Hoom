package com.kh.kihoom.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kihoom.admin.model.service.AdminServiceImpl;
import com.kh.kihoom.board.model.service.BoardServiceImpl;
import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.common.template.Pagination;
import com.kh.kihoom.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private AdminServiceImpl aService;
	
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("admin.ad")
	public String adminMain() {
		return "admin/admin";
	}
	
	/*
	@RequestMapping("adminMember.ad")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	@RequestMapping("adminBoard.ad")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	*/
	
	@RequestMapping("adminMember.ad")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> list = aService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("admin/adminMember");
		
		return mv;
		
	}
	
	@RequestMapping("updateMember.ad")
	public String updateMember(@RequestParam("memNo") int memNo, Model model) {
	    // 회원번호로 해당 회원의 정보를 조회
	    Member member = aService.selectMemberByNo(memNo);
	    
	    // 회원 정보를 모델에 추가하여 수정 페이지로 전달
	    model.addAttribute("member", member);
	    
	    // 회원 수정 페이지로 이동
	    return "admin/adminUpdateMember";
	}
	
	@RequestMapping("updateMemberProcess.me")
	public String updateMemberProcess(Member member, RedirectAttributes redirectAttributes) {
		String encPwd = bcryptPasswordEncoder.encode(member.getMemPwd());
		
		member.setMemPwd(encPwd);
		
		int result = aService.updateMember(member);
	    
	    if (result > 0) {
	        redirectAttributes.addFlashAttribute("alertMsg", "회원 정보가 수정되었습니다.");
	        return "redirect:/adminMember.ad"; // 수정 후 관리자 페이지로 돌아감
	    } else {
	        redirectAttributes.addFlashAttribute("errorMsg", "회원 정보 수정에 실패하였습니다.");
	        return "redirect:/adminMember.ad";
	    }
	}
	
	@RequestMapping("deleteMember.ad")
	public String deleteMember(@RequestParam("memId") String memId, @RequestParam("adminPwd") String adminPwd, HttpSession session, Model model) {
	    
	    // 세션에서 로그인된 관리자 정보를 가져옴
	    Member adminUser = (Member) session.getAttribute("loginUser");
	    // 관리자 로그인 정보에서 비밀번호를 가져와 비교 (bcrypt 암호화 사용)
	    if (bcryptPasswordEncoder.matches(adminPwd, adminUser.getMemPwd())) {
	        // 관리자 비밀번호가 일치하면 회원 탈퇴 처리
	        int result = aService.deleteMember(memId);
	        
	        if (result > 0) {
	            // 탈퇴 성공 시 성공 메시지 및 리다이렉트
	            session.setAttribute("alertMsg", "회원이 성공적으로 탈퇴되었습니다.");
	            return "redirect:adminMember.ad";
	        } else {
	            // 탈퇴 실패 시 에러 메시지 처리
	            model.addAttribute("errorMsg", "회원 탈퇴에 실패했습니다.");
	            return "common/errorPage";
	        }
	    } else {
	        // 관리자 비밀번호가 일치하지 않으면 오류 메시지 처리
	        session.setAttribute("alertMsg", "관리자 비밀번호가 일치하지 않습니다.");
	        return "redirect:adminMember.ad";
	    }
	}
	
	@RequestMapping("list.ad")
	public ModelAndView selecBoardList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.BoardListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = aService.selectBoardList(pi);
	
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("admin/adminBoard");
		
		return mv;
	}
	

}

