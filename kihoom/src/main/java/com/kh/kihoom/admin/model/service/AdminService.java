package com.kh.kihoom.admin.model.service;

import java.util.ArrayList;

import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.member.model.vo.Member;

public interface AdminService {
	
	// 회원정보 조회
	int selectListCount();
	ArrayList<Member> selectList(PageInfo pi);
	
	// 회원정보 수정
	int updateMember(Member m);
	
	// 회원탈퇴
	int deleteMember(String memId);
	
	int BoardListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);
}
