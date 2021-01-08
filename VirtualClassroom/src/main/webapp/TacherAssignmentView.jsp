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
.n:hover{

/*background:rgb(0,0,255,0.3);*/
	cursor:pointer;
}

.scrollable
{
height:78vh;
overflow-y: scroll;
position: sticky;


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
<%!String id;String auth;String author;String title;int totalStudent;//int i; String com;String dt;%>
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
		
		
		
		
		
		 <!--count total student-->
		<%
			String sql ="SELECT count(sname) as totalStudent FROM `student_class` WHERE scode=?" ;
			
			
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
							
			
						<% totalStudent=Integer.parseInt(r.getString("totalStudent"));%>
				
					<% 
						}
					%>
		<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
					
		
		
		<!-- end of count total student -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- container-fluid for  nav bar -->
		
<div class="conatainer-fluid ">
		<!-- creation of fixed nav bar -->
		<div class="row">
			<nav class="navbar  navbar-expand navbar-light bg-white border-bottom fixed-top  " style="font-family: sans-serif; font-size: 14px; font-weight: 600;height:66px;">
			
			<div class="col-lg-2  col-md-1  d-none d-sm-none d-md-block d-lg-block">
				<div  class="navbar-brand ">
					
				<%=classname %>
					
				</div>
			</div>
			<div class="offset-lg-3 offset-0 col-lg-7 col-6 col-sm-10 offset-sm-2 col-md-8 offset-md-2 ">
				<nav class="navbar-nav ml-1 ml-sm-5 ml-md-5 " >
					<a class="nav-link nav-item n"  href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Instruction</a>&nbsp&nbsp
					<a class="nav-link nav-item n" href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>">Student work</a>&nbsp&nbsp
					
				
				</nav>
			</div>
			
			</nav>
		</div>
		
		<!-- end of nav bar -->
	</div>
	<!-- end of container-fluid -->
	
	
<form  method="post">
<!-- second container-fluid --> 
	<div class="container-fluid" style="margin-top:83px;">
		<div class="row border-bottom pb-3">
			<div class="col-1 offset-1 ">
			
				
			</div>
			
			<div class="col-lg-1 col-md-4 col-sm-4 col-5 offset-lg-1 offset-md-4 offset-sm-4 offset-4 ">
				<div class="input-group">
		    	
		    		<input type="text"  name="points" value="10 points" class="form-control  w-25" id="exampleInputPassword1" style=" resize:none;overflow:hidden;outline:none;border-bottom:1px solid black; border:none;box-shadow: none!important;border-radius:0px;">
		    		<div class="bar "></div>
	  			</div>
			</div>
			
		</div>
	</div>
<!-- end of second container-fluid -->

