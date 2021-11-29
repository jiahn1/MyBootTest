package com.first.demo.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.first.demo.domain.Board;
import com.first.demo.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService s;
	
	
	// 게시판 리스트 호출
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String boardList(Model model){
        model.addAttribute("list",s.boardListService());
    	return "list";
    }
    
    
    // 게시판 상세보기
    @RequestMapping("/detail/{number}")
    public String boardDetail(@PathVariable int number, Model model) {
    	model.addAttribute("detail", s.boardDetailService(number));
    	return "detail";
    }
    
    
    // 작성폼 
    @RequestMapping("/insert")
    public String boardInsertForm() {
    	return "insert";
    }
    
    @RequestMapping("/insertProc")
    public String boardInsertProc(HttpServletRequest request) {
    	Board board = new Board();
    	
    	board.setSubject(request.getParameter("subject"));
    	board.setContents(request.getParameter("contents"));
    	board.setWriter(request.getParameter("writer"));
    	board.setPassword(request.getParameter("password"));
    	
    	s.boardInsertService(board);
    	
    	return "redirect:/list";
    }
    
    
    //게시판 수정폼
    @RequestMapping("/update/{number}") 
    public String boardUpdateForm(@PathVariable int number, Model model) {
    	model.addAttribute("detail", s.boardDetailService(number));
    	
    	return "update";
    }
    
    @RequestMapping("/updateProc")
    public int boardUpdateProc(HttpServletRequest request) {
    	Board board = (Board) request.getParameterMap();
    	return s.boardUpdateService(board);
    }
    
    
    // 게시판 삭제
    @RequestMapping("/delete/{number}")
    public String boardDelete(@PathVariable int number) {
    	s.boardDeleteService(number);
    	return "redirect:/list";
    }
    
    
    
    /* 테스트용 코드
     * @PostMapping("/board/writepro")
    public String boardWritePro(String subject, String contents) {
    	System.out.println("제목 : " + subject);
    	System.out.println("내용 : " + contents);
    	return "";
    }*/
}
