package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GroupDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

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

	public int create(String groupname, String id) {
		try {
			getconn();

			String sql = "insert into t_group values(t_group_SEQ.nextval, ?, current_date, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, groupname);
			psmt.setString(2, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int groupseq() {
		// TODO Auto-generated method stub
		int groupseq = 0;
		try {
			getconn();

			String sql = "select group_seq from (select * from t_group order by group_seq desc) where rownum = 1";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {
				groupseq = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return groupseq;

	}

	public GroupDTO select(int groupseq) {
		GroupDTO dto = null;
		try {
			getconn();

			String sql = "select * from t_group where group_seq =?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, groupseq);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String groupName = rs.getString(2);
				String groupDt = rs.getString(3);
				String adminId = rs.getString(4);
				dto = new GroupDTO(groupseq, groupName, groupDt, adminId);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}

	public int delete(int group_seq) {
		// TODO Auto-generated method stub
		try {
			getconn();

			String sql = "delete from t_group where group_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, group_seq);

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