<!-- third container-fluid  -->
<div class="container-fluid">
	<div class="row">
	<!-- 1st col -->
	
	
	<div class="col-lg-3 col-md-12 col-sm-12 col-12 scrollable " style=" ">
	
	
	
	
	
	 <!--count total student-->
		<%
			String sql2 ="SELECT t1.sname FROM student_class t1 LEFT JOIN student_assignment_upload t2 ON (SELECT t2.sid  where  assign_id=?) = t1.id WHERE (SELECT t2.sid  where  assign_id=?) IS NULL and scode=?" ;
			
			
				try {
			

			Connection con= dbconn.Connection();
			
			PreparedStatement s=con.prepareStatement(sql2);
			
			s.setString(1,id);
			s.setString(2,id);
			s.setString(3,code);
			
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

		<div class="row mt-5 ">
 <div class="col-8 p-3 text-info">Missing</div>
		 
		<%
			while (r.next()) {
					
		%>
		
		
		 
		 
		<div class="col-8 pt-4 pb-4 border-bottom border-right border-top">
		<%=r.getString("sname") %>
		</div>
					<!-- first column student list -->		
		<div class="col-4 pt-4 border-bottom border-top text-danger pb-4">
		
    
    		Missing
   
  		
		</div>
					
				
					<% 
						}
					%>
					
			</div>
		<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
					
		
		
		<!-- end -->
	
	
	
	
	<!--count total student-->
		<%
			String sql9 ="SELECT * FROM student_assignment_upload left outer join student_marks on student_assignment_upload.id=student_marks.stu_assign_id  WHERE  classcode=? and assign_id=? ";
			
			
				try {
			

			Connection con9= dbconn.Connection();
			
			PreparedStatement s9=con9.prepareStatement(sql9);
			s9.setString(1,code);
			s9.setString(2,id);
			
			
			
			ResultSet r9=s9.executeQuery();
		

			if (!r9.isBeforeFirst()) {
		%>
		<div>
			<%
				out.print("");
			%>
		</div>


		<%
			}
		%>

		<div class="row mt-2 mb-2">
 <div class="col-8 p-3 text-info">Assigned</div>
		<%
			while (r9.next()) {
				
		%>
		
	<div class="col-7 p-3  border-bottom border-right border-top">
		<div class="text-center">
    		<a class="btn btn-light btn-block text-dark" value="<%=r9.getString("sid")%>" id="reply" name="<%out.println(r9.getString("id")); %>" class="link-reply bg-white" role="button" style=""><%=r9.getString("author") %></a>
  		</div>
	</div>
					<!-- first column student list 	-->	
		<div class="col-5 pt-3 border-bottom border-top">
			
			<div class="form-group">
    			
		
  		<div class="text-center">
    		<a class="btn btn-light btn-block text-dark" value="<%=r9.getString("sid")%>" id="reply1" name="<%out.println(r9.getString("id")); %>" class="link-reply bg-white" role="button" style=""><%=r9.getInt("marks") %></a>
  		</div>
  			
  			
  			</div>
		</div>
					
				
					<% 
						}
					%>
					
			</div>
		<%
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>	
					
		
		
		<!-- end -->
	
	
	
	
	
	
	
	

		
		
	
		
		
		
		
		</div>
		
	<!-- end of 1st col -->
	
	
	<!-- 2nd col -->
		<div class="col-lg-9 col-md-12 col-sm-12 col-12 scrollable ">
			
		
	        					<!-- count assigned with database -->
	        					
	        	 <%
			String quary2 = "SELECT count(assign_id) as assigned,count(stu_assign_id) as assigned1,title FROM student_assignment_upload left outer join student_marks on student_assignment_upload.id=student_marks.stu_assign_id WHERE student_assignment_upload.classcode=? and student_assignment_upload.assign_id=?";
			
			try {
			Connection con4= dbconn.Connection();
			
			//System.out.println("connected create teacher..");//connection

			PreparedStatement st4 = con4.prepareStatement(quary2);
			st4.setString(1, code);
			st4.setString(2, id);
			ResultSet rs4 = st4.executeQuery();

			if (!rs4.isBeforeFirst()) {
	%>
		<div>
		
		<%
				out.print("");
		%>
		</div>
		
		
		
		<%} %>
		
		<div class="row" style="font-size:27px;font-weight: 550;">
			<p class="ml-3"><%=title %></p>
		</div>
		<% 
		
		while (rs4.next()) {
		// id=rs3.getString("id") ;
		//
		
		title=rs4.getString("title") ;
		int assigned=Integer.parseInt(rs4.getString("assigned"));
		int assigned1=Integer.parseInt(rs4.getString("assigned1"));
		
		%>				
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        					
	        
	        					
	        					
	        					
	        			<div class="row ml-2 ">		
	        					
	        					
	        						<div class="col-lg-1 col-md-1 col-3 col-sm-3 border-right p-1 ml-1">
	        						
	        							<div class="row">
	        							<div class="col-12">
	        							<p class=" text-dark"  style="font-size:37px;font-weight: 550;"><%=assigned%></p>
	        							</div>
	        							</div>
	        							<div class="row">
	        							<div class="col-12">
	        								<p class=" text-muted"  style="font-size:12px;">Turned in</p>
	        							</div>
	        							</div>
	        							
	        						</div>
	        						
	        						
	        							<div class="col-lg-1 col-md-1 col-3  col-sm-3 border-right p-1 ml-1">
	        								
	        								<div class="row">
	        								<div class="col-12">
	        									<p class=" text-dark"  style="font-size:37px;font-weight: 550;"><%=assigned1%></p>
	        								</div>
	        								</div>
	        								<div class="row">
	        								<div class="col-12">
	        									<p class="text-muted" style="font-size:12px;">Marked</p>
	        								</div>
	        								</div>
	        								
	        							</div>
	        							
	        							
	        							<div class="col-lg-1 col-md-1 col-3 col-sm-3 p-1 ml-1">
	        								
	        								<div class="row">
	        								<div class="col-12">
	        									<p class=" text-dark"  style="font-size:37px;font-weight: 550;"><%=(totalStudent-assigned)%></p>
	        								</div>
	        								</div>
	        								<div class="row">
	        								<div class="col-12">
	        									<p class=" text-muted" style="font-size:12px;">Missing</p>
	        								</div>
	        								</div>
	        								
	        							</div>
	        						
	        					</div>
	        					
	        					<%} %>		
	        							
	        							

		
		<%
			rs4.close();
			st4.close();
			con4.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
					
%>	
	        						
	        						
	        						
	        						
	        						
	        						
	        						
	        						
	        						
	        						
	   <!-- row for view student uploaded file -->     						
	        						
	<div class="row boder">        	
	
		        						<!-- get student missing assignment from database -->
	        							
	      <%
			String quary7 = "SELECT * FROM student_class t1 LEFT JOIN student_assignment_upload t2 ON (SELECT t2.author  where  assign_id=?) = t1.sname WHERE (SELECT t2.author  where  assign_id=?) IS NULL and scode=?" ;
			
			try {
			Connection con7= dbconn.Connection();
			
			System.out.println("connected create teacher..");//connection

			PreparedStatement st7 = con7.prepareStatement(quary7);
			
			st7.setString(1, id);
			st7.setString(2, id);
			st7.setString(3, code);
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
		// id=rs3.getString("id") ;
		title=rs7.getString("title") ;
		
		%>
		
	        							
    						 		
    						 	
    						 	<% //if(rs7.getBlob("student_file").length()!=0){	%>
    					<div class="col-6 col-lg-3 col-md-3 col-sm-6  ">	
							<a href="view_file.jsp"
								style="" class="text-decoration-none text-dark">

								<div class="card mt-3 p-2  border-0 text-truncate" style="background:#f7f7f7;height:32vh; border-radius: 0px;">
								
						<div class="row">
							<div class="col-2 ">
								<span class=" fa fa-user-circle fa-2x float-left " style="color:gray;" aria-hidden="true"></span>
							</div>
							<div class="col-9 ">
								<span class="text-gray  " style="margin-left:1px;" ><% out.println(rs7.getString("sname"));%></span>
							</div>
						</div>
								
								
								
									<i
										class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1 mt-2"
										style=""></i>
									<div class=" text-center text-muted mt-2">
										No attachments
											<%
												//out.println(rs7.getString("student_file_name"));
											%>
										

									</div>
									<div class="text-danger ml-1">Missing</div>
								</div>

							</a>
						
	        			</div>	
	        					<%//} %>		
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
	    <!-- end of missing file -->    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
							
	        						<!-- get student upload assignment from database -->
	        							
	      <%
			String quary1 = "SELECT * FROM student_assignment_upload WHERE  classcode=? and assign_id=? ";
			
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
		
	        							
    						 		
    						 	
    						 	<% if(rs3.getBlob("student_file").length()!=0){	%>
    					<div class="col-6 col-lg-3 col-md-3 col-sm-6  " style="">	
							<a href="view_file.jsp?id=<%out.println(id);%>"
								style="" class="text-decoration-none text-dark">

								<div class="card mt-3 p-2  border-0 " style="background:#f7f7f7;height:32vh; border-radius: 0px;">
						<div class="row">
							<div class="col-2 ">
								<span class=" fa fa-user-circle fa-2x float-left " style="color:gray;" aria-hidden="true"></span>
							</div>
							<div class="col-8 ">
								<span class="text-gray  " style="margin-left:1px;" ><% out.println(rs3.getString("author"));%></span>
							</div>
						</div>
								
								
								
								
									<i
										class=" text-decoration-none fa fa-file-pdf-o fa-4x  border p-1 mt-2"
										style=""></i>
									<div class=" text-truncate text-center text-dark mt-2 ">
										
											<%
												out.println(rs3.getString("student_file_name"));
											%>
										

									</div>
									<div class="text-success ml-1">Handed in</div>
								</div>

							</a>
						
	        			</div>	
	        					<%} %>		
	        							
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
	    <!-- end of uploaded file -->    							
	        							
</div>
	        					
	  <!-- end -->      					
	        				
		
		
		
		</div>
	
	
	
	
	
	
	</div>
	
	
	
	
	
	
	</div>
	
	
	</form>
	
	
	
	
	
	
	
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
	
//this is for put student marks and private comment
	$("a#reply").one("click",function() {
		                                                                                          
		var comCode = $(this).attr("name");
		var parent = $(this).parent();
		var author=$(this).attr("value");
		var data = "<br> <form action='AssignmentMarksServlet' method='post' id='comment'> <div class='input-group input-group-sm rounded-lg '> <input type=number class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='marks' id='new-reply1'  ><input type='hidden' name='stuAssignId' value='"+comCode+"'><input type='hidden' name='stuId' value='"+author+"'><div class='input-group-append' id='button-addon3'><input type='submit' disabled class='btn btn-primary' id='reply-btn1' value='Return'  style='box-shadow:none;!important'></div></div></form>";
		var data1 = "<br> <form action='TeacherAssignmentPrivateCommentServlet' method='post' id='comment'> <div class='input-group input-group-sm rounded-lg '> <textarea class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='privateComment' id='new-reply' rows='2' ></textarea><input type='hidden' name='stuAssignId' value='"+comCode+"'><input type='hidden' name='stuId' value='"+author+"'><div class='input-group-append' id='button-addon3'><input type='submit' disabled class='btn btn-primary'  id='reply-btn' value='Private Comment'  style='box-shadow:none;!important'></div></div></form>";

		parent.append(data1);
		parent.append(data);
												
												
	    alert(comCode+author);

		//auto increasing of textarea for private comment
		$("#new-reply").on("keyup input",function(){
			
			
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
		
		//auto increasing of textarea for marks
		$("#new-reply1").on("keyup input",function(){
			
			
			var empty1=false;
			$(this).css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

			$("#new-reply1").each(function(){
			if($(this).val()=='')
				{
			
					empty1=true;
				}
			});
			if(empty1)
				{
					$('#reply-btn1').attr('disabled', 'disabled');
				}
			else{
				$('#reply-btn1').removeAttr('disabled');
				}
			
			});							
				
});
	
	
	
	
	//this is for update student marks

	
	$("a#reply1").one("click",function() {
        
		var comCode = $(this).attr("name");
		var parent = $(this).parent();
		var author=$(this).attr("value");
		var data = "<br> <form action='AssignmentMarksUpdateServlet' method='post' id='comment'> <div class='input-group input-group-sm rounded-lg '> <textarea class='form-control ' aria-label='Example text with two button addons' aria-describedby='button-addon3'  style='resize:none;overflow:hidden;box-shadow:none;!important'  name='marks' id='new-reply1' rows='2'></textarea><input type='hidden' name='stuAssignId' value='"+comCode+"'><input type='hidden' name='stuId' value='"+author+"'><div class='input-group-append' id='button-addon3'><input type='submit' disabled class='btn btn-primary' id='reply-btn1' value='Change'  style='box-shadow:none;!important'></div></div></form>";
				
		parent.append(data);
												
												
	    alert(comCode+author);

	
		
		//auto increasing of textarea for marks
		$("#new-reply1").on("keyup input",function(){
			
			
			var empty1=false;
			$(this).css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

			$("#new-reply1").each(function(){
			if($(this).val()=='')
				{
			
					empty1=true;
				}
			});
			if(empty1)
				{
					$('#reply-btn1').attr('disabled', 'disabled');
				}
			else{
				$('#reply-btn1').removeAttr('disabled');
				}
			
			});							
				
});
	
	
});




</script>

</html>