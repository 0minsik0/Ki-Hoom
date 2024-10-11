package com.kh.kihoom.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kihoom.board.model.service.BoardServiceImpl;
import com.kh.kihoom.board.model.vo.Board;
import com.kh.kihoom.common.model.vo.PageInfo;
import com.kh.kihoom.common.template.Pagination;


@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("list.bo")
	public ModelAndView selecBoardList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public void enrollForm() {
		
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		int result = bService.increaseCount(bno);
		
		if(result > 0) {
			Board b = bService.selectBoard(bno);
			mv.addObject("b", b).setViewName("board/boardDetailView");
			
		}else {
			
		}
		return mv;
	}
	
}
