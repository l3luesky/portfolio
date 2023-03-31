package com.smhrd.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	private int re_num;
	private int con_num;
	private String re_content;
	private Date re_date;
}
