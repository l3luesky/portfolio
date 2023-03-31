package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Contact;
import com.smhrd.entity.Member;

@Mapper
public interface ContactMapper {

	public Member selectMem(int mem_num);
	public void insertQues(Contact con);
	public List<Contact> contactList(int mem_num);
	public Member selectTest(String mem_id);
	public List<Contact> getList(int number);
	public Contact getContact(int con_number);
	public void updateContact(int con_num);

}
