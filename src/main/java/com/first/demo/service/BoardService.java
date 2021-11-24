package com.first.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.demo.domain.Board;
import com.first.demo.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper m;
	
	public List<Board> getBoard(){
		
		return m.getBoard();
		
	}

}
