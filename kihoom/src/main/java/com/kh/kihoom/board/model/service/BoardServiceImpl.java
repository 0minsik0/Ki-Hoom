package com.kh.kihoom.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kihoom.board.model.dao.BoardDao;
import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession) ;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public int boardLikeCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}
	
}
