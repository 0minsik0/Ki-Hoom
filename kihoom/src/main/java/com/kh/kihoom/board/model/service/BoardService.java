package com.kh.kihoom.board.model.service;

import java.util.ArrayList;

import com.kh.kihoom.board.model.vo.Board;

public interface BoardService {
	
	
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
