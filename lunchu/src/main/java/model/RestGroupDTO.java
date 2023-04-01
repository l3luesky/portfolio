package model;

public class RestGroupDTO {

	
	 // 식그 순번 
    private int rgSeq;

    // 식당 순번 
    private int restSeq;

    // 그룹 순번 
    private int groupSeq;

    // 식그 날짜 
    private String rgDt;

	public int getRgSeq() {
		return rgSeq;
	}

	public void setRgSeq(int rgSeq) {
		this.rgSeq = rgSeq;
	}

	public int getRestSeq() {
		return restSeq;
	}

	public void setRestSeq(int restSeq) {
		this.restSeq = restSeq;
	}

	public int getGroupSeq() {
		return groupSeq;
	}

	public void setGroupSeq(int groupSeq) {
		this.groupSeq = groupSeq;
	}

	public String getRgDt() {
		return rgDt;
	}


	public void setRgDt(String rgDt) {
		this.rgDt = rgDt;
	}
    
	public RestGroupDTO(int rgSeq, int restSeq, int groupSeq, String rgDt) {
		super();
		this.rgSeq = rgSeq;
		this.restSeq = restSeq;
		this.groupSeq = groupSeq;
		this.rgDt = rgDt;
	}
    

}
