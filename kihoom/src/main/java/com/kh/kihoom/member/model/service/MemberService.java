package com.kh.kihoom.member.model.service;

import java.util.List;

import com.kh.kihoom.member.model.vo.Member;

public interface MemberService {
	
	
	//로그인
	Member loginMember(Member m);
	
	//회원가입
	int insertMember(Member m);
	
	//아이디 중복 체크 (select)
	int idDup(String checkId);
	
	
	
	//비밀번호찾기
	Member findPwd(Member m);
	
	// 회원정보 수정
	int updateMember(Member m);
	
	// 회원탈퇴
	int deleteMember(String memId);
	
	//아이디찾기
	List<Member> findId(Member m);
	
	//로그인(카카오톡)
	Member KakaoLogin(Member m);

	//회원가입(카카오톡)
	int KakaoJoin(Member m);

	int idCheck(Member m);
	
	//비밀번호 변경
	int updatePassword(Member m);
}
