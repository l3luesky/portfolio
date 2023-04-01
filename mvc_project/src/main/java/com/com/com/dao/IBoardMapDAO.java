package com.com.com.dao;

import java.util.List;

import com.com.com.dto.BoardMapDTO;


public interface IBoardMapDAO {
	public List<BoardMapDTO> selectList();
	public BoardMapDTO selectData(Integer mapId);
}