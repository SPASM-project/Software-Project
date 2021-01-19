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
		Db_Connection  dbconn=new Db_Connection () ;
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		session.setAttribute("author", auth);
		session.setAttribute("id", id);
		session.setAttribute("title", title);
		
		System.out.println("classcode in People.jsp:" + code);
		%>
		
<div class="container-fluid">

<!-- creation of fixed nav bar -->
		<div class="row">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-1  d-none d-sm-none d-md-block d-lg-block">
				<div  class="navbar-brand ">
					
				<%=classname %>
					
				</div>
			</div>
			<div class="offset-lg-2 offset-0 col-lg-7 col-6 col-sm-10 offset-sm-2 col-md-8 offset-md-2 ">
				<nav class="navbar-nav ml-1 ml-sm-5 ml-md-5" >
					<a class="nav-link nav-item "  href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Stream</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Classwork</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="People.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">People</a>&nbsp&nbsp
					<a class="nav-link nav-item " href="TeacherAssignmentGrade.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Grades</a>
				
				</nav>
			</div>
			
			</nav>
		</div>
		
<!-- end of nav bar -->
</div>
<!-- end of first row -->
<!-- database for student class column-->






<%
			
	String quary2="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=? order by student_class.id" ;
	try {
	Connection con4= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st4 = con4.prepareStatement(quary2);
	st4.setString(1, code);
	
	ResultSet rs4 = st4.executeQuery();

	if (!rs4.isBeforeFirst()) {
	%>
		<div>
		
			<%
			out.print("");
			%>
		</div>
		
		
		
	<%} %>
		
<div class="table-responsive mt-3">
<table class="table table-bordered">

	
		<tr>	<p class="mt-2">Student Name</p></tr>
		
		
		<tr>	<p>Class Avarage</p></tr>
		
	<% 
		
		while (rs4.next()) {
		System.out.println(rs4.getString("sname"));
		
	%>
	
		
		<tr>
				<span class="fa fa-user-circle fa-2x float-left " style="color:gray;line-height: 43px;" aria-hidden="true"></span>
				<div class=" p-2 mb-1 " style="margin-left:37px;">	
					<% 	out.println(rs4.getString("sname"));%>
				</div>
		</tr>	
	<%
	}
	rs4.close();
	st4.close();
	con4.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
	

<!-- end of first column -->









		























</table>
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