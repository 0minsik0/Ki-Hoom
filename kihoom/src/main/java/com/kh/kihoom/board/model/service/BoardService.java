package com.kh.kihoom.board.model.service;

import java.util.ArrayList;

import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;

public interface BoardService {
	
	// 게시판 리스트 페이징
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 게시글 작성
	int insertBoard(Board b);
	
	// 게시글 조회수 및 좋아용
	int increaseCount(int boardNo);
	int boardLikeCount(int boardNo);
	
	// 게시글 상세조회
	Board selectBoard(int boardNo);

}
