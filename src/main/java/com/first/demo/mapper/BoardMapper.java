package com.first.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.first.demo.domain.Board;

@Repository("com.first.demo.mapper.BoardMapper")


@Mapper
public interface BoardMapper {
	public boolean addBoard(Board b);
	
	public int boardcount() ; // 게시판 개수
	
    public List<Board> boardList(); // 목록 "getboard" 
    
    public Board boardDetail(int number) ; // 글읽기
    
    public int boardInsert(Board params); // 글 추가
    public int boardUpdate(Board params); // 업데이트
    public int boardDelete(int number) ; // 글 삭제
    
     
    
}
