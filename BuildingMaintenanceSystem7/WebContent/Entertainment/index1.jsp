<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    <%@ page import = "com.ts.dbutility.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>entertainment</title>
<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/full-slider.css" rel="stylesheet">
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" style="text-decoration:underline overline" href="#"><strong><b>ENTERTAINMENT</b></strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#theatre">Theatre</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#football">Football
                
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#badminton">Badminton</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#swimmingpool">SwimmingPool</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#gym">Gym</a>
            </li>
            <!-- <li class="nav-item">
              <a class="" href="../ResidentProfile1.jsp">Back</a>
            </li>-->
            
          </ul>
        </div>
      </div>
    </nav>

    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
          
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('swimmingpool.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>SwimmingPool</h3>
              <p></p>
            </div>
          </div>
         
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('badminton.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>BadmintonCourt</h3>
              <p></p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('football.gif')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FootballCourt</h3>
              <p></p>
            </div>
          </div>
       

         <div class="carousel-item" style="background-image: url('theatre.png')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Theatre</h3>
              <p></p>
            </div>
          </div>
       


        <div class="carousel-item" style="background-image: url('gym.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Gym</h3>
              <p></p>
            </div>
          </div>
        </div>



        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>
    <!--<script>
    function disable(int a,int b){
    	if(a == b){
    		document.getElementsById("tin").disabled = true;
    	}
    }
    </script>-->
    <%
    String flatNo1 = session.getAttribute("flatNo").toString();
    PreparedStatement pst1 = null;
    try(Connection conn = DBConnection.getConnection();) {
    final String QUERY1 = "select * from Amenities where activity='Theatre'";
    pst1 = conn.prepareStatement(QUERY1);
    ResultSet rs1 = pst1.executeQuery();
    while(rs1.next()){
    %>
    
    
    
    <div class="theatre" style="background-image:url('theatre1.jpg');background-position:center">
    <section id="theatre">
      <!--<div class="container">-->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading bg-dark text-white" >Theatre</h2>
            
          <!--</div>-->
        </div>
      </div>
      
      <div class="col-sm text-white">
     
        <center>
        
        <form action="../AmenitiesServlet"  method="POST"><center>
        <input type="text" name="name" placeholder="Participant Name"></input><br><br>
        <button id="tin" type="submit" class="btn btn-info" name="action" style="width:20%" value="TheatreInServlet">In</button><br><br>
        <button id="tib" type="submit" class="btn btn-info" name="action" style="width:20%" value="TheatreOutServlet">Out</button><br><br>
        <b>Total Capacity: <%= rs1.getInt(3) %></b><br>
        <b>Bookings made: <%= rs1.getInt(2) %></b>
        <br><br><br>
        <!--<input class="btn btn-primary  js-scroll-trigger" style="width:20%" type="submit" name="action" value="In" action="BadmintoninServlet"/><br><br>
        <input class="btn btn-primary  js-scroll-trigger" style="width:20%"type="submit" name="action" value="Out" action="BadmintonoutServlet"/><br><br><br><br><br><br>-->
        
        </form>
        </center>
        </div>
    </section>
    </div>
    <%}
    }catch(SQLException e){}
    %>

    <%
    String flatNo = session.getAttribute("flatNo").toString();
    PreparedStatement pst = null;
    try(Connection conn = DBConnection.getConnection();) {
    final String QUERY = "select * from Amenities where activity='Football'";
    pst = conn.prepareStatement(QUERY);
    ResultSet rs = pst.executeQuery();
    while(rs.next()){
    %>
    <div class="Football" style="background-image:url('football1.jpg');background-position:center;width:100%">
    <section id="football">
      <!--<div class="container">-->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading bg-dark text-white" >Football - Get the ball rolling!!!</h2>
          <!--</div>-->
        </div>
      </div>
      
      
      <div class="col-sm text-white">
     
        <center>
        
        <form action="../AmenitiesServlet"  method="POST"><center>
        <input type="text" name="name" placeholder="Participant Name"></input><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="FootballInServlet">In</button><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="FootballOutServlet">Out</button><br><br>
        <!-- <b class="bg-dark"><%= rs.getInt(2) %> out of <%= rs.getInt(3) %></b>-->
        <b class="bg-dark">Total Capacity: <%= rs.getInt(3) %></b><br>
        <b class="bg-dark">Bookings made: <%= rs.getInt(2) %></b>
        <br><br><br> 
        <!--<input class="btn btn-primary  js-scroll-trigger" style="width:20%" type="submit" name="action" value="FootballInServlet" /><br><br>
        <input class="btn btn-primary  js-scroll-trigger" style="width:20%"type="submit" name="action" value="FootballOutServlet" /><br><br><br><br><br><br>
        --></center>
        </form>
        </center>
        </div>
     </section>
    </div>
    <%}
    }catch(SQLException e){}
    %>
   
    





    <!-- Page Content -->
    

    <!-- Footer -->
    <%
    String flatNo2 = session.getAttribute("flatNo").toString();
    PreparedStatement pst2 = null;
    try(Connection conn = DBConnection.getConnection();) {
    final String QUERY2 = "select * from Amenities where activity='Badminton'";
    pst2 = conn.prepareStatement(QUERY2);
    ResultSet rs2 = pst2.executeQuery();
    while(rs2.next()){
    %>
    

    <div class="Badminton" style="background-image:url('badminton1.jpg');background-position:center">
    <section id="badminton">
      <!--<div class="container">-->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading bg-dark text-white" >Badminton - Let the RACKET do the talking!!</h2>
            <!-- <p class="text-white bg-dark">Let the RACKET do the talking!!</p>-->
          <!--</div>-->
        </div>
      </div>
      
      <div class="col-sm">
     
        <center>
        
        <form action="../AmenitiesServlet"  method="POST"><center>
        <input type="text" name="name" placeholder="Participant Name"></input><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="BadmintonInServlet">In</button><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="BadmintonOutServlet">Out</button><br><br>
        <!-- <b><%= rs2.getInt(2) %> out of <%= rs2.getInt(3) %></b>-->
        <!--<input class="btn btn-primary  js-scroll-trigger" style="width:20%" type="submit" name="action" value="In" action="BadmintoninServlet"/><br><br>
        <input class="btn btn-primary  js-scroll-trigger" style="width:20%"type="submit" name="action" value="Out" action="BadmintonoutServlet"/><br><br><br><br><br><br>-->
        <b>Total Capacity: <%= rs2.getInt(3) %></b><br>
        <b>Bookings made: <%= rs2.getInt(2) %></b>
        
        </form>
        </center>
        </div>
    </section>
    </div>
<%}
    }catch(SQLException e){}
    %>
    

    <%
    String flatNo3 = session.getAttribute("flatNo").toString();
    PreparedStatement pst3 = null;
    try(Connection conn = DBConnection.getConnection();) {
    final String QUERY3 = "select * from Amenities where activity='Swimmingpool'";
    pst3 = conn.prepareStatement(QUERY3);
    ResultSet rs3 = pst3.executeQuery();
    while(rs3.next()){
    %>
     <div class="Swimmingpool" style="background-image:url('swimmingpool1.jpg');background-position:center">
    <section id="swimmingpool">
      <!--<div class="container">-->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading bg-dark text-white">Swimming pool - Wanna turn heads? Make waves!</h2>
            <!-- <p class="text-white bg-dark">Wanna turn heads? Make waves!</p>-->
          <!--</div>-->
        </div>
      </div>
      
      <div class="col-sm">
     
        <center>
        
        <form action="../AmenitiesServlet"  method="POST"><center>
        <input type="text" name="name" placeholder="Participant Name"></input><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="SwimmingpoolInServlet">In</button><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="SwimmingpoolOutServlet">Out</button><br><br>
        <!-- <b><%= rs3.getInt(2) %> out of <%= rs3.getInt(3) %></center></b>-->
        <!--<input class="btn btn-primary  js-scroll-trigger" style="width:20%" type="submit" name="action" value="In" action="BadmintoninServlet"/><br><br>
        <input class="btn btn-primary  js-scroll-trigger" style="width:20%"type="submit" name="action" value="Out" action="BadmintonoutServlet"/><br><br><br><br><br><br>-->
        <b>Total Capacity: <%= rs3.getInt(3) %></b><br>
        <b>Bookings made: <%= rs3.getInt(2) %></b>
        </center>
        </form>
        </center>
        </div>
    </section>
    </div>
    <%}
    }catch(SQLException e){}
    %>


    <%
    String flatNo4 = session.getAttribute("flatNo").toString();
    PreparedStatement pst4 = null;
    try(Connection conn = DBConnection.getConnection();) {
    final String QUERY4 = "select * from Amenities where activity='Gym'";
    pst4 = conn.prepareStatement(QUERY4);
    ResultSet rs4 = pst4.executeQuery();
    while(rs4.next()){
    %>
    <div class="gym" style="background-image:url('gym1.jpeg');background-position:center">
    <section id="gym">
      <!--<div class="container">-->
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading bg-dark text-white" >Gym - Commit to be fit</h2>
            <!-- <p class="text-white bg-dark">Commit to be fit</p>-->
          <!--</div>-->
        </div>
      </div>
      
      <div class="col-sm text-white">
     
        <center>
        
        <form action="../AmenitiesServlet"  method="POST"><center>
        <input type="text" name="name" placeholder="Participant Name"></input><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="GymInServlet">In</button><br><br>
        <button type="submit" class="btn btn-info" name="action" style="width:20%" value="GymOutServlet">Out</button><br><br>
        <!--<b><%= rs4.getInt(2) %> out of <%= rs4.getInt(3) %></b>-->
        <!--<input class="btn btn-primary  js-scroll-trigger" style="width:20%" type="submit" name="action" value="In" action="BadmintoninServlet"/><br><br>
        <input class="btn btn-primary  js-scroll-trigger" style="width:20%"type="submit" name="action" value="Out" action="BadmintonoutServlet"/><br><br><br><br><br><br>-->
        <b>Total Capacity: <%= rs4.getInt(3) %></b><br>
        <b>Bookings made: <%= rs4.getInt(2) %></b>
        </form>
        </center>
        </div>
    </section>
    </div>
    <%}
    }catch(SQLException e){}
    %>
    
    



    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>


</html>