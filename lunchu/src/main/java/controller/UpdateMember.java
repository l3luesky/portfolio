package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;
import model.MemberDAO;
import model.MemberDTO;

/**
 * Servlet implementation class UpdateMemberService
 */
@WebServlet("/Updatemember")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		
		String pw = request.getParameter("pw");
		String pwCheck = request.getParameter("pwCheck");
		String address = request.getParameter("address");
		String prefCate = Arrays.toString(request.getParameterValues("category"));
		String visitRest = request.getParameter("vistRest"); 

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		
		String id = info.getMemId();
		
		MemberDAO dao = new MemberDAO();
		String nextPage = "";
		if(pw.equals(pwCheck)) {
			MemberDTO dto = new MemberDTO(id, pw, address, info.getMemVisitRestaurant(), prefCate, info.getMemJoindate(), info.getMemType());
			int cnt = dao.update(dto);
			
			if(cnt > 0) {
				session.setAttribute("info", dto);
				nextPage = "home.jsp";
				writer.println("<script>alert('회원정보 수정이 완료되었습니다.'); location.href='profile.jsp';</script>"); 
				writer.close();
			} else {
				writer.println("<script>alert('회원정보 수정에 실패했습니다. 입력하신 내용을 확인해주세요.'); location.href='profile.jsp';</script>"); 
				writer.close();
			}
		} else {
			writer.println("<script>alert('비밀번호와 비밀번호 확인이 다릅니다. 입력하신 내용을 확인해주세요.'); location.href='profile.jsp';</script>"); 
			writer.close();
			// 여기 쿠키 사용해서 입력하던 내용이 그대로 유지되면 좋을 것 같음. - 지은
		}
		
		//RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		//rd.forward(request, response);
		
	}

}
