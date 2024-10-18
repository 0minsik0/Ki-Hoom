package com.kh.kihoom.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		int result1 = bService.increaseCount(bno);
		
		if(result1 > 0) {
			Board b = bService.selectBoard(bno);
			int like = bService.boardLikeCount(bno);
			System.out.println("좋아요 " + like);
			mv.addObject("b", b).addObject("like", like).setViewName("board/boardDetailView");
			
		}else {
			
		}
		return mv;
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, HttpSession session, Model model) {
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { // 성공 => 게시판 리스트 페이지 (list.bo url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
}
