package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReservationDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ReservationDTO dto = null;

	public void getconn() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "cgi_4_1220_2";
			String db_pw = "smhrd2";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close() {
		// 1. try catch
		try {
			// 2.
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ReservationDTO> select(String id) {
		ArrayList<ReservationDTO> result = new ArrayList<ReservationDTO>();
		try {
			getconn();
			
			String sql = "select * from t_reservation where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int reserv_seq =rs.getInt(1);
				int rest_seq = rs.getInt(2);
				String rerserv_time  = rs.getString(3);
				String reserv_date = rs.getString(4);
				String mem_id = rs.getString(5); 
				
				result.add(new ReservationDTO(reserv_seq, rest_seq, rerserv_time, reserv_date, mem_id));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		} return result;
		
	}

	
	public int add(int restSeq, String reservTime, String memId) {
		try {
			getconn();

			String sql = "insert into t_reservation values(t_reservation_seq.nextval, ?, ?, to_date(current_date, 'YYYY-MM-DD'), ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, restSeq);
			psmt.setString(2, reservTime);
			psmt.setString(3, memId);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	ArrayList list = new ArrayList<>();
	
	public ArrayList<String> showReserveTime(int rest_seq) {
		try {
			getconn();
			
			String sql = "select reserv_time from t_reservation where rest_seq= ? and to_date(reserv_date, 'YYYY-MM-DD') >= (select to_date(current_date, 'YYYY-MM-DD') from dual)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rest_seq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String time = rs.getString(1);
				
				list.add(time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int updateVisitedRest(String id, String VisitRestaurant) {
		try {
			getconn();

			String sql = "update t_member set MEM_VISIT_RESTAURANT=? where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, VisitRestaurant);
			psmt.setString(2, id);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}

