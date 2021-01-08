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
			
	String quary2="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=?" ;
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
		
<div class="container-fluid" style="margin-top:66px;">
<div class="row">
<div class="col-2 ">
	<div class="row border pt-5 pb-4 ">
		<div class="col-12">
			<p class="mt-2">Student Name</p>
		</div>
	</div>
	<div class="row border p-3">
		<div class="col-12">
			<p>Class Avarage</p>
		</div>
	</div>

	<% 
		
		while (rs4.next()) {
		System.out.println(rs4.getString("sname"));
		
	%>
	
		
		<div class="row" >
			<div class="col-12 border p-3">
				<span class="fa fa-user-circle fa-2x float-left " style="color:gray;line-height: 43px;" aria-hidden="true"></span>
				<div class=" p-2 mb-1 " style="margin-left:37px;">	
					<% 	out.println(rs4.getString("sname"));%>
				</div>
			</div>
		</div>
	<%
	}
	rs4.close();
	st4.close();
	con4.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
</div>		

<!-- end of first column -->


<!-- database for second column-->
<%
			
	String quary3="select * from assignment  where classcode=?" ;
	try {
	Connection con5= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st5 = con5.prepareStatement(quary3);
	st5.setString(1, code);
	
	ResultSet rs5 = st5.executeQuery();

	if (!rs5.isBeforeFirst()) {
	%>
		<div>
		
			<%
			out.print("");
			%>
		</div>
		
		
		
	<%} %>
		


	

	<% 
		
		while (rs5.next()) {
		System.out.println("title:"+rs5.getString("title"));
		assignId=rs5.getInt("id");
		System.out.println("assignId"+assignId);
	%>
	<div class="col-1  ">
		<div class="row border pt-4 pb-4">
			<div class="col-12 text-left text-muted">
				<%=rs5.getDate("date").toLocaleString().subSequence(0, 7) %>
			</div>
			<div class="col-12  text-primary text-left font-weight-bold">
				<%=rs5.getString("title") %>
			</div>
			
			<div class="col-8 offset-2 border-bottom"></div>
			
			<div class="col-12 text-muted text-left">
				out of <%=rs5.getString("points") %>
			</div>
		</div>
		
	
	
	<!-- database for second row-->
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
		<div>
		
			<%
			out.print("");
			%>
		</div>
		
		
		
	<%} %>
		


	

	<% 
		
		while (rs6.next()) {
		System.out.println("Avarage:"+rs6.getFloat("avarage"));
		
	%>
	
		<div class="row border pt-4 pb-4">
		<div class="col-12">
			<%=rs6.getFloat("avarage")%>
		</div>
		</div>
		
	
	<%
	}
	rs6.close();
	st6.close();
	con6.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
	<!-- database for second row-->
<%
			
	String quary5="select * from student_marks right outer join student_assignment_upload on student_marks.stu_assign_id=student_assignment_upload.id where assign_id=? and student_assignment_upload.classcode=?" ;
	//String quary5="select * from student_marks right outer join student_assignment_upload on student_marks.stu_assign_id=student_assignment_upload.id right join student_class on (select sname where student_class.scode=?)=student_assignment_upload.author where assign_id=? and student_assignment_upload.classcode=?";
			try {
	Connection con7= dbconn.Connection();
			
	//System.out.println("connected create teacher..");//connection

	PreparedStatement st7 = con7.prepareStatement(quary5);
	//st7.setString(1,code);
	st7.setInt(1,assignId);
	st7.setString(2,code);
	
	ResultSet rs7 = st7.executeQuery();

	if (!rs7.isBeforeFirst()) {
	%>
		<div>
		
			<%
			out.print("");
			%>
		</div>
		
	<%} %>	
		
	


	

	<% 
		
		while (rs7.next()) {
		System.out.println("marks:"+rs7.getFloat("marks"));
		//if(rs7.getFloat("marks")!=""){
	%>
	
		<%if(rs7.getFloat("marks")==0) {%>
	
		<div class="row border pt-4 pb-4">
		<div class="col-12">
			not marked
		</div>
		</div>
		<%}else if(rs7.getString("marks")==""){ %>
		<div class="row border pt-4 pb-4">
		<div class="col-12">
			not assigned
		</div>
		</div>
		
		<%}else{ %>
		<div class="row border pt-4 pb-4">
		<div class="col-12">
			<%=rs7.getFloat("marks")%>
		</div>
		</div>
		<%} %>
		
	
	<%
	}
	rs7.close();
	st7.close();
	con7.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>
	
	
	</div>
	
	
	
	
	<%
	}
	rs5.close();
	st5.close();
	con5.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
					
	%>







		
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