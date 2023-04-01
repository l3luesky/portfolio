package com.com.com.dao.Impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.com.com.dao.IBlueDocDao;
import com.com.com.dto.BlueDTO;
import com.com.com.dto.BoardSearch;

@Service
public class BlueDocDaoImpl extends SqlSessionDaoSupport implements IBlueDocDao {

	@Override
	public void insertData(BlueDTO blueDTO) {
		getSqlSession().insert("BlueDoc.insertData",blueDTO);
	}

	@Override
	public List<BlueDTO> selectList(BoardSearch search) {
		return getSqlSession().selectList("BlueDoc.selectList",search);
	}

	@Override
	public void delete(Integer docId) {
		getSqlSession().delete("BlueDoc.deleteData",docId);
	}

	@Override
	public BlueDTO selectData(BlueDTO blueDTO) {
		return getSqlSession().selectOne("BlueDoc.selectData",blueDTO);
	}

	@Override
	public List<BlueDTO> recentList(BlueDTO blueDTO) {
		return getSqlSession().selectList("BlueDoc.recentList",blueDTO);
	}
}
