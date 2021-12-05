package com.first.demo.domain;

public class Board {
	
	private int LEVEL_COUNT;
	private int NUMBER;
    private String WRITER;
	private String SUBJECT;
    private String CONTENTS;
	private String CREATED;
    private String CREATED_UP;
    
    public int getLEVEL_COUNT() {
		return LEVEL_COUNT;
	}
	public void setLEVEL_COUNT(int lEVEL_COUNT) {
		LEVEL_COUNT = lEVEL_COUNT;
	}
	public int getNUMBER() {
		return NUMBER;
	}
	public void setNUMBER(int nUMBER) {
		NUMBER = nUMBER;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
	}
	public String getCONTENTS() {
		return CONTENTS;
	}
	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}
	public String getCREATED() {
		return CREATED;
	}
	public void setCREATED(String cREATED) {
		CREATED = cREATED;
	}
	public String getCREATED_UP() {
		return CREATED_UP;
	}
	public void setCREATED_UP(String cREATED_UP) {
		CREATED_UP = cREATED_UP;
	}
}
