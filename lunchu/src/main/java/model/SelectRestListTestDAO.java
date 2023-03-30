package model;

import java.util.ArrayList;

public class SelectRestListTestDAO extends MemberDAO{
	

	public ArrayList<SelectRestListTestDTO> restList(String category) {
		ArrayList<SelectRestListTestDTO> list = new ArrayList<SelectRestListTestDTO>();
		try {
			getconn();
			String sql = "select * from t_restaurant where cate_name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, category);
			rs = psmt.executeQuery();
			while (rs.next()) {
				list.add(new SelectRestListTestDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
		
	}
	
	public ArrayList<SelectRestListTestDTO> getLunchuList(String[] cv) {
		ArrayList<SelectRestListTestDTO> list = new ArrayList<SelectRestListTestDTO>();
		try {
			getconn();
			String sql = "select * from t_restaurant where rest_seq in(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cv[0]);
			psmt.setString(2, cv[1]);
			psmt.setString(3, cv[2]);
			psmt.setString(4, cv[3]);
			psmt.setString(5, cv[4]);
			psmt.setString(6, cv[5]);
			psmt.setString(7, cv[6]);
			psmt.setString(8, cv[7]);
			psmt.setString(9, cv[8]);
			psmt.setString(10, cv[9]);
			psmt.setString(11, cv[10]);
			psmt.setString(12, cv[11]);
			psmt.setString(13, cv[12]);
			psmt.setString(14, cv[13]);
			psmt.setString(15, cv[14]);
			psmt.setString(16, cv[15]);
			psmt.setString(17, cv[0]);
			psmt.setString(18, cv[0]);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				list.add(new SelectRestListTestDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
		
	}

}
