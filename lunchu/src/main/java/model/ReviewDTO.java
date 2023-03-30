package model;

public class ReviewDTO {

	// 리뷰 순번
	private int rv_seq;

	// 식당 순번
	private int rest_seq;

	// 리뷰 내용
	private String rv_content;

	// 리뷰 평정
	private double rv_rating;

	// 리뷰 날짜
	private String rv_dt;

	// 작성자 아이디
	private String mem_id;

	public int getRv_seq() {
		return rv_seq;
	}

	public void setRv_seq(int rv_seq) {
		this.rv_seq = rv_seq;
	}

	public int getRest_seq() {
		return rest_seq;
	}

	public void setRest_seq(int rest_seq) {
		this.rest_seq = rest_seq;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public double getRv_rating() {
		return rv_rating;
	}

	public void setRv_rating(double rv_rating) {
		this.rv_rating = rv_rating;
	}

	public String getRv_dt() {
		return rv_dt;
	}

	public void setRv_dt(String rv_dt) {
		this.rv_dt = rv_dt;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public ReviewDTO(int rv_seq, int rest_seq, String rv_content, double rv_rating, String rv_dt, String mem_id) {
		super();
		this.rv_seq = rv_seq;
		this.rest_seq = rest_seq;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_dt = rv_dt;
		this.mem_id = mem_id;
	}

	public ReviewDTO(int rv_seq, int rest_seq, String rv_content, double rv_rating, String rv_dt) {
		super();
		this.rv_seq = rv_seq;
		this.rest_seq = rest_seq;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_dt = rv_dt;
	}

	public ReviewDTO(String rv_content, double rating, String rv_dt, String memId) {
		// TODO Auto-generated constructor stub
		super();
		this.rv_content = rv_content;
		this.rv_rating = rating;
		this.rv_dt = rv_dt;
		this.mem_id = memId;
	}
	@Override
	public String toString() {
		return "replyDTO [rv_seq=" + rv_seq + ", rest_seq=" + rest_seq + ", mem_id=" + mem_id + ", rv_dt=" + rv_dt
				+ ", rv_content=" + rv_content + ", rv_rating=" + rv_rating + "]";
	}

}
