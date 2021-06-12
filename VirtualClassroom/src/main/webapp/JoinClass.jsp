<%@page import="com.SPASM.DAO.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Join Class</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<%String mailid=request.getParameter("mail"); %>
<%
		if (request.getParameter("mail") == null) {
			
//if(session.getAttribute("classcode")==null){
	
		response.sendRedirect("StartingPage.jsp?mail="+session.getAttribute("mail"));
	}
	
	
	

Db_Connection  dbconn=new Db_Connection () ; 

%>
<%!String authorName; %>

<!-- get name of this mailid -->

<%
			String quary4 = "select * from registration where mailid=?";
			
			try {
			Connection con4= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st4 = con4.prepareStatement(quary4);
			st4.setString(1, mailid);
			ResultSet rs4 = st4.executeQuery();

			if (!rs4.isBeforeFirst()) {
				
			}
			if(rs4.next()){
				System.out.println(rs4.getString("name"));
				authorName=rs4.getString("name");
				System.out.println(authorName+" in join class page...");
			}
			rs4.close();
			st4.close();
			con4.close();
			}catch(Exception e){}
	%>

<!-- end -->


<div class="container-fluids">
<div class="row">
<div class=" p-4 col-lg-8 offset-lg-2 col-md-12  col-sm-12  col-12  border" style="margin-top:83px;font-size:20px;font-family:roboto;">


<form action="ServletStudent" name="joinclass" method="post">
		<h3 class="text-center text-primary">ClassRoom Joining</h3>
	
		<div class="form-group">
    		<label class="text-muted" for="exampleInputPassword1">Contact No</label>
    		<input type="text" name="contactno" class="form-control" id="exampleInputPassword1">
  		</div>
  	
  		
	
		<input type="hidden" value=<%=mailid %> name="mailid">
		<input type="hidden" name="sname" value="<%=authorName%>">
		
		<p class="text-dark font-weight-bold">ask you teacher for the class code,then enter it here</p>
		
		<div class="form-group">
    		<label  class="text-muted" for="exampleInputPassword1">Class Code</label>
    		<input type="text" name="classcode" class="form-control" id="exampleInputPassword1">
  		</div>
		
		
	
		<button type="submit" class="btn btn-primary">Join</button>	
		
		<p class="text-dark font-weight-bold">To sign in with a class code</p>
		<ul>
  <li class="text-dark font-weight-bold">Use an authorized account</li>
  <li class="text-dark font-weight-bold">Use a class code with 5-7 letters or numbers,and no spaces or symbols</li>
</ul>
<p class="text-dark font-weight-bold">If you have trouble joining the class,go to Help Center artical</p>
 </form>
 </div>
 </div>
</div>
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>