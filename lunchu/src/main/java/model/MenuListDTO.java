package model;

import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuListDTO {

	// 음식점 번호
	private int restSeq;

	// 음식점명
	private String restName;

	// 음식점 주소
	private String restAddr;

	// 카테고리 이름
	private String cateName;

	// 음식점 연락처
	private String restTel;

	public MenuListDTO(int restSeq, String restName, String restAddr, String cateName, String restTel) {
		super();
		this.restSeq = restSeq;
		this.restName = restName;
		this.restAddr = restAddr;
		this.cateName = cateName;
		this.restTel = restTel;
	}

	public int getRestSeq() {
		return restSeq;
	}

	public void setRestSeq(int restSeq) {
		this.restSeq = restSeq;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestAddr() {
		return restAddr;
	}

	public void setRestAddr(String restAddr) {
		this.restAddr = restAddr;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getRestTel() {
		return restTel;
	}

	public void setRestTel(String restTel) {
		this.restTel = restTel;
	}

}
