package com.com.com.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.com.dao.IBlueDocDao;
import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardSearch;
import com.com.com.service.IBlueDocService;

@Service
public class BlueDocServiceImpl implements IBlueDocService {

	@Autowired private IBlueDocDao iBlueDocDao = null;
	
	@Override
	public void saveData(BlueDTO blueDTO) {
		iBlueDocDao.insertData(blueDTO);
	}

	@Override
	public List<BlueDTO> getList(BoardSearch search) {
		List<BlueDTO> list = iBlueDocDao.selectList(search);
		return list;
	}

	@Override
	public void remove(Integer docId) {
		iBlueDocDao.delete(docId);
	}

	@Override
	public BlueDTO getData(BlueDTO blueDTO) {
		return iBlueDocDao.selectData(blueDTO);
	}

	@Override
	public List<BlueDTO> getRecent(BlueDTO blueDTO) {
		return iBlueDocDao.recentList(blueDTO);
	}


}
