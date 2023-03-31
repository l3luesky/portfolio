package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Contact {
	private int con_num;
	private String con_title;
	private String con_content;
	private int con_count;
	private int mem_num;
	private Date con_date;
	private String con_replyCheck;
}
