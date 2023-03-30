package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

	public void getConn() {

		try {

			Class.forName("oracle.jdbc.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "cgi_4_1220_2";
			String db_pw = "smhrd2";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {

		try {

			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	ArrayList<ReviewDTO> list = new ArrayList<>();

	public ArrayList<ReviewDTO> reviewList(MemberDTO dto) {

		try {

			getConn();

			String sql = "select * from t_review where mem_id=?";

			System.out.println(psmt);

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemId());

			rs = psmt.executeQuery();

			while (rs.next()) {

				int rv_seq = rs.getInt(1);
				int rest_seq = rs.getInt(2);
				String rv_content = rs.getString(3);
				double rv_rating = rs.getDouble(4);
				String rv_dt = rs.getString(5).substring(0, 10);

				ReviewDTO re_dto = new ReviewDTO(rv_seq, rest_seq, rv_content, rv_rating, rv_dt);

				list.add(re_dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<ReviewDTO> restReview(int rest_seq) {
		ArrayList<ReviewDTO> result = new ArrayList<ReviewDTO>();
		try {
			getConn();

			String sql = "select * from t_review where rest_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rest_seq);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String content = rs.getString(3);
				double rating = rs.getDouble(4);
				String date = rs.getString(5);
				String memId = rs.getString(6);

				result.add(new ReviewDTO(content, rating, date, memId));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int reply(int rest_seq, String rv_content, double rv_rating, String mem_id) {
		
		try {
			getConn();

			String sql = "insert into t_review values(t_review_seq.nextval, ?, ?, ?, current_date, ?)";
			psmt = conn.prepareStatement(sql);

			// 3-2 바인드 변수(?) 채우기
			
			psmt.setInt(1,rest_seq);
			psmt.setString(2,rv_content);
			psmt.setDouble(3, rv_rating);			
			psmt.setString(4,  mem_id);
			
			
			// 4. 실행
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}

