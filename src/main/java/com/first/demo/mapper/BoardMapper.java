package com.first.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.first.demo.domain.*;

@Mapper
public interface BoardMapper {
	
	 public List<Board> getBoard(int list_count_int);
	 
	 public List<Board_Detail> getBoard_Detail(Board_Detail_Value detail);
	 
	 public List<Board_Count> getBoard_Count();
	 
	 public void setBorad_Add(Board_Add add);

	public void setBorad_Del(Board_Detail_Value detail);

	public void setBorad_Upd(Board_Detail list_Detail);
}
