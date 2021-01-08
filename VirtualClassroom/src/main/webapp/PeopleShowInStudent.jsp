<%@page import="com.SPASM.DAO.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="Custom CSS/CreateTeacher.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title><%
		out.println(request.getParameter("classname"));
	%></title>
</head>
<body>
<%!String code; %>
<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("CreateTeacher.jsp");
	}

	%>

<!-- declaration.... -->


	
		<%
			
		code = request.getParameter("code");
		String classname=request.getParameter("classname");
		String mailId=request.getParameter("mailId");
		
		session.setAttribute("mailId",mailId);
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in People.jsp:" + code);
		%>
			<!-- creationj of fixed nav bar -->
			
	<% Db_Connection  dbconn=new Db_Connection () ;%>
	
<div class="container-fluid">
<div class="container-fluid">
<!-- creation of fixed nav bar -->
		<div class="row">
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


<div class="container-fluid  p-1 p-sm-1 p-md-1 p-lg-4"  style="margin-top:96px;"> 
		<div class="row " >
			<div class="col-12 col-md-10 offset-0 offset-md-1 col-lg-6 offset-lg-3 " style="border-bottom:2px solid #5cb85c;">
				<h3 class="text-success">Teachers</h3>
			</div>
		</div>
		
		
		
	 <!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
		<%
			
			String sql1="SELECT * FROM `teacher` WHERE classcode=?";
			
				try {
			

			Connection con= dbconn.Connection();
			
			
			PreparedStatement s1=con.prepareStatement(sql1);
			
			s1.setString(1,code);
		
			ResultSet r1=s1.executeQuery();

			if (!r1.isBeforeFirst()) {
		%>
		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
		%>

		
		
			<%while(r1.next()){ %>
	
		<div class="row mt-3 text-muted">
			<div class="col-12 col-md-10 offset-0 offset-md-1 col-lg-6 offset-lg-3 ">
				<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
				<div class="   p-2 " style="margin-left:37px;">	
			
					
					<%
					System.out.println("before");
					
					out.println(r1.getString("name"));
					System.out.println(r1.getString("name"));
					%>
					
				</div>
			</div>
		</div>
		<%} %>
			
		
	
					
<%}catch(Exception e)
				{
	e.printStackTrace();
				}
%>

		<div class="row mt-4" >
			<div class="col-12 col-md-10 offset-0 offset-md-1 col-lg-6 offset-lg-3 " style="border-bottom:2px solid #5cb85c;">
				<h3 class="text-success">Student</h3>
			</div>
		</div>
 
	 <!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
		<%
			String sql ="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=?" ;
			
			
				try {
			

			Connection con= dbconn.Connection();
			
			PreparedStatement s=con.prepareStatement(sql);
			
			s.setString(1,code);
			
			ResultSet r=s.executeQuery();
		

			if (!r.isBeforeFirst()) {
		%>
		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
		%>

		

		<%
			while (r.next()) {
						
		%>
							
			<div class="row mt-3" >
				<div class="col-12 col-md-10 offset-0 offset-md-1 col-lg-6 offset-lg-3 border-bottom ">
					<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
					<div class=" p-2 mb-1 " style="margin-left:37px;">	
						<% 	out.println(r.getString("sname"));%>
					</div>
				</div>
			</div>
					<% 
						}
					%>
		<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
					
</div>
			
</div>	
</body>
</html>