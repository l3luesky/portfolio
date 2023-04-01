package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RestaurantDAO {

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

	ArrayList<RestaurantDTO> list = new ArrayList<>();

	public ArrayList<RestaurantDTO> menuList() {
		System.out.println("메뉴리스트 들어옴");
		ArrayList<RestaurantDTO> menuList = new ArrayList<RestaurantDTO>();

		try {

			getConn();

			String sql = "select * from t_restaurant where cate_name='한식'";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				int restSeq = rs.getInt(1);
				String restName = rs.getString(2);
				String restAddr = rs.getString(3);
				String cateName = rs.getString(4);
				String restTel = rs.getString(5);
				menuList.add(new RestaurantDTO(restSeq, restName, restAddr, cateName, restTel));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return menuList;
	}

	public ArrayList<String> getNames(ArrayList<Integer> restseq) {
		ArrayList<String> restNames = new ArrayList<String>();
		try {

			getConn();
			for (int i : restseq) {
				String sql = "select * from t_restaurant where rest_seq=?";
				psmt = conn.prepareStatement(sql);

				psmt.setInt(1, i);
				rs = psmt.executeQuery();
				while (rs.next()) {
					String restName = rs.getString(2);
					restNames.add(restName);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return restNames;
	}

	public String getName(int restseq) {
		String result = "";
		try {

			getConn();
			String sql = "select rest_name from t_restaurant where rest_seq=?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, restseq);
			rs = psmt.executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public RestaurantDTO getRestaurant(int rest_seq) {
		RestaurantDTO resultDto = null;
		try {
			getConn();
			String sql = "select * from t_restaurant where rest_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rest_seq);
			rs = psmt.executeQuery();
			if (rs.next()) {
				resultDto = new RestaurantDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return resultDto;
		
	}

	public void updateRating(int rest_seq, double rating) {
		try {
			getConn();
			String sql = "update t_restaurant set rest_rating = ? where rest_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, rating);
			psmt.setInt(2, rest_seq);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
	}
	public double getRating(int rest_seq) {
		double restRating = 0;
		try {
			getConn();
			
			String sql = "select rest_rating from t_restaurant where rest_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rest_seq);
			rs = psmt.executeQuery();
			if (rs.next()) {
				restRating = rs.getDouble(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return restRating;
	}

	public int getseq(String i) {
		// TODO Auto-generated method stub
		int rest_seq = 0;
		try {
			getConn();
			
			String sql = "select * from t_restaurant where rest_name = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, i);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				rest_seq = rs.getInt("rest_seq");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return rest_seq;
	}

}
