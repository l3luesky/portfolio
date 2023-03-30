package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

public class MemberDAO {
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

	public int join(MemberDTO dto) {

		try {
			getconn();

			String sql = "insert into t_member values(?, ?, ?, null,?, sysdate,?)";
			psmt = conn.prepareStatement(sql);

			// 3-2 바인드 변수(?) 채우기
			psmt.setString(1, dto.getMemId());
			psmt.setString(2, dto.getMemPw());
			psmt.setString(3, dto.getMemAddr());
			psmt.setString(4, dto.getMemPrefCategory());
			psmt.setString(5, "M");

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

	public MemberDTO login(MemberDTO dto) {

		try {
			getconn();

			String sql = "select * from t_member where mem_id=?and mem_pw=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemId());
			psmt.setString(2, dto.getMemPw());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String addr = rs.getString(3);
				String visit_rest = rs.getString(4);
				String pref_cate = rs.getString(5);
				String joindt = rs.getString(6);
				String type = rs.getString(7);

				result = new MemberDTO(id, pw, addr, visit_rest, pref_cate, joindt, type);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int update(MemberDTO dto) {
		// TODO Auto-generated method stub
		try {
			getconn();

			String sql = "update t_member set mem_pw=? , mem_addr=? , mem_pref_category=? where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMemPw());
			psmt.setString(2, dto.getMemAddr());
			psmt.setString(3, dto.getMemPrefCategory());
			psmt.setString(4, dto.getMemId());

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public String search(String search_id) {
		String id = "";
		try {
			getconn();

			String sql = "select * from t_member where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, search_id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				id = rs.getString(1);
			} else {
				id = "";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return id;
	}
	
	
}