<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
	
	.card:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
	
	}
	.cl
	{
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
	margin-top:9px;
	
	}
	.cf:hover{
	background:rgb(0,128,128,0.1);
	}
	.card-header:hover{
	background:rgb(0,0,255,0.1);
	cursor:pointer;
	}
</style>
	
<title><%out.println(request.getParameter("classname"));%></title>

</head>
<body>
<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("CreateTeacher.jsp");
	}
%>

<!-- declaration.... -->
<%!//int i; String com;String dt;%>

	
		<%
			
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		String mailId=request.getParameter("mailId");
		
		session.setAttribute("mailId", mailId);
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in People.jsp:" + code);
		%>

<div class="container-fluid">

<!-- creation of fixed nav bar -->
		<div class="row" style="margin-top:83px;">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-1  d-none d-sm-none d-md-block d-lg-block">
				<div  class="navbar-brand ">
					
				<%=classname %>
					
				</div>
			</div>
			<div class="offset-lg-3 offset-0 col-lg-9 col-6 col-sm-10 offset-sm-2 col-md-8 offset-md-2 ">
				<nav class="navbar-nav ml-1 ml-sm-5 ml-md-5" >
					<a class="nav-link nav-item "  href="CreateStudent.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>&mailId=<%=mailId%>">Stream</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="StudentAssignment.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>&mailId=<%=mailId%>">Classwork</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="PeopleShowInStudent.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>&mailId=<%=mailId%>">People</a>&nbsp&nbsp
					
				</nav>
			</div>
			
			
			</nav>
		</div>
		
<!-- end of nav bar -->
</div>
<!-- end of first row -->


<div class="container p-2">


<!-- end of 2nd row -->

  <!-- java code -->
  	<% Db_Connection  dbconn=new Db_Connection ();%>
		
		
	<!--database connectivity for select teacher class-->
	<%
			String quary = "select * from assignment where classcode=?";
			
			try {
			Connection con= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st = con.prepareStatement(quary);
			st.setString(1, code);
			ResultSet rs = st.executeQuery();

			if (!rs.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		<%} %>
		


<div class="row mt-3">	
	<div class="col-12 col-md-8 offset-md-2 ">  
<!--  <div class="card " style="">
	  	<div class="card-header " style="">
	  		<p id="title" class="text-dark ml-2" style="font-size:16px;"> </p>
	  	</div>
	  		
	  	
	  	
	 	<div class="card-body"> -->
	  		<!-- accordian -->
	  		
	  	
			
			
			<div class="accordion  " id="accordionExample" >
			
				<%
			
				while (rs.next()) {
		%>		<%String id=rs.getString("id") ;
		
		//if(rs.getString("topic")!=null)
		//{
		%>
		
 				<div class="card border-bottom" name="<%=rs.getString("id") %>" style="border-radius:8px;border:none;">
 				
    				<div class="card-header bg-white ch collapsed " data-toggle="collapse" data-target="#collapse-<%=rs.getString("id") %>" aria-expanded="false" aria-controls="collapse-<%=rs.getString("id") %>" style="height:65px;" id="heading-<%=rs.getString("id") %>">
      					<div class="">
        						<!--<button  class="btn btn-link text-dark" type="button" >
          						
       	 						</button> -->
       	 					 <span class="float-left ml-1 border rounded-circle pl-2 pr-2 pt-1 pb-1 bg-primary text-light" style="">  <svg width="27px" height="2em" viewBox="0 0 16 16" class="bi bi-menu-down " fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M15 13V4a1 1 0 0 0-1-1h-3.586A2 2 0 0 1 9 2.414l-1-1-1 1A2 2 0 0 1 5.586 3H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM2 2a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2h-3.586a1 1 0 0 1-.707-.293L8.354.354a.5.5 0 0 0-.708 0L6.293 1.707A1 1 0 0 1 5.586 2H2z"/>
  <path fill-rule="evenodd" d="M15 11H1v-1h14v1zm0-4H1V6h14v1zM2 12.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5z"/>
</svg></span>
       	 					<span class="text-dark float-left ml-4 mt-2" style="font-family: sans-serif;font-size:17px;font-weight: 550;"><%=rs.getString("title") %> </span>
       	 					<span class="text-muted float-right mt-2" style="font-family: sans-serif;font-size:13px;"><%=rs.getString("due_date") %> 
       	 					<%=rs.getString("due_time") %></span>
     	 				</div>
    				</div>
					
    				<div id="collapse-<%=rs.getString("id") %>" class="collapse" aria-labelledby="heading-<%=rs.getString("id") %>" data-parent="#accordionExample">
	      				<div class="card-body">
	        				
	        				<div class="row">
	        					<div class="col-12">
	        						<div class="ml-2 text-muted"  style="font-family: sans-serif;font-size:13px;"> Posted <%=rs.getDate("date").toLocaleString().subSequence(0, 7) %> </div>
	        					</div>
	        				</div>
	        				
	        				<div class="row ">
	        					<div class="col-12 ">
	        						<div class="ml-2 text-dark"  style="font-family: sans-serif;font-size:13px;"> <%=rs.getString("instruction") %> </div>
	        					</div>
	        					
	        					
	        				</div>
	        				<div class="row">
	        				 <div class="col-12">
	        				<% if(rs.getBlob("assign_file").length()!=0){
    						  	if(rs.getString("assign_file_name").endsWith("pdf")){
    						%>
    						 	
							<a href="view_file.jsp?id=<%=rs.getString("id") %>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
										<%=rs.getString("assign_file_name") %><br>
										pdf

									</div>
								</div>

							</a>
						
							<%
    						 	}
    						 	else if(rs.getString("assign_file_name").endsWith("docx")||rs.getString("assign_file_name").endsWith("doc"))
    						 	
    						 	{
    						 	%>
    						 	
    						 	<a href="view_file.jsp?id=<%rs.getString("id");%>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-text fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3 thumbnail">
										
									<%out.println(rs.getString("assign_file_name"));%><br>
										docx

									</div>
								</div>

								</a>
							
							<%}else if(rs.getString("assign_file_name").endsWith("txt")) {%>
    						 	
    						 	<a href="view_file.jsp?id=<%rs.getString("id");%>" style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-50 border rounded ">
									<i class=" text-decoration-none fa fa-file-text-o fa-4x  border p-1" style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
										<%out.println(rs.getString("assign_file_name"));%><br>
										txt

									</div>
								</div>

							 </a>
							<%} %>
    						<% } %>
    						</div>
    						</div>
	      				</div>
	      			
	      				<div class="card-footer bg-white  text-decoration-none ">
	      					<a href="StudentAssignmentView.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>&id=<%=id%>&mailId=<%=mailId%>" class="btn btn-white cf text-info" style="box-shadow: none;">view assignment</a>
	      				</div>
    				</div>
  				
  				</div>
  <%
		//}
}
rs.close();
st.close();
con.close();
} catch (Exception e) {
e.printStackTrace();
}
		
		
		%>
		
  			</div>
  			
			
			<!-- end of accordian -->



	<!-- 	</div> -->
		
			<!-- end of title card body -->
	<!--  </div>-->
	  
	  <!-- end of title card  -->
	  </div>
</div>

<!-- end of third row  -->	


</div>

</body>







<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<script>
		$(document).ready(function(){
			
		$(".card-header").click(function(){

			var idd=$(".card").attr("name");
			//alert(idd);
			$(".card").toggleClass("cl");
			$(".ch").css("color","blue");
			});



			});
		
		
		
		


</script>

</html>