<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import = "com.ts.dbutility.DBConnection" %>
<%
String flatNo = session.getAttribute("flatNo").toString();
String userName = request.getParameter("userName");
String password = request.getParameter("password");
int familySize = Integer.parseInt(request.getParameter("familySize"));
String contactNo = request.getParameter("contactNo");
String email = request.getParameter("email");
String status = request.getParameter("status");
String occupation = request.getParameter("occupation");
String place = request.getParameter("place");
String ownerContactNo = request.getParameter("ownerContactNo");

try(Connection conn = DBConnection.getConnection();){
Statement st=null;
st=conn.createStatement();

st.executeUpdate("update Residents set userName='"+userName+"',familySize="+familySize+",contactNo='"+contactNo+"',email='"+email+"',status = '"+status+"',occupation = '"+occupation+"',place = '"+place+"',ownerContactNo = '"+ownerContactNo+"' where flatNo="+flatNo+"");
response.sendRedirect("residentInfo.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>