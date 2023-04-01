package com.com.com.service;

import java.util.List;

import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardSearch;


public interface IBlueDocService {

	public void saveData(BlueDTO blueDTO);
	public List<BlueDTO> getList(BoardSearch search);
	public void remove(Integer docId);
	public BlueDTO getData(BlueDTO blueDTO);
	public List<BlueDTO> getRecent(BlueDTO blueDTO);
}
