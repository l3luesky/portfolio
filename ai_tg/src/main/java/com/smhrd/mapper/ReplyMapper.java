package com.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Reply;

@Mapper
public interface ReplyMapper {

	public void insertReply(Reply reply);

	public void updataReply(Reply reply);

	public Reply getReply(int con_num);

}
