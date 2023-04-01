package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.SelectRestListTestDAO;
import model.SelectRestListTestDTO;
public class LunchuListService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LunchuListService 입장");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String c = request.getParameter("c");
		String d = request.getParameter("d");
		String e = request.getParameter("e");
		String f = request.getParameter("f");
		String g = request.getParameter("g");
		String h = request.getParameter("h");
		String i = request.getParameter("i");
		String j = request.getParameter("j");
		String k = request.getParameter("k");
		String l = request.getParameter("l");
		String m = request.getParameter("m");
		String n = request.getParameter("n");
		String o = request.getParameter("o");
		String p = request.getParameter("p");
		String q = request.getParameter("q");
		System.out.println("입장완료 ");
		String [] cv = {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q};
		
		SelectRestListTestDAO dao = new SelectRestListTestDAO();
		ArrayList<SelectRestListTestDTO> list = dao.getLunchuList(cv);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String test = gson.toJson(list);
		out.print(test);
	}

}
