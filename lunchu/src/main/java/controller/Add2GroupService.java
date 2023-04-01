package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RestGroupDAO;

/**
 * Servlet implementation class Add2GroupService
 */
public class Add2GroupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String[] groupseq = request.getParameterValues("arr[]");

		int restseq = Integer.valueOf(request.getParameter("rest_seq"));
		//requst.getParameter("restseq");
		// restaurant_detail에 음식점 번호 추가가 안된 상태여서 테스트로 1번 식당으로 체크함.

		RestGroupDAO RGdao = new RestGroupDAO();

		int cnt = 0;

		for (String i : groupseq) {
			cnt += RGdao.add(restseq, Integer.valueOf(i));
		}

		PrintWriter out = response.getWriter();

		if (cnt == groupseq.length) {
			out.print("성공");
			out.close();
		}

	}

}
