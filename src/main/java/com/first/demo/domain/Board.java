package com.first.demo.domain;

public class Board {
	
	private int LEVEL_COUNT;
	private int number;
    private String writer;
	private String subject;
    private String contents;
	private String created;
    private String password;
    
    public int getLEVEL_COUNT() {
		return LEVEL_COUNT;
	}
	public void setLEVEL_COUNT(int lEVEL_COUNT) {
		LEVEL_COUNT = lEVEL_COUNT;
	}
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
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
