package model;


public class GroupDTO {
	
	 // 그룹 순번 
    private int groupSeq;

    // 그룹 명 
    private String groupName;

    // 그룹 생성일자 
    private String groupDt;

    // 그룹 관리자 
    private String adminId;

	public int getGroupSeq() {
		return groupSeq;
	}

	public void setGroupSeq(int groupSeq) {
		this.groupSeq = groupSeq;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupDt() {
		return groupDt;
	}

	public void setGroupDt(String groupDt) {
		this.groupDt = groupDt;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public GroupDTO(String groupName, String adminId) {
		super();
		this.groupName = groupName;
		this.adminId = adminId;
	}

	public GroupDTO(int groupSeq, String groupName, String groupDt, String adminId) {
		super();
		this.groupSeq = groupSeq;
		this.groupName = groupName;
		this.groupDt = groupDt;
		this.adminId = adminId;
	}


    
    
}
