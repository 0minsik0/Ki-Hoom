package com.kh.kihoom.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kihoom.board.model.service.BoardServiceImpl;


@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("list.bo")
	public String selecBoardList() {
		
		return "board/boardListView";
	}
	
}
