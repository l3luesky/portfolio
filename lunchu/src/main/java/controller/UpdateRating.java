package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;
/*import model.RestaurantDTO;*/
import model.ReviewDAO;

@WebServlet("/UpdateRating")
public class UpdateRating extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		int rest_seq = Integer.valueOf(request.getParameter("rest_seq"));
		int rest_rat_cnt = Integer.valueOf(request.getParameter("rest_rat_cnt"));
		
		String rv_content = request.getParameter("rv_content");
		double rv_rating = Double.valueOf(request.getParameter("rv_rating"));
	
		String mem_id = request.getParameter("mem_id");
		
		ReviewDAO dao = new ReviewDAO();
		/* RestaurantDTO dto = new RestaurantDTO(rv_rating, rest_rat_cnt); */
		
		
		
		
		
		
		
	}

}
