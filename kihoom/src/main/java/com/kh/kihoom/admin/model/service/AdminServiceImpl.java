package com.kh.kihoom.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.admin.model.dao.AdminDao;
import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.member.model.dao.MemberDao;
import com.kh.kihoom.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}
	
	@Override
	public int BoardListCount() {
		return aDao.BoardListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}

	@Override
	public int deleteMember(String memId) {
		return aDao.deleteMember(sqlSession, memId);
	}

	public Member selectMemberByNo(int memNo) {
		return aDao.selectMemberByNo(sqlSession, memNo);
	}

	public int updateMember(Member member) {
		return aDao.updateMember(sqlSession, member);
	}

	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return aDao.selectBoardList(sqlSession, pi);
	}



}
