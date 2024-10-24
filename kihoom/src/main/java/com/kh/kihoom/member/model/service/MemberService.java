package com.kh.kihoom.member.model.service;

import com.kh.kihoom.member.model.vo.Member;

public interface MemberService {
	
	
	//로그인
	Member loginMember(Member m);
	
	//회원가입
	int insertMember(Member m);
	
	//아이디 중복 체크 (select)
	int idCheck(String checkId);
	
	//아이디찾기
	Member findId(Member m);
	
	//비밀번호찾기
	Member findPwd(Member m);
	
	// 회원정보 수정
	int updateMember(Member m);
	
	// 회원탈퇴
	int deleteMember(String memId);
	
	
	
	
}
