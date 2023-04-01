package com.com.com.dao;

import java.util.List;

import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardSearch;

public interface IBlueDocDao {

	public void insertData(BlueDTO blueDTO);
	public List<BlueDTO> selectList(BoardSearch search);
	public void delete(Integer docId);
	public BlueDTO selectData(BlueDTO blueDTO);
	public List<BlueDTO> recentList(BlueDTO blueDTO);
}