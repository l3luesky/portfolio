package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;
import model.MemberDAO;
import model.MemberDTO;

/**
 * Servlet implementation class SearchService
 */
@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @return 
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		boolean same = false;
		String searchId = request.getParameter("searchId");
		String[] memberIds = request.getParameterValues("memberIds[]");
		for (int i = 0; i<memberIds.length; i++) {
			if(memberIds[i].equals(searchId)) {
				same = true;
				break;
			}
		}
		
		MemberDAO dao = new MemberDAO();
		String searched = "";
		if (same) {
			out.print("이미 추가한 아이디입니다.");
		} else {
			searched = dao.search(searchId);
			if(searched!="") {
				out.print(searched);
			} else {
				out.print("");
			}
		}
		
//		
//		아이디 없을 경우 alert창 띄우기 - 지은
		
	}

}
