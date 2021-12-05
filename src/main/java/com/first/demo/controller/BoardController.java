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
	
	public String fv_id = "";
	
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String boardList(HttpServletRequest request, Model model) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("UTF-8");
    	
    	if (fv_id != null || fv_id != "null" || fv_id != "undefined" || fv_id != "") {
            model.addAttribute("User_Info",s.getUser_Info(fv_id));
    	}
    	
    	String list_count = request.getParameter("list_count");
    	
    	int list_count_int = 0;
    	
    	if (list_count != null) {
    		list_count_int = Integer.parseInt(list_count);
    	} else {
    		list_count_int = 1;
    	}
    	
    	model.addAttribute("list_Count",s.getBoard_Count());
        model.addAttribute("list",s.getBoard(list_count_int));
        
    	return "list";
    }
    
    @RequestMapping(value="/list_detail", method=RequestMethod.GET)
    public String list_detail(HttpServletRequest request , Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");
    	
    	if (fv_id != null || fv_id != "null" || fv_id != "undefined" || fv_id != "") {
            model.addAttribute("User_Info",s.getUser_Info(fv_id));
            model.addAttribute("User_ID", fv_id);
    	}
    	
    	Board_Detail_Value list_value = new Board_Detail_Value(); 
    	
    	list_value.setNUMBER(Integer.parseInt(request.getParameter("number")));
    	    	
    	model.addAttribute("list_detail",s.getBoard_Detail(list_value));
    	
    	return "list_detail";
    }
    
    @RequestMapping(value="/User_Detail", method=RequestMethod.GET)
    public String User_detail(HttpServletRequest request , Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");
    	
    	model.addAttribute("find_code", s.getLogin_Find_Code());
    	model.addAttribute("User_Info",s.getUser_Info(request.getParameter("id")));
        model.addAttribute("User_ID", fv_id);
    	
    	return "User_Detail";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String boardList_login(Model model){
    	return "login";
    }
    
    @RequestMapping(value="/login_out", method=RequestMethod.GET)
    public String login_out(Model model){
    	fv_id = "";
    	return "login_out";
    }
    
    @RequestMapping(value="/login_add", method=RequestMethod.GET)
    public String boardList_login_add(Model model){
    	
    	model.addAttribute("find_code", s.getLogin_Find_Code());
    	
    	return "login_add";
    }
    
    @RequestMapping(value="/list_add", method=RequestMethod.GET)
    public String boardList_add(Model model){
    	if (fv_id != null || fv_id != "null" || fv_id != "undefined" || fv_id != "") {
            model.addAttribute("User_Info",s.getUser_Info(fv_id));
    	}
    	
    	return "list_add";
    }
	
    @RequestMapping(value="/validation_chk", method=RequestMethod.GET)
    public String Validation_chk(HttpServletRequest request, Model model){
    	String id = request.getParameter("id");
    	
    	model.addAttribute("id_chk",s.Vail_Chk(id));
    	
    	return "validation_chk";
    }
    
    @RequestMapping(value="/login_chk", method=RequestMethod.GET)
    public String Login_chk(HttpServletRequest request, Model model){
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	String logn_chk = s.Login_Chk(id, pass);
    	
    	if (logn_chk != "0") {
    		fv_id = id;
    	}  
    	
    	model.addAttribute("id_chk",logn_chk);
    	return "login_chk";
    }
    
    @RequestMapping(value="/User_add", method=RequestMethod.POST)
    public String User_insert(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Login_Add login_Add = new Login_Add();
    	
    	login_Add.setID(request.getParameter("id"));
    	login_Add.setPASSWORD(request.getParameter("pass"));
    	login_Add.setWRITER(request.getParameter("writer"));
    	login_Add.setFIND_CODE(request.getParameter("pass_find"));
    	login_Add.setFIND_NM(request.getParameter("pass_find_nm"));
    	
    	s.insertLogin(login_Add);
    
    	return "User_add";
    }
    
    @RequestMapping(value="/insert", method=RequestMethod.POST)
    public String insert(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Add list_Add = new Board_Add();
    	
    	list_Add.setWRITER(request.getParameter("writer"));
    	list_Add.setID(request.getParameter("id"));
    	list_Add.setSUBJECT(request.getParameter("subject"));
    	list_Add.setCONTENTS(request.getParameter("contents"));
    	
    	s.insertBoard(list_Add);
    
    	return "insert";
    }
    
    @RequestMapping(value="/User_Update", method=RequestMethod.GET)
    public String User_update(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	User_Detail User_Detail = new User_Detail();
    	
    	User_Detail.setID(request.getParameter("id"));
    	User_Detail.setWRITER(request.getParameter("writer"));
    	User_Detail.setFIND_CODE(request.getParameter("Find_code"));
    	User_Detail.setFIND_NM(request.getParameter("Find_Nm"));
    	
    	s.updateUser(User_Detail);
    	
    	model.addAttribute("User_ID", request.getParameter("id"));
    
    	return "User_Update";
    }
    
    @RequestMapping(value="/update", method=RequestMethod.GET)
    public String update(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Detail list_Detail = new Board_Detail();
    	
    	list_Detail.setNUMBER(Integer.parseInt(request.getParameter("number")));
    	list_Detail.setWRITER(request.getParameter("writer"));
    	list_Detail.setSUBJECT(request.getParameter("subject"));
    	list_Detail.setCONTENTS(request.getParameter("contents"));
    	
    	s.updateBoard(list_Detail);
    	
    	model.addAttribute("list_number",Integer.parseInt(request.getParameter("number")));
    
    	return "update";
    }
    
    @RequestMapping(value="/User_Delete", method=RequestMethod.GET)
    public String User_delete(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");
    	
    	s.deleteUser_Bord(request.getParameter("id"));
    	s.deleteUser(request.getParameter("id"));
    	
    	fv_id = "";
    	
    	return "User_Delete";
    }
    
    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String delete(HttpServletRequest request) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("UTF-8");

    	Board_Detail_Value list_value = new Board_Detail_Value(); 
    	
    	list_value.setNUMBER(Integer.parseInt(request.getParameter("number")));
    	
    	s.deleteBord(list_value);
    
    	return "delete";
    }
    
	@GetMapping(path = "/hello")
	public String hello() {
		return LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	}
}
