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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		
		HttpSession session=request.getSession();
		session.setAttribute("loggedUser", userName);
		
		
		response.setContentType("text/html");
		if(userName.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")){
			RequestDispatcher dispatcher=request.getRequestDispatcher("secretaryHome.jsp");	
				dispatcher.forward(request, response);
	    } if(userName.equalsIgnoreCase("security") && password.equalsIgnoreCase("security")){
			RequestDispatcher dispatcher=request.getRequestDispatcher("SecurityHome.jsp");	
			dispatcher.forward(request, response);
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
