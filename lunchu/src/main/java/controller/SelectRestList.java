package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.SelectRestListTestDAO;
import model.SelectRestListTestDTO;

@WebServlet("/SelectRestList")
public class SelectRestList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String category = request.getParameter("category");
		
		SelectRestListTestDAO dao = new SelectRestListTestDAO();
		ArrayList<SelectRestListTestDTO> list = dao.restList(category);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String test = gson.toJson(list);
		out.print(test);
		
	}
}


