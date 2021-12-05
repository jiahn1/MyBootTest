package com.first.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.demo.domain.*;
import com.first.demo.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper m;
	
	public List<Board> getBoard(int list_count_int){
		return m.getBoard(list_count_int);
	}
	
	public List<Board_Detail> getBoard_Detail(Board_Detail_Value detail){
		return m.getBoard_Detail(detail);
	}
	
	public List<Board_Count> getBoard_Count(){
		return m.getBoard_Count();
	}
	
	public  List<Login_Find_Code> getLogin_Find_Code() {
		return m.getLogin_Find_Code();
	}
	
	public String Vail_Chk(String id) {
		return m.getVail_Chk(id);
	}
	
	public String Login_Chk(String id, String pass) {
		return m.getLogin_Chk(id, pass);
	}
	
	public void insertLogin(Login_Add login_Add) {
		m.setLogin_Add(login_Add);
	}
	
	public void insertBoard(Board_Add add) {
		m.setBorad_Add(add);
	}

	public void deleteBord(Board_Detail_Value detail) {
		m.setBorad_Del(detail);
	}
	
	public void updateUser(User_Detail user_Detail) {
		m.setUser_Upd(user_Detail);
	}
	
	public void updateBoard(Board_Detail list_Detail) {
		m.setBorad_Upd(list_Detail);
	}

	public List<User_Info> getUser_Info(String id) {
		return m.getUser_Info(id);	
	}

	public void deleteUser_Bord(String id) {
		m.setUser_Borad_Del(id);
		
	}

	public void deleteUser(String id) {
		m.setUser_Del(id);
		
	}
}
