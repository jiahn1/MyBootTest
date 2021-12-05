package com.first.demo.domain;

public class User_Info {
	
    private String ID;
    private String PASSWORD;
    private String WRITER;
    private String FIND_CODE;
    private String FIND_NM;
    private String CREATED;
    
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getFIND_CODE() {
		return FIND_CODE;
	}
	public void setFIND_CODE(String fIND_CODE) {
		FIND_CODE = fIND_CODE;
	}
	public String getFIND_NM() {
		return FIND_NM;
	}
	public void setFIND_NM(String fIND_NM) {
		FIND_NM = fIND_NM;
	}
	public String getCREATED() {
		return CREATED;
	}
	public void setCREATED(String cREATED) {
		CREATED = cREATED;
	}
}
