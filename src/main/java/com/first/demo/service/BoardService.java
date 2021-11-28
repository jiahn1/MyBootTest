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
	
	
	public List<Board> boardListService() {
		return m.boardList();
	}
	
	public Board boardDetailService(int number) {
		return m.boardDetail(number);
	}
	
	public int boardInsertService(Board board)  {
		return m.boardInsert(board);
	}
	
	public int boardUpdateService(Board board){
		return m.boardUpdate(board);
	}
	
	public int boardDeleteService(int number){
		return m.boardDelete(number);
	}

}
