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
	
<style>
.com:hover{
	background:#f7f7f7;
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
<%!int sid;String aid;String id;String author;String title;//int i; String com;String dt;%>

	<% 
		Db_Connection  dbconn=new Db_Connection ();
		author=request.getParameter("author");
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		String mailId=request.getParameter("mailId");
		
		session.setAttribute("mailId", mailId);
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in StudentAssignmentView.jsp:" + code);
		%>
		
<!-- get student id from student_class -->
<%
			String quary9 = "select id from student_class where scode=? and smailid=?";
			
			try {
			Connection con9= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st9 = con9.prepareStatement(quary9);
			st9.setString(1, code);
			st9.setString(2, mailId);
			ResultSet rs9 = st9.executeQuery();

			if (!rs9.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		
		<% 
		
		while (rs9.next()) {
		 sid=rs9.getInt("id") ;
		 System.out.println("student_id"+sid);
		}
		
		%>

		<%
			rs9.close();
			st9.close();
			con9.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>



<!-- end of getting student id from student_class -->
		
		
		
		
		
		
		
		
		
		<%id=request.getParameter("id") ;%>
<div class="conatainer-fluid">
		<!-- creation of fixed nav bar -->
		<div class="row">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 19px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-2 col-12 float-left ">
				<div  class="navbar-brand ">
					
				<%=classname %>
		
					
				</div>
			</div>
			
			
			</nav>
		</div>
		
		<!-- end of nav bar -->
	</div>

<div class="container pl-2" style="margin-top:83px;">

<div class="row">
	<div class="col-lg-9 col-md-12 col-sm-12 col-12  ">
	
	 
					<!-- assignment -->
		<%
			String quary1 = "select * from assignment where classcode=? and id=?";
			
			try {
			Connection con3= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st3 = con3.prepareStatement(quary1);
			st3.setString(1, code);
			st3.setString(2, id);
			ResultSet rs3 = st3.executeQuery();

			if (!rs3.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		
		<% 
		
		while (rs3.next()) {
		// id=rs3.getString("id") ;
		title=rs3.getString("title") ;
		
		%>
		
				<!-- first row of left side -->
    				<div class="row  ">
      				<div class="col-12 pl-1">
        				<span class="float-left ml-1 border  rounded-circle pl-2 pr-2 pt-1 pb-1 bg-primary text-light d-md-block d-none" style="height:43px;">  <svg width="27px" height="2em" viewBox="0 0 16 16" class="bi bi-menu-down " fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M15 13V4a1 1 0 0 0-1-1h-3.586A2 2 0 0 1 9 2.414l-1-1-1 1A2 2 0 0 1 5.586 3H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM2 2a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2h-3.586a1 1 0 0 1-.707-.293L8.354.354a.5.5 0 0 0-.708 0L6.293 1.707A1 1 0 0 1 5.586 2H2z"/>
  								<path fill-rule="evenodd" d="M15 11H1v-1h14v1zm0-4H1V6h14v1zM2 12.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5z"/>
							</svg>
						</span>
						
       	 				<span class="float-left">
       	 				<div class="text-primary ml-3 mt-2" style="line-height:21px;font-family: sans-serif;font-size:39px;">
       	 					 <%=rs3.getString("title") %> 
       	 				</div>
       	 				
       	 				<div class="text-muted ml-3 mt-1" style="line-height:21px;font-family: sans-serif;font-size:13px;">
       	 				
       	 					<%=rs3.getString("author") %> <span style="font-family: sans-serif;font-size:39px;">. </span><%=rs3.getDate("date").toLocaleString().subSequence(0, 7) %> 
       	 					<%//rs3.getString("due_time") %>
       	 				</div>
       	 				
       	 				</span>
       	 				</div>
       	 				</div>
       	 				
       	 				
				<!-- end -->
       	 		
				<!-- second row of left side -->		
       	 				
       	 				<div class="row  " style="font-family: sans-serif;font-size:15px;">
       	 				<div class="col-12 pl-3 text-muted  ">
       	 				<%=rs3.getString("instruction") %>
       	 				</div>
       	 				</div>
       	 			
				<!-- end -->	
				
				
				<!-- third row of left side -->
				
       	 				<div class="row  " style="font-family: sans-serif;font-size:15px;">
       	 				<div class="col-12 col-lg-5 col-md-12 pl-3  text-muted">
       	 				<% if(rs3.getBlob("assign_file").length()!=0){
    						 		
    						 	if(rs3.getString("assign_file_name").endsWith("pdf")){
    						 	%>
    						 	
							<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3  border rounded ">
									<i
										class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs3.getString("assign_file_name"));
											%><br>
										pdf

									</div>
								</div>

							</a>
						
							<%
    						 	}
    						 	else if(rs3.getString("assign_file_name").endsWith("docx") || rs3.getString("assign_file_name").endsWith("doc"))
    						 	
    						 	{%>
    						 	
    						 	<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3  border rounded ">
									<i
										class=" text-decoration-none fa fa-file-text fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs3.getString("assign_file_name"));
											%><br>
										docx

									</div>
								</div>

							</a>
							
							<%}else if(rs3.getString("assign_file_name").endsWith("txt")) {%>
    						 	
    						 	<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3  border rounded ">
									<i
										class=" text-decoration-none fa fa-file-text-o fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs3.getString("assign_file_name"));
											%>
										

									</div>
								</div>

							</a>
							<%} %>
    						<%  	} %>
    						</div>
       	 				</div>
       	 				
       	 				<%
		
}
%>
		
		<%
			rs3.close();
			st3.close();
			con3.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>
				
					<!-- end of assignment -->	
				<!-- end -->
				
       	 		
       	 				<div class="row">
       					<div class="col-12 pl-3 mt-3 text-muted">
       					
       					
       					
       					<!-- start -->
<%! int count;%>       							
					<!-- assignment comment-->
		<%
			String quary3 = "SELECT * FROM student_assignment_reply WHERE assign_classcode=? and assign_id=? ";
			
			try {
			Connection con5= dbconn.Connection();
			
			//System.out.println("connected create teacher..");//connection

			PreparedStatement st5 = con5.prepareStatement(quary3);
			st5.setString(1, code);
			st5.setString(2, id);
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
	count=0;
		while (rs5.next()) {
		//id=rs5.getString("id") ;
		title=rs5.getString("title") ;
		
		%>
				
				
				
				
				
				
				
       	 				<!-- comment show section -->
       	 				
       	 				<div class="row">
       	 				
       	 				<div class="col-lg-9 col-md-12 col-sm-12 col-12 mt-2 ">
       	 						<div class="child collapse" id="collapseExample<%=id %>" > 
								
    								<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
    								<span class="text-left">
    			
    								<div   style="line-height:16px;margin-left:45px;font-size: 13px;"><%=rs5.getString("author")%> &nbsp<%out.println(rs5.getDate("date").toLocaleString().subSequence(0, 7)); %></div>
    								<div  style="line-height:35px;margin-left:45px;"><%out.println(rs5.getString("asign_comment")); %>   </div>
    								</span>
    								
    							</div>
    							<%count++; %>
       	 				</div>
       	 				</div>
       	 				
		<%
		
}
%>
					<div class=" border-0 " style="">
						<a class=" btn btn-white  ml-3 mb-2 collapsed com "  data-toggle="collapse" href="#collapseExample<%=id%>" aria-expanded="false" aria-controls="collapseExample<%=id %>" style="box-shadow:none;" role="button"   name="<%out.println(id);%>"> <span class="card-text" style="margin:0;"><%out.println(count);%>class comment</span></a>
					</div>  
		<!--  <span style="font-size: 16px; font-weight: 550;">Class comments</span>-->
		<%
			rs5.close();
			st5.close();
			con5.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				
       	 				<!-- end -->
       					
       					
       					
       					
       					
       					
       					
       					
       					
       					
	       	 				<form action='StudentAssignmentReplyServlet' method='post' id='comment'>
		       	 				 <div class='input-group input-group-sm rounded-lg mt-3 '> 
		       	 				 <textarea class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='assign_comment' id='new-reply' rows='2' ></textarea>
		       	 				 <input type='hidden' name='id' value='<%=id%>'>
		       	 				 <input type='hidden' name='author' value='<%=author%>'>
		       	 				 <input type='hidden' name='title' value='<%=title%>'>
		       	 				  <input type='hidden' name='code' value='<%=code%>'>
		       	 				 <div class='input-group-append' id='button-addon3'>
		       	 				 <input type='submit' class='btn btn-primary'  id='reply-btn' value='Send'  style='box-shadow:none;!important'>
		       	 				 </div>
		       	 				 </div>
	       	 				 </form>
       	 				</div>
       	 				</div>
       	 				
       	 				
		
				
					
	
	</div>








	<div class="col-lg-3 col-md-12 col-sm-12 col-12  mt-2 mt-lg-0">
	
	
	<form method="post" id="assign" enctype="multipart/form-data">
	
	<!-- first row of right side -->
	
	<div class="row">
	<div class=" col-sm-12 col-12">
	<div class="card p-3" style="height: 100%;border-radius: 8px; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);" >
	
	<span style="font-size: 26px;">Your work</span>
	
	
	
	<!-- uploaded student assignment -->
	
	
	<%
			String quary2 = "select * from student_assignment_upload where author=? and assign_id=? and classcode=? ";
			
			try {
			Connection con4= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st4 = con4.prepareStatement(quary2);
			st4.setString(1, author);
			st4.setString(2, id);
			st4.setString(3,code);
			ResultSet rs4 = st4.executeQuery();

			if (!rs4.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		
		<% 
		
		while (rs4.next()) {
		aid=rs4.getString("id") ;
		System.out.println("aid"+aid);
		title=rs4.getString("title") ;
		
		%>
	  <div class="row">
	<div class="col-12 pl-3  text-muted">
       	 				<% if(rs4.getBlob("student_file").length()!=0){
    						 		
    						 	if(rs4.getString("student_file_name").endsWith("pdf")){
    						 	%>
    						 <span class="text-muted" style="font-size: 13px; font-weight: 550;">Turned in</span>
							<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-100 border rounded ">
									<i
										class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs4.getString("student_file_name"));
											%><br>
										pdf

									</div>
								</div>

							</a>
						
							<%
    						 	}
    						 	else if(rs4.getString("student_file_name").endsWith("docx") || rs4.getString("student_file_name").endsWith("doc"))
    						 	
    						 	{%>
    						 <span class="text-muted" style="font-size: 13px; font-weight: 550;">Turned in</span>
    						 	<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-100 border rounded ">
									<i
										class=" text-decoration-none fa fa-file-text fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs4.getString("student_file_name"));
											%><br>
										docx

									</div>
								</div>

							</a>
							
							<%}else if(rs4.getString("student_file_name").endsWith("txt")) {%>
    						 	<span class="text-muted" style="font-size: 13px; font-weight: 550;">Turned in</span>
    						 	<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="media mt-3 w-100 border rounded ">
									<i
										class=" text-decoration-none fa fa-file-text-o fa-4x  border p-1"
										style=""></i>
									<div class="media-body text-truncate mt-3 ml-3">
										
											<%
												out.println(rs4.getString("student_file_name"));
											%>
										

									</div>
								</div>

							</a>
							<%} %>
    						<%  	} %>
    						</div>
	
	</div>
	
	<%
		
}
%>
		
		<%
			rs4.close();
			st4.close();
			con4.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>
	
	<!-- end -->
	
	
	
	
	
	
	
	
	
	
	
		<div class="custom-file mt-2">
		  <input type="file" class="custom-file-input" id="customFile" name="file_uploaded" style="box-shadow:none;">
		  <label class="custom-file-label pb-3" for="customFile" style="font-size: 15px; ">
			  <svg width="2em" height="20px" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  	<path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			 </svg>
			 Add or create
		  </label>
		</div>
	
	
		<input type="hidden" name="authorName" value="<%=author %>">
	
		<input type="hidden" name="id" value="<%=id%>">
	
		<input type="hidden" name="title" value="<%=title%>">
		
		<input type="hidden" name="sid" value="<%=sid%>">
		
		
	
	 	<button type="button" id="btnUpload" class="btn btn-primary btn-md btn-block mt-3" onclick="servletCall('post')" style="box-shadow:none;">Mark as done</button>
	</div>
	
	</div>
	</div>
	</form>
	<!-- end -->
	
	
	
<!-- second row of right side -->
<form  action="StudentAssignmentPrivateCommentServlet" method="post" id="privateComment" >
	<div class="row">
	<div class="col-12 mt-2 mt-md-4 mb-3">
	<div class="card" style="border-radius: 8px;box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2); overflow:hidden;">
	

				
				
<%!int count2;%>
	<!-- fetch teacher private comment and place it into card body -->
	<%
			String quary7 = "select teacher_private_comment.private_comment,teacher_private_comment.date,teacher_private_comment.time,assignment.author  from teacher_private_comment inner join student_assignment_upload on stu_assign_id=student_assignment_upload.id inner join assignment on assignment.id=student_assignment_upload.assign_id where assign_id=? and student_assignment_upload.classcode=? and stu_assign_id=?";
			
			try {
			Connection con7= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st7 = con7.prepareStatement(quary7);
			//st7.setString(1, author);
			st7.setString(1, id);
			st7.setString(2,code);
			st7.setString(3,aid);
			ResultSet rs7= st7.executeQuery();

			if (!rs7.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		
		<% 
		count2=0;
		while (rs7.next()) {
		//id=rs4.getString("id") ;
		//title=rs7.getString("title") ;
	
		%>
	<div class="card-header bg-white pl-3 pt-2 border-0" style="overflow:hidden;">	
				
       	 						<div class="child  collapsee mt-1" id="collapse-<%=aid%>" > 
								
    								<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
    								<span class="text-left">
    			
    								<div   style="line-height:16px;margin-left:45px;font-size: 13px;"><%=rs7.getString("author")%> &nbsp<%out.println(rs7.getDate("date").toLocaleString().subSequence(0, 7)); %></div>
    								<div  style="line-height:33px;margin-left:45px;"><%out.println(rs7.getString("private_comment")); %>   </div>
    								</span>
    								
    							</div>
    							<%count2++; %>
    							
       	 				
	
	</div>	
<%
}
%>
		
		<%
			rs7.close();
			st7.close();
			con7.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>
				<!-- end of teacher private comment -->				
				
				
			<%!int count1; %>
	<!-- fetch student private comment and place it into card body -->
	<%
			String quary5 = "select * from student_assignment_private_comment where author=? and private_id=? and private_classcode=? ";
			
			try {
			Connection con6= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st6 = con6.prepareStatement(quary5);
			st6.setString(1, author);
			st6.setString(2, id);
			st6.setString(3,code);
			ResultSet rs6= st6.executeQuery();

			if (!rs6.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		
		<% 
		count1=0;
		while (rs6.next()) {
		//id=rs4.getString("id") ;
		title=rs6.getString("title") ;
	
		%>
	<div class="card-header bg-white pl-3 pt-2 border-0" style="overflow:hidden;">	
				
       	 						<div class="child  collapsee mt-1" id="collapse-<%=id%>" > 
								
    								<span class="fa fa-user-circle fa-2x float-left " style="line-height:40px;color:gray;" aria-hidden="true"></span>
    								<span class="text-left">
    			
    								<div   style="line-height:16px;margin-left:45px;font-size: 13px;"><%=rs6.getString("author")%> &nbsp<%out.println(rs6.getDate("date").toLocaleString().subSequence(0, 7)); %></div>
    								<div  style="line-height:33px;margin-left:45px;"><%out.println(rs6.getString("private_comment")); %>   </div>
    								</span>
    								
    							</div>
    							<%count1++; %>
    							
       	 				
	
	</div>	
<%
}
%>
		
		<%
			rs6.close();
			st6.close();
			con6.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>
				<!-- end of student private comment -->		
				
				
				
				
				
				
				
				
				
				
				
				
				
	<div class="card-footer p-3 bg-white" style="height: 100%;border-radius: 0px 0px 8px; overflow:hidden;" >
	
	<%if(count1>0 || count2>0){ %>
		<a class=" btn btn-white  ml-3 mb-2 collapsed com " data-toggle="collapse" href="#collapse-<%=id%>" aria-expanded="false" aria-controls="collapse-<%=id %>" style="box-shadow:none;" role="button"   name="<%out.println(id);%>"  > <span class="card-text" style="margin:0;"><%out.println(count1+count2);%>private comments</span></a>
		<%} else{%>
		<span style="font-size: 16px; font-weight: 550;">Private comments</span>
		<% }%>
		
		<div class="row mt-3">
			<div class="col-1">
			<span class="fa fa-user-circle fa-2x float-left " style="line-height:49px;color:gray;" aria-hidden="true"></span>
			</div>
			<div class="col-10 ">
			<div class='input-group input-group-sm rounded-lg ml-2 float-left'> 
			    <textarea class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='private-cmnt' id='new-reply' rows='2' ></textarea>
			    <input type="hidden" name="authorName" value="<%=author %>">
	
				<input type="hidden" name="id" value="<%=id%>">
	
				<input type="hidden" name="title" value="<%=title%>">
				
				<input type='hidden' name='code' value='<%=code%>'>
			     <div class='input-group-append' id='button-addon3'>
			       <input type='submit' class='btn btn-primary btn-block'  id='reply-btn' value='Send'  style='box-shadow:none;!important'>
			     </div>
		    </div>
		    </div>
	    </div>
	
	</div>
				
				
				
				
				
				
				
				
				
				
				
		
	
	
	
	
	
	
	
	
	
	</div><!-- card end -->
	
	</div>
	
	</div>
	</form>
	<!-- end -->
	
	
	
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
	
	<script type="text/javascript">

$(document).ready(function(){
	$('#btnUpload').attr('disabled',true);
	$('#customFile').change(function(){
		$('#btnUpload').attr('disabled',false);
		});

	
	$("textarea").on("keyup input",function(){
		
		
		var empty1=false;
		$(this).css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

		$("#new-reply").each(function(){
		if($(this).val()=='')
			{
		
				empty1=true;
			}
		});
		if(empty1)
			{
				$('#reply-btn').attr('disabled', 'disabled');
			}
		else{
			$('#reply-btn').removeAttr('disabled');
			}
		
		});								

				


	
});


function servletCall(methodType)
{
	
	
	//var textarea=document.forms["comment"]["msg"].value;
	//if(textarea=="")
		//{
			
		//document.getElementById("post_btn").disabled=true;
		//}
	//else{
		
	document.getElementById("assign").action="StudentAssignmentViewServlet";
	document.getElementById("assign").method=methodType;
	document.getElementById("assign").submit();
	//}
	
	
	}




	</script>
	
	
	
</html>