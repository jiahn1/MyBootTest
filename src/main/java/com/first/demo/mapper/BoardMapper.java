package com.first.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.first.demo.domain.Board;

@Mapper
public interface BoardMapper {
	
	 public List<Board> getBoard();
}
