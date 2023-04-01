package com.com.com.dto;

import com.com.com.dto.PageDTO;

public class BoardSearch extends PageDTO{
	private Integer mapId = null;
	
	private String searchType = null;
	private String searchText = null;

	public Integer getMapId() {
		return mapId;
	}

	public void setMapId(Integer mapId) {
		this.mapId = mapId;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
}
