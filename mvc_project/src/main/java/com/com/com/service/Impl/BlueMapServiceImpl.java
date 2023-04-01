package com.com.com.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.com.dao.IBlueMapDao;
import com.com.com.dto.BoardMapDTO;
import com.com.com.service.IBlueMapService;

@Service
public class BlueMapServiceImpl implements IBlueMapService {

	@Autowired private IBlueMapDao iBlueMapDao = null;

	@Override
	public BoardMapDTO getData(Integer mapId) {
		return iBlueMapDao.selectData(mapId);
	}
}
