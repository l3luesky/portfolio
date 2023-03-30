package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JoinGroupDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO result = null;

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

	public int joingroup(String member, int groupseq) {
		try {
			getconn();

			String sql = "insert into t_joingroup values(t_joingroup_seq.nextval, ?, ?, current_date)";
			psmt = conn.prepareStatement(sql);

			// 3-2 바인드 변수(?) 채우기
			psmt.setString(1, member);
			psmt.setInt(2, groupseq);

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

	public ArrayList<Integer> select(String id) {
		ArrayList<Integer> groupseq = new ArrayList<>();
		try {
			getconn();

			String sql = "select group_seq from t_joingroup where mem_id=?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getInt(1));
				groupseq.add(rs.getInt(1));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return groupseq;

	}
	
	public ArrayList<String> findmembers(int group_seq) {
		ArrayList<String> members = new ArrayList<>();
		try {
			getconn();

			String sql = "select mem_id from t_joingroup where group_seq=?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, group_seq);
			rs = psmt.executeQuery();

			while (rs.next()) {
				members.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return members;

	}
	
	public int deleteMember(int group_seq, String mem_id) {
		try {
			getconn();
			
			String sql = "delete from t_joingroup where group_seq = ? and mem_id =? ";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, group_seq);
			psmt.setString(2, mem_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int delete(int group_seq) {
		try {
			getconn();
			
			String sql = "delete from t_joingroup where group_seq = ?";
			
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
