package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RestGroupDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

	private void getconn() {
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

	private void close() {
		// 1. try catch
		String nextPage = "";
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

	public ArrayList<Integer> list(int groupseq) {
		// TODO Auto-generated method stub
		ArrayList<Integer> result = new ArrayList<Integer>();
		try {
			getconn();

			String sql = "select * from t_rest_group where group_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, groupseq);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int rest_seq = rs.getInt(2);

				result.add(rest_seq);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int add(int rest_seq, int group_seq) {
		// TODO Auto-generated method stub
		try {
			getconn();

			String sql = "insert into t_rest_group values(t_rest_group_seq.nextval, ?, ?, sysdate)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rest_seq);
			psmt.setInt(2, group_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int delete(int j, int group_seq) {
		// TODO Auto-generated method stub
		try {
			getconn();
			
			String sql = "delete from t_rest_group where rest_seq = ? and group_seq = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(j, group_seq);
			
			cnt = psmt.executeUpdate();
			
				
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		return cnt;
	}
}
