package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

/**
 * Servlet implementation class JoinService
 */
@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");

		MemberDAO dao = new MemberDAO();
		

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String address = request.getParameter("address");
		String[] pref_cate = request.getParameterValues("category");
		System.out.println(Arrays.toString(pref_cate));
		
		
		MemberDTO dto = new MemberDTO(id, pw, address, Arrays.toString(pref_cate));
		int cnt = dao.join(dto);

		if (cnt == 1) {
			response.sendRedirect("home.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이미 있는 아이디입니다. 다른 아이디를 입력해주세요.'); location.href='join.jsp';</script>");
			writer.close();
		}

	}

}