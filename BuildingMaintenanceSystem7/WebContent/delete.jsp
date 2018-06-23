<%@page import="java.sql.*" %> 
<%@page import="com.ts.dbutility.DBConnection" %>
<%String flatNo = session.getAttribute("flatNo").toString();%>
<%try{
           //Class.forName("com.mysql.jdbc.Driver");
           //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
           Connection con = DBConnection.getConnection();
           Statement st=con.createStatement();
           int i=st.executeUpdate("delete from Residents where flatNo="+flatNo+"");
           //response.sendRedirect("SecretaryHome.jsp");
        response.getWriter().println("<h1>Resident Record deleted</h1>");
   		RequestDispatcher dispatcher=request.getRequestDispatcher("secretaryHome.jsp");
   		dispatcher.include(request, response);
}
catch (Exception e){
System.out.println(e);
}
%>