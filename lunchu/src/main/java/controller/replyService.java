package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.RestaurantDAO;
import model.ReviewDAO;
import model.ReviewDTO;
@WebServlet("/replyService")
public class replyService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		int rest_seq = Integer.valueOf(request.getParameter("rest_seq"));
		
		String rv_content = request.getParameter("rv_content");
		double rv_rating = Double.valueOf(request.getParameter("rv_rating"));
	
		String mem_id = request.getParameter("mem_id");
		
		ReviewDAO dao = new ReviewDAO();
		RestaurantDAO restDao = new RestaurantDAO();
		
		
		int cnt = dao.reply(rest_seq, rv_content, rv_rating, mem_id);
		double restRating = restDao.getRating(rest_seq);
		double sumRating = rv_rating+restRating;
		restDao.updateRating(rest_seq,sumRating);
		
		if(cnt>0) {
			writer.print("리뷰가 등록 되었습니다.");
		}else {
			writer.print("리뷰가 등록 X.");
		}
		writer.close();
		
	}

}
