package com.com.com.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.com.dao.IBoardMapDAO;
import com.com.com.dto.BoardMapDTO;
import com.com.com.service.IBoardMapService;


@Service
public class BoardMapServiceImpl implements IBoardMapService{
	
	@Autowired private IBoardMapDAO boardMapDAOImpl = null;

	@Override
	public List<BoardMapDTO> getList() {
		return boardMapDAOImpl.selectList();
	}

	@Override
	public BoardMapDTO getData(Integer mapId) {
		return boardMapDAOImpl.selectData(mapId);
	}
}
