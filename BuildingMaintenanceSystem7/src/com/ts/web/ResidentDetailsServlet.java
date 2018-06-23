package com.ts.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.dao.ResidentDAO;
import com.ts.dto.Resident;

/**
 * Servlet implementation class ResidentDetailsServlet
 */
@WebServlet("/ResidentDetailsServlet")
public class ResidentDetailsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();// TODO Auto-generated method stub
		int flatNo = Integer.parseInt(request.getParameter("flatNo"));
		HttpSession session = request.getSession();
		session.setAttribute("flatNo",flatNo);
		
		ResidentDAO residentDAO = new ResidentDAO();
		Resident resident = residentDAO.getResident(flatNo);
		if(resident != null){
		RequestDispatcher dispatcher=request.getRequestDispatcher("residentInfo.jsp");
		//request.setAttribute("flatNo",);
		//request.setAttribute("flatno", flatNo);
		response.setContentType("text/html");
		dispatcher.forward(request, response);
		} else {
			//RequestDispatcher dispatcher = request.getRequestDispatcher("SecretaryHome.jsp");
			out.println("<body bgcolor=white text=#CODO22><h3>flat is unoccupied</body>");
			RequestDispatcher dispatcher=request.getRequestDispatcher("SecretaryHome.jsp");
					dispatcher.include(request, response);		
			//response.sendRedirect("SecretaryHome.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
