package com.first.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.UnsupportedEncodingException;

import com.first.demo.domain.*;
import com.first.demo.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
    private BoardService s;
	
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String boardList(Model model){
    	model.addAttribute("list_Count",s.getBoard_Count());
        model.addAttribute("list",s.getBoard());     
    	return "list";
        
    }
    
    @RequestMapping(value="/list_detail", method=RequestMethod.GET)
    public String list_detail(HttpServletRequest request , Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Detail_Value list_value = new Board_Detail_Value(); 
    	
    	list_value.setNumber(Integer.parseInt(request.getParameter("number")));
    	    	
    	model.addAttribute("list_detail",s.getBoard_Detail(list_value));
    	
    	return "list_detail";
    }
	
    @RequestMapping(value="/list_add", method=RequestMethod.GET)
    public String boardList_add(Model model){
    	return "list_add";
    }
    
    @RequestMapping(value="/insert", method=RequestMethod.POST)
    public String insert(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Add list_Add = new Board_Add();
    	
    	list_Add.setWriter(request.getParameter("writer"));
    	list_Add.setSubject(request.getParameter("subject"));
    	list_Add.setContents(request.getParameter("contents"));
    	list_Add.setPassword(request.getParameter("pass"));
    	
    	s.insertBoard(list_Add);
    
    	return "insert";
    }
    
    @RequestMapping(value="/update", method=RequestMethod.GET)
    public String update(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Detail list_Detail = new Board_Detail();
    	
    	list_Detail.setNumber(Integer.parseInt(request.getParameter("number")));
    	list_Detail.setWriter(request.getParameter("writer"));
    	list_Detail.setSubject(request.getParameter("subject"));
    	list_Detail.setContents(request.getParameter("contents"));
    	
    	s.updateBoard(list_Detail);
    	
    	model.addAttribute("list_number",Integer.parseInt(request.getParameter("number")));
    
    	return "update";
    }
    
    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String delete(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Detail_Value list_value = new Board_Detail_Value(); 
    	
    	list_value.setNumber(Integer.parseInt(request.getParameter("number")));
    	
    	s.deleteBord(list_value);
    
    	return "delete";
    }
    
	@GetMapping(path = "/hello")
	public String hello() {
		return LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	}
}
