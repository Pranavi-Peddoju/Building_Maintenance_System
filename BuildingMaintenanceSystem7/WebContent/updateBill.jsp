<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*"%>
<%@ page import = "com.ts.dbutility.DBConnection" %>
<%
    String flatNo = session.getAttribute("flatNo").toString();
    
    //String no = request.getParameter("flatNo").toString();
	double maintenance = Double.parseDouble(request.getParameter("maintenance"));
	double electricity = Double.parseDouble(request.getParameter("electricity"));
	double water = Double.parseDouble(request.getParameter("water"));
	 
	try(Connection conn = DBConnection.getConnection();){
	Statement st=null;
	st=conn.createStatement();
	st.executeUpdate("update Bills set maintenance = "+maintenance+",electricity = "+electricity+", water = "+water+" where flatNo = '"+flatNo+"'");
	response.getWriter().println("<h1>Bills are updated</h1>");
	response.sendRedirect("residentInfo.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>
