package model;

public class ReservationDTO {
	   // 예약 순번 
    private int reservSeq;

    // 예약 식당 순번 
    private int restSeq;

    // 예약 시간 
    private String reservTime;

    // 예약 날짜 
    private String reservDate;

    // 예약자 아이디 
    private String memId;
    
    

	public int getReservSeq() {
		return reservSeq;
	}

	public void setReservSeq(int reservSeq) {
		this.reservSeq = reservSeq;
	}

	public int getRestSeq() {
		return restSeq;
	}

	public void setRestSeq(int restSeq) {
		this.restSeq = restSeq;
	}

	public String getReservTime() {
		return reservTime;
	}

	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}


	public ReservationDTO(int reservSeq, int restSeq, String reservTime, String reservDate, String memId) {
		super();
		this.reservSeq = reservSeq;
		this.restSeq = restSeq;
		this.reservTime = reservTime;
		this.reservDate = reservDate;
		this.memId = memId;
	}
    
    

}
