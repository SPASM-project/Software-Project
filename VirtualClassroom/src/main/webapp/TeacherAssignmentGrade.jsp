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
	


<title><%out.println(request.getParameter("classname"));%></title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<style>
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
<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("CreateTeacher.jsp");
	}
%>

<!-- declaration.... -->
<%!//int i; String com;String dt;%>
<%!String id;int assignId;String auth;String author;String title;int totalStudent;//int i; String com;String dt;%>
		<%id=request.getParameter("id") ;
		title=request.getParameter("title");
		auth=request.getParameter("author");
		%>
		<%
		Db_Connection  dbconn=new Db_Connection () ;//how to abstract dbConnection?
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		session.setAttribute("author", auth);
		session.setAttribute("id", id);
		session.setAttribute("title", title);
		
		System.out.println("classcode in People.jsp:" + code);
		%>
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
		
<div class="container-fluid">


<div class="row" style="margin-top:60px;">
<div class="table-responsive">
<table class="table table-hover table-striped table-bordered">

	
	<%
			
	String quary1="select * from assignment  where classcode=? order by id" ;
	try {
	Connection con1= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st1 = con1.prepareStatement(quary1);
	st1.setString(1, code);
	
	ResultSet rs1 = st1.executeQuery();

	if (!rs1.isBeforeFirst()) {
	%>
		
			<%
			out.print("");
			%>
		
		
	<%} %>
	
	
	<% 
				
		while (rs1.next()) {
			System.out.println("title2:"+rs1.getString("title"));
			assignId=rs1.getInt("id");
			System.out.println("assignId2"+assignId);
	%>
	<!-- --first -->
	<!-- database for  assignment fetch-->


		<thead class="" style="background-color:#5cb85c;">
		<tr>
			<th scope="col" class="text-light" style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:17px;font-weight: bold;font-style: italic;">Student Name</th>
			
	
      		
			<th scope="col" class="text-light" style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:17px;font-weight: bold;font-style: italic;">
				<p><%=rs1.getDate("date").toLocaleString().subSequence(0, 7) %></p>
				<p><%=rs1.getString("title") %>	</p>	
				<p>out of <%= rs1.getString("points") %></p>
			</th>
	
		</tr>
	</thead>
	
	
	
	
	
	<!-- -end first -->
	
	
	<tbody>
	<!-- --neww -->
	
	<%
			
	String quary4="select avg(marks) as avarage from student_marks inner join student_assignment_upload on student_marks.stu_assign_id=student_assignment_upload.id where assign_id=? and student_assignment_upload.classcode=?" ;
	try {
	Connection con6= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st6 = con6.prepareStatement(quary4);
	st6.setInt(1,assignId);
	st6.setString(2,code);
	
	ResultSet rs6 = st6.executeQuery();

	if (!rs6.isBeforeFirst()) {
	%>
			<%
			out.print("");
			%>
		
		
	<%} %>
		<% 
		
		while (rs6.next()) {
		System.out.println("Avarage:"+rs6.getFloat("avarage"));
		
	%>
	<tr class="table-info">
		
	<th scope="row"  style=" color: #27401F; font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:15px;font-weight: bold;font-style: italic;">Class Avarage</th>
	
	<td style="font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:17px;font-weight: bold;font-style: italic;"><%=rs6.getFloat("avarage")%></td>
			
	</tr>
	<%
	}
	rs6.close();
	st6.close();
	con6.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
	
	<!-- assignment marks -->
	
	
	
	
	<!-- -enddd nn -->
	
	<!-- -end -->
	<%
			
	//String quary5="select * from student_marks right outer join student_assignment_upload on student_marks.stu_assign_id=student_assignment_upload.id where assign_id=? and student_assignment_upload.classcode=?" ;
	//String quary5="select * from student_marks right outer join student_assignment_upload on student_marks.stu_assign_id=student_assignment_upload.id right join student_class on (select sname where student_class.scode=?)=student_assignment_upload.author where assign_id=? and student_assignment_upload.classcode=?";
	String quary5="select * from student_class left outer join student_assignment_upload on student_class.id=(select sid where assign_id=?) left outer join student_marks on stu_assign_id=(select student_assignment_upload.id where assign_id=?) where scode=? order by student_class.id";
			try {
	Connection con7= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st7 = con7.prepareStatement(quary5);
	st7.setInt(1,assignId);
	st7.setInt(2,assignId);
	st7.setString(3,code);
	
	ResultSet rs7 = st7.executeQuery();

	if (!rs7.isBeforeFirst()) {
	%>
		
		
			<%
			out.print("");
			%>
		
		
	<%} %>	
	
	<% 
		
		while (rs7.next()) {
		System.out.println("marks:"+rs7.getFloat("marks"));
		
		//if(rs7.getFloat("marks")!=""){
	%>
	
	
	<tr >
	    
	      	<th scope="row" style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:12px;font-weight: lighter;"><%=rs7.getString("sname") %></th>
			<%if(rs7.getString("marks")==null && rs7.getString("student_file_name")==null) {%>
			<td style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:12px;font-weight: lighter;"><p class="text-danger">Missing</p></td>
			<%}else if(rs7.getString("student_file_name")!=null && rs7.getString("marks")==null){ %>
			<td style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:12px;font-weight: lighter;"><p class="text-primary">Not Assigned</p></td>
			<%}else{ %>
			<td style=" font-family: sans-serif, Helvetica Neue, Lucida Grande, Arial;size:12px;font-weight: lighter;"><%=rs7.getFloat("marks")%></td>
			<%} %>
			
	</tr>
	
	<%
	}
	rs7.close();
	st7.close();
	con7.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
	</tbody>
	<%
	}
	rs1.close();
	st1.close();
	con1.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%> 
	
	
	
	
</table>
</div>
</div>	
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
</html>