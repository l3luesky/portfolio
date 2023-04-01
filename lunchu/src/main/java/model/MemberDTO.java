package model;

public class MemberDTO {


		// 회원 아이디
		private String memId;

		// 회원 비밀번호
		private String memPw;

		// 회원 주소
		private String memAddr;

		// 회원 방문식당
		private String memVisitRestaurant;

		// 회원 선호카테고리
		private String memPrefCategory;

		// 회원 가입일자
		private String memJoindate;

		// 회원 유형 회원:'M', 관리자:'A'
		private String memType;

		

		public String getMemId() {
			return memId;
		}



		public void setMemId(String memId) {
			this.memId = memId;
		}



		public String getMemPw() {
			return memPw;
		}



		public void setMemPw(String memPw) {
			this.memPw = memPw;
		}



		public String getMemAddr() {
			return memAddr;
		}



		public void setMemAddr(String memAddr) {
			this.memAddr = memAddr;
		}



		public String getMemVisitRestaurant() {
			return memVisitRestaurant;
		}



		public void setMemVisitRestaurant(String memVisitRestaurant) {
			this.memVisitRestaurant = memVisitRestaurant;
		}



		public String getMemPrefCategory() {
			return memPrefCategory;
		}



		public void setMemPrefCategory(String memPrefCategory) {
			this.memPrefCategory = memPrefCategory;
		}



		public String getMemJoindate() {
			return memJoindate;
		}



		public void setMemJoindate(String memJoindate) {
			this.memJoindate = memJoindate;
		}



		public String getMemType() {
			return memType;
		}



		public void setMemType(String memType) {
			this.memType = memType;
		}
		
		
		
		public MemberDTO(String memId, String memPw) {
			super();
			this.memId = memId;
			this.memPw = memPw;
		}



		public MemberDTO(String memId, String memPw, String memAddr, String string) {
			super();
			this.memId = memId;
			this.memPw = memPw;
			this.memAddr = memAddr;
			this.memPrefCategory = string;
		}



		public MemberDTO(String memId, String memPw, String memAddr, String memVisitRestaurant, String memPrefCategory,
				String memJoindate, String memType) {
			super();
			this.memId = memId;
			this.memPw = memPw;
			this.memAddr = memAddr;
			this.memVisitRestaurant = memVisitRestaurant;
			this.memPrefCategory = memPrefCategory;
			this.memJoindate = memJoindate;
			this.memType = memType;
		}
		

		
		




}