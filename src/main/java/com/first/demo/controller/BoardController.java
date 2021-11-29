package com.first.demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.first.demo.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
    private BoardService s;
	
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String boardList(Model model){
        model.addAttribute("list",s.getBoard());
    	return "list";
        
    }
    
    @RequestMapping(value="/detail", method=RequestMethod.GET)
    public String detailList(Model model,@RequestParam("number")int number){
        model.addAttribute("detail",s.getDetail(number));
    	return "detail";
        
    }	
	
	@GetMapping(path = "/hello")
	public String hello() {
		return LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	}
}
