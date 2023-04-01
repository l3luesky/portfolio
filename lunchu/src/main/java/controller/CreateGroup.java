package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;
import model.GroupDAO;
import model.JoinGroupDAO;
import model.MemberDTO;

/**
 * Servlet implementation class CreateGroup
 */
@WebServlet("/CreateGroup")
public class CreateGroup extends HttpServlet {
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

		HttpSession session = request.getSession();
		

		String groupname = request.getParameter("groupname");
		String[] memberIds = request.getParameterValues("memberIds[]");
		
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String id = info.getMemId();

		GroupDAO Gdao = new GroupDAO();
		JoinGroupDAO JGdao = new JoinGroupDAO();
		
		int cnt = Gdao.create(groupname, id);
//		 여기까지 잘 작동, 그룹 테이블 생성됨.
		PrintWriter out = response.getWriter();
		if(cnt > 0) {
			int groupseq = Gdao.groupseq();
			for(String i:memberIds) {
				int cnt2 = JGdao.joingroup(i, groupseq);
				if (cnt2 > 0) {
					out.println("그룹이 생성되었습니다.");
					out.close();
				} else {
					out.println("그룹 생성에 실패하였습니다.");
					out.close();
					break;
				}
			}
		} else {
			out.println("그룹명을 입력해주세요.");
			out.close();
		}
		
	}
}
