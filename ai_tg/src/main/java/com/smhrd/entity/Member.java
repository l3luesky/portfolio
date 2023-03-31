package com.smhrd.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private int mem_num;
	private String mem_name;
	private String mem_id;
	private String mem_pw;
	private String mem_addr;
	private String mem_tel;
	private Date mem_date;
}
