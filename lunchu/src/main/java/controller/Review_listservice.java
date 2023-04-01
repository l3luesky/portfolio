package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import model.MemberDAO;
import model.ReviewDAO;
import model.ReviewDTO;

/**
 * Servlet implementation class Review
 */
public class Review_listservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		request.setCharacterEncoding("utf-8");
//		
//		int rv_seq = Integer.valueOf(request.getParameter("rv_seq"));
//		int rest_seq = Integer.valueOf(request.getParameter("rest_seq"));
//		String rv_content = request.getParameter("rv_content");
//		double rv_rating = Double.valueOf(request.getParameter("rv_rating"));
//		String rv_dt = request.getParameter("rv_dt");
//		
//		
//		
//		ReviewDTO dto = new ReviewDTO(rv_seq, rest_seq, rv_content, rv_rating,rv_dt);
//		ReviewDAO dao = new ReviewDAO();
//		
//		dao.reviewList(dto);
//		
//		javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("review_list.jsp");
//		rd.forward(request, response);
//		
	}

}
