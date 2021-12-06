package com.first.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.first.demo.domain.*;

@Mapper
public interface CommentMapper {
	
	// 댓글 목록
	public List<Board_Comment> commentList(String b_idx);
	 
    // 댓글 작성
    public int commentInsert(Board_Comment comment) throws Exception;
    

}

