package com.com.com.service;

import java.util.List;

import com.com.com.dto.BoardMapDTO;


public interface IBoardMapService {
	public List<BoardMapDTO> getList();
	public BoardMapDTO getData(Integer mapId);
}
