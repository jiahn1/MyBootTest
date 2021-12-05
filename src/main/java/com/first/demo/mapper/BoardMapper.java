package com.first.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.first.demo.domain.*;

@Mapper
public interface BoardMapper {
	
	public List<Board> getBoard(int list_count_int);
	 
	public List<Board_Detail> getBoard_Detail(Board_Detail_Value detail);
	 
	public List<Board_Count> getBoard_Count();
	 
	public void setBorad_Add(Board_Add add);

	public void setBorad_Del(Board_Detail_Value detail);
	
	public void setBorad_Upd(Board_Detail list_Detail);

	public List<Login_Find_Code> getLogin_Find_Code();

	public String getVail_Chk(String id);

	public void setLogin_Add(Login_Add login_Add);
	
	public void setUser_Upd(User_Detail user_Detail);
	
	public String getLogin_Chk(@Param("ID") String userId, @Param("PASS") String pass);

	public List<User_Info> getUser_Info(String id);

	public void setUser_Borad_Del(String id);

	public void setUser_Del(String id);
}
