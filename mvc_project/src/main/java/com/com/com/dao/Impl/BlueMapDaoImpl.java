package com.com.com.dao.Impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.com.com.dao.IBlueMapDao;
import com.com.com.dto.BoardMapDTO;

@Service
public class BlueMapDaoImpl extends SqlSessionDaoSupport implements IBlueMapDao {

	@Override
	public BoardMapDTO selectData(Integer mapId) {
		return getSqlSession().selectOne("BoardMap.selectList",mapId);
	}


}
