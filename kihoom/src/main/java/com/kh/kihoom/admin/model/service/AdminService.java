package com.kh.kihoom.admin.model.service;

import java.util.ArrayList;

import com.kh.kihoom.member.model.vo.Member;

public interface AdminService {
	
	// 회원정보 조회
	int selectListCount();
	ArrayList<Member> selectList(PageInfo pi);
	
	// 관리자 회원정보 수정
	
	// 관리자 회원탈퇴

}
