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
	
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	
	// 3. 게시글 상세조회 서비스
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	// 6. 댓글 리스트 조회용 서비스 (ajax)
	
	// 8. 조회수 top5 리스트 조회용 서비스
	ArrayList<Board> selectTopBoardList();

}
