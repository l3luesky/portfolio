package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.RestaurantDTO;

public class LunchuListDAO{
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
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

	public ArrayList<RestaurantDTO> getLunchuList(String[] LuncuList) {
		ArrayList<RestaurantDTO> getList = new ArrayList<RestaurantDTO>();
		
		try {
			getconn();
			
			String sql = "select * from t_restaurant where rest_name in (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, LuncuList[0]);
			psmt.setString(2, LuncuList[1]);
			psmt.setString(3, LuncuList[2]);
			psmt.setString(4, LuncuList[3]);
			psmt.setString(5, LuncuList[4]);
			psmt.setString(6, LuncuList[5]);
			psmt.setString(7, LuncuList[6]);
			psmt.setString(8, LuncuList[7]);
			psmt.setString(9, LuncuList[8]);
			psmt.setString(10, LuncuList[9]);
			psmt.setString(11, LuncuList[10]);
			psmt.setString(12, LuncuList[11]);
			psmt.setString(13, LuncuList[12]);
			psmt.setString(14, LuncuList[13]);
			psmt.setString(15, LuncuList[14]);
			psmt.setString(16, LuncuList[15]);
			psmt.setString(17, LuncuList[16]);
			psmt.setString(18, LuncuList[17]);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				getList.add(new RestaurantDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getList;
	}

	
	
}
