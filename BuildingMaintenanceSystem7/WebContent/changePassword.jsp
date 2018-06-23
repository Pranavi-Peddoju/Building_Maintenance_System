<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %> 
<%@page import="com.ts.dbutility.DBConnection" %>
<%String flatNo = session.getAttribute("flatNo").toString();
  String userName = request.getParameter("newPassword");
  String confirmPassword = request.getParameter("confirmPassword");
  System.out.println("" + userName + "," + confirmPassword +","+flatNo);
  if(userName.equals(confirmPassword)){
  try{
      //Class.forName("com.mysql.jdbc.Driver");
      //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
      Connection con = DBConnection.getConnection();
      Statement st=con.createStatement();
      int i=st.executeUpdate("update Residents set password='"+userName+"' where flatNo='"+flatNo+"'");
      
		response.sendRedirect("password.html");
}
catch (Exception e){
System.out.println(e);
}}
  %>
