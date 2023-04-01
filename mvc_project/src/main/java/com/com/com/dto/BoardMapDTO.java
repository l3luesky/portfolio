package com.com.com.dto;

public class BoardMapDTO {
	private int boardOrder = 0;
	private Integer mapId = null;
	private Integer parMapId = null;
	private String mapNm = null;
	
	public int getBoardOrder() {
		return boardOrder;
	}
	public void setBoardOrder(int boardOrder) {
		this.boardOrder = boardOrder;
	}
	public Integer getMapId() {
		return mapId;
	}
	public void setMapId(Integer mapId) {
		this.mapId = mapId;
	}
	public Integer getParMapId() {
		return parMapId;
	}
	public void setParMapId(Integer parMapId) {
		this.parMapId = parMapId;
	}
	public String getMapNm() {
		return mapNm;
	}
	public void setMapNm(String mapNm) {
		this.mapNm = mapNm;
	}
}
