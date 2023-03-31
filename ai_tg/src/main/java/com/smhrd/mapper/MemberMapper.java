package com.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {
	
	public void memberInsert(Member member);
	public Member memberLogin(String mem_id); 
	public void updateInfo(Member member);
	public Member selectData(int mem_num);
	
}
