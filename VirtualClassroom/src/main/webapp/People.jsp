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
	<link rel="icon" type="image/x-icon" href="favicon.ico">
<style type="text/css">
@media (min-width: 768px) {
  .navbar-nav.navbar-center {
    position: absolute;
    left: 50%;
    transform: translatex(-50%);
  }
}
</style>
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
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in People.jsp:" + code);
		%>
			<!-- creationj of fixed nav bar -->
			
	<% Db_Connection  dbconn=new Db_Connection () ;%>
	
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top "  style="font-family: sans-serif; font-size: 14px; font-weight: 600;">

  <div class="navbar-header">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
</div>
  
  

  <div class="collapse navbar-collapse" id="navbarNavDropdown">

    <ul class="nav navbar-nav">
      <li><a class="navbar-brand" href="#">
          <i class="fa fa-graduation-cap text-primary" aria-hidden="true"></i>
        <%=classname%>
        </a></li>
  </ul>
    <ul class="nav navbar-nav navbar-center" >
      <li class="nav-item">
        <a class="nav-link" href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Stream</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Classwork</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="People.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">People</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="TeacherAssignmentGrade.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Grades</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Attendance
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AddAttendance.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Add Attendance</a>
		<a class="dropdown-item" href="AttendanceList.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Attendance List</a>
		   <a class="dropdown-item" href="AvarageAttendance.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Avarage Attendance</a>
        					<a class="dropdown-item" href="whiteboard.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>" >White Board</a>
					<a class="dropdown-item" href="Meeting.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>" >Create Meeting</a>
        </div>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right ml-auto">
       <li><a class="btn btn-light" href="StartingPage.jsp?mail=<%=session.getAttribute("mailid")%>"><i class="fa fa-2x fa-arrow-circle-left text-primary" aria-hidden="true"></i></a></li>
  </ul>
  </div>
</nav>


<div class="container-fluid  p-1 p-sm-1 p-md-1 p-lg-4"  style="margin-top:96px;"> 
		<div class="row " >
			<div class="col-12 col-md-10 offset-0 offset-md-1 col-lg-6 offset-lg-3 " style="border-bottom:2px solid #5cb85c;">
				<h3 class="text-success">Teachers</h3>
			</div>
		</div>
		
		
		
	 <!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
		<%
			
			String sql1="SELECT * FROM teacher WHERE classcode=?";
			
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
			
	
</body>
</html>