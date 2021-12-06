package com.first.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.demo.domain.*;
import com.first.demo.mapper.CommentMapper;

@Service
public class CommentService {

	@Autowired
	private CommentMapper c;

	public List<Board_Comment> commentList(String b_idx) throws Exception {
		return c.commentList(b_idx);
	}

	public int commentInsert(Board_Comment comment) throws Exception{
		
		return c.commentInsert(comment);

	};


}