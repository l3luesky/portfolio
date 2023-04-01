package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JoinGroupDAO;
import model.RestGroupDAO;
import model.RestaurantDAO;

/**
 * Servlet implementation class DeleteRestFromGroup
 */
public class DelRestFromGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int group_seq = Integer.valueOf(request.getParameter("groupseq"));
		String[] arr = request.getParameterValues("arr");
		System.out.println(group_seq);
		System.out.println(arr.toString());
		/*
		RestaurantDAO Rdao = new RestaurantDAO();
		
		ArrayList<Integer> rest_seq_arr = new ArrayList<Integer>();
		for (String i : arr) {
			rest_seq_arr.add(Rdao.getseq(i));
		}
		
		RestGroupDAO RGdao = new RestGroupDAO();
		ArrayList<Integer> deleted = new ArrayList<Integer>();
		for (int j : rest_seq_arr) {
			deleted.add(RGdao.delete(j, group_seq));
		}
		
		if(deleted.size()==arr.length) {
			out.print("삭제가 완료되었습니다.");
		} else {
			out.print("오류발생");
		}
		*/
	}

}
