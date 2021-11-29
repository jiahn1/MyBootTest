package com.first.demo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Board {
	
	private int number;
    private String writer;
    private String subject;
    private String contents;
	private Date created;
    private String password;
    
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/*
	public Board(int number, String writer, String subject, String contents, Date created, String password) {
        super();
        this.number = number;
        this.writer = writer;
        this.subject = subject;
        this.contents = contents;
        this.created = created;
        this.password = password;
        
    }
    */
    
}
