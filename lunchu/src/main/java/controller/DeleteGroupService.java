package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GroupDAO;
import model.JoinGroupDAO;
import model.MemberDTO;

/**
 * Servlet implementation class DeleteGroupService
 */
public class DeleteGroupService extends HttpServlet {
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
		PrintWriter out = response.getWriter();

		String adminId = request.getParameter("adminId");
		int groupseq = Integer.valueOf(request.getParameter("groupseq"));

		HttpSession session = request.getSession();

		MemberDTO Mdto = (MemberDTO) session.getAttribute("info");

		String id = Mdto.getMemId();
		System.out.println(id);
		System.out.println(groupseq);
		System.out.println(adminId);

		JoinGroupDAO JGdao = new JoinGroupDAO();
		GroupDAO Gdao = new GroupDAO();

		int cnt1 = 0;
		int cnt2 = 0;
		if (id.equals(adminId)) {
			cnt1 = JGdao.delete(groupseq);
			cnt2 = Gdao.delete(groupseq);
		} else {
			cnt1 = JGdao.deleteMember(groupseq, id);
		}
		
		String result = "";
		if(cnt1>0&cnt2>0) {
			result = "그룹 삭제가 완료되었습니다.";
		} else if(cnt1>0&cnt2==0) {
			result = "그룹 나가기가 완료되었습니다.";
		} else {
			result = "그룹 삭제 또는 나가기가 실패하였습니다. 관리자에게 문의하세요.";
		}
		
		out.print(result);

	}

}
