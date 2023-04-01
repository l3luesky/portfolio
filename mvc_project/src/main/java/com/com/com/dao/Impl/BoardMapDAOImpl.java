package com.com.com.dao.Impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.com.com.dao.IBoardMapDAO;
import com.com.com.dto.BoardMapDTO;


@Repository
public class BoardMapDAOImpl extends SqlSessionDaoSupport implements IBoardMapDAO{

	@Override
	public List<BoardMapDTO> selectList() {
		return getSqlSession().selectList("BoardMap.selectList");
	}

	@Override
	public BoardMapDTO selectData(Integer mapId) {
		return getSqlSession().selectOne("BoardMap.selectData", mapId);
	}
}
