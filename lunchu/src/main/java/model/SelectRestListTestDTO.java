package model;

public class SelectRestListTestDTO {
	
    private int restSeq;
    private String restName;
    private String restAddr;
    private String cateName;
    private String restTel;
    
    
	public SelectRestListTestDTO() {
	}
	
	public SelectRestListTestDTO(int restSeq, String restName, String restAddr, String cateName, String restTel) {
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
