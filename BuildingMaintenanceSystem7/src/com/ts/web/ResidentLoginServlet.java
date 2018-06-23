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
 * Servlet implementation class ResidentLoginServlet
 */
@WebServlet("/ResidentLoginServlet")
public class ResidentLoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		ResidentDAO residentDAO = new ResidentDAO();
		Resident resident = residentDAO.getResidentProfile(userName,password);
		//int flatNo = resident.getFlatNo();
		//HttpSession session = request.getSession();
		//session.setAttribute("flatNo",resident.getFlatNo());
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		if(resident != null){
			RequestDispatcher dispatcher=request.getRequestDispatcher("ResidentProfile1.jsp");
			request.setAttribute("resident", resident);
			
			dispatcher.forward(request, response);
		}	//else {
				//RequestDispatcher dispatcher = request.getRequestDispatcher("SecretaryHome.jsp");
				//out.println("<body bgcolor=white text=#CODO22><h3>invalid credentials</h3></body>");
				//RequestDispatcher dispatcher=request.getRequestDispatcher("ResidentLogin.jsp");
					//	dispatcher.include(request, response);		
				//response.sendRedirect("SecretaryHome.jsp");
			//}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
