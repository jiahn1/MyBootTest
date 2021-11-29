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
	
	public List<Board> getBoard(){
		
		return m.getBoard();
		
	}
	
	public List<Board_Detail> getBoard_Detail(Board_Detail_Value detail){
		
		return m.getBoard_Detail(detail);
		
	}
	
	public List<Board_Count> getBoard_Count(){
		
		return m.getBoard_Count();
		
	}
	
	public void insertBoard(Board_Add add) {
		
		m.setBorad_Add(add);
	}

	public void deleteBord(Board_Detail_Value detail) {
		m.setBorad_Del(detail);
	}

	public void updateBoard(Board_Detail list_Detail) {
		m.setBorad_Upd(list_Detail);
	}
	
}
