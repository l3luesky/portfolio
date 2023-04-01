package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuListDAO {
   
   String han = "한식";

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

   ArrayList<MenuListDTO> list = new ArrayList<>();

   
   
   
   public ArrayList<MenuListDTO> menuList(String cate) {
      ArrayList<MenuListDTO> menuList = new ArrayList<MenuListDTO>();

      try {

         getConn();

         String sql = "select * from t_restaurant where cate_name=?";

         psmt = conn.prepareStatement(sql);
         psmt.setString(1, cate);

         rs = psmt.executeQuery();

         while (rs.next()) {

            int restSeq = rs.getInt(1);
            String restName = rs.getString(2);
            String restAddr = rs.getString(3);
            String cateName = rs.getString(4);
            String restTel = rs.getString(5);
            menuList.add(new MenuListDTO(restSeq, restName, restAddr, cateName, restTel));
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

}