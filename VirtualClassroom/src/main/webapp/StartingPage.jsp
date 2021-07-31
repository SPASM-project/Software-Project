<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<!-- bootstrap and custom css link -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
   <title>e-Ducation</title>
   <link rel="icon" type="image/x-icon" href="favicon.ico">
   
    
  <link rel="stylesheet" href="Custom CSS/CreateTeacher.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  
  <style type="text/css">
  .createbody input
  	{
  		box-sizing: border-box;
  		
  		padding-top:23px;
  		padding-left:17px;
  		padding-right:17px;
  		font-size: 17px;
  		font-weight:500;
  		font-family:sans-serif;
  		color: #17202A ;
  		border-bottom: 1px solid black;
  	}
  	
  .createbody form div 
  	{
		position: relative;

  	}
  	
  	.createbody form div label
  	{
  		
  		position: absolute;
  		top: 19px;
  		left:16px;
  		color:#CACFD2;
  		font-size: 16px;
  		font-family:sans-serif;
  		transition: .3s;
  		pointer-events: none;
  	}
  	.createbody input:focus ~ label,.createbody input:valid ~ label
  	{
  		top:8px;
  		left: 16px;
  		font-size: 12px;
  		font-family:sans-serif;
  		color: #21618C  ;
  		border-radius:8px 8px 0px 0px;

  	}
  	.createbody input:valid ~ label
  	{
  		color: #273746 ;
  	}
  
  	
  	 .bar
  {
  	position: relative;
  	display:block;
  }
  
  .bar:after, .bar:before
  {
  	content:"";
  	width:0;
  	height:2px;
  	bottom:0px;
  	background: blue ;
  	position: absolute;
  	transition: .5s;
  	
  	
  }
  .bar:before
  {
  	left:50%;
  } .bar:after
  {
  	right:50%;
  }
  .createbody input:focus ~ .bar:before, .createbody input:focus ~ .bar:after
  	{
  		width:50%;
  	}
  
	.car:hover{
	cursor: pointer;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0.2, 0.2);"
	}
  
  </style>
   

</head>
<body>

<%!String authorName; %>
<%
//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("mailid")==null)
{
	response.sendRedirect("ClassLogin.jsp");
}
Db_Connection  dbconn=new Db_Connection () ; 
String mailid=request.getParameter("mail");
System.out.println("it has in"+mailid+ "session");
session.setAttribute("mailId", mailid);

%>

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
				System.out.println(authorName);
			}
			rs4.close();
			st4.close();
			con4.close();
			}catch(Exception e){}
	%>

<!-- end -->


<% 
//String uss=session.getAttribute("username").toString();
//System.out.println(uss);

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top car"  style="font-family: sans-serif; font-size: 14px; font-weight: 600;border-radius:0px;border-left: none;border-right: none;">

  <div class="navbar-header">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
</div>
  
  

  <div class="collapse navbar-collapse" id="navbarNavDropdown">

    <ul class="nav navbar-nav">
      <li><a class="navbar-brand text-muted" href="#" style="font-size: 25px;">
        
      e-Ducation
        </a></li>
  </ul>
 
    <ul class="nav navbar-nav navbar-right ml-auto">
      <li>
      <form action="Logout" method="post">
       <button class="btn btn-danger">Logout</button>
      </form>
     
      </li>
  </ul>
  </div>
</nav>
<!-- html -->
<div class="container-fluid  bg-white " style="margin-top:83px;">



 <div class="row mt-3">
	
	<div class="col-sm-8 col-lg-2 offset-lg-10  offset-sm-4 text-right  ">
		
																<!-- Modal terms -->
			
			<button type="button" class="btn btn-dark text-light shadow-sm mr-2" data-toggle="modal" data-target="#staticBackdrop">Create</button>									
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" 
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			
 				 <div class="modal-dialog modal-dialog-centered ">
    				<div class="modal-content m-2 ">
      
      					<div class="modal-body text-left">
        					<h5 class="modal-title">Using Classroom at a school with students?</h5>
        						<br>
							<p class="modal-text">If so, your school must sign up for a free G Suite for Education account before you can 
							use Classroom. Learn More</p>
							<p class="modal-text">G Suite for Education lets schools decide which Google services their students 
							can use, and provides additional privacy and security protections that are important in a school setting. 
							Students cannot use Google Classroom at a school with personal accounts.
							</p>
							<div class="container" style="background:#EDEDED;height:6rem;">
								<input type="checkbox" id="terms" autocomplete="off" > 
    							<label for="terms">I've read and understand the above notice, and I'm not using 
    							Classroom at a school with students</label>
  							</div>
        
      					</div>
      					<div class="modal-footer">
        					<button type="button" class="btn btn-light" data-dismiss="modal">Go Back</button>
        					<button type="button" class="btn btn-light" data-toggle="modal" data-target="#staticBackdrop1 " 
        					id="read" data-dismiss="modal">Continue</button>
      					</div>
    				</div>
 			 </div>
		</div>
			                                    						 
			                                    						  <!-- end -->
		
			

																		<!-- Modal form -->
				<div class="modal fade " id="staticBackdrop1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered ">
				  
				    <div class="modal-content " style="border-radius:8px;">
				    
				      <div class="modal-header">
				      
				        <h5 class="modal-title" id="exampleModalLabel">Create Class</h5>
				        
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				         	 	<span aria-hidden="true">&times;</span>
				        	</button>
				        	
				      </div>
				      <div class="modal-body createbody">
				  		<form id="create_class_Form">
				        	
				          	<div class="form-group " style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
				            	
				            	<input placeholder="" id="cname" type="text" name="classname" required class="form-control shadow-sm " style="background:none;outline:none;border:none; height:4rem;">
				            	<label>Class name(required)</label>
				            	<div class="bar"></div>
				          	</div>
				          
				          
				           	<div class="form-group " style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
				           		<input type="text" id="section" required class="form-control  shadow-sm" placeholder="" name="section" style="background:none;outline:none;border:none;height:4rem;" >
				           		<label>Section</label>
				           		<div class="bar"></div>
				           	</div>
				           	
							<!-- <div class="form-group" style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">-->
								<input type="hidden" value="<%out.print(authorName);%>" id="name" required class="form-control  shadow-sm"  name="teacher_name" style="background:none;outline:none;border:none;height:4rem;">
								<!--<label>Name</label>
								<div class="bar"></div>
							</div>-->
							
							<div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="text" id="subject"  required class="form-control  shadow-sm" placeholder="" name="subject" style="background:none;outline:none;border:none;height:4rem;">
								<label>Subject</label>
								<div class="bar"></div>
							</div>
					
						<!-- <div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="text" class="form-control  shadow-sm" placeholder="Teacher's Name" name="teachername" style="background:none;outline:none;border:none;height:4rem;">
							</div>-->
							
							<div class="form-group"  style="">
								<input  id="mail" value="<%=session.getAttribute("mailid") %>"  required class="form-control  shadow-sm" placeholder="" type="hidden" name="mailid" style="" >
								
							</div>
							
					<!--  <div class="form-group"  style="border-bottom:1px solid gray; height:4rem; border-radius:8px 8px 0px 0px;background:#EDEDED;">
								<input type="password" class="form-control  shadow-sm"  placeholder="password"  name="password" style="background:none;outline:none;border:none;height:4rem;">
							</div>-->
							
				        </form>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-light " disabled id="submit"  onclick="callServlet('Post')">Create</button>
				      </div>
				    </div>
				  </div>
				</div>
																	<!-- end -->
																	
			<!--<a href="JoinClass.jsp?mail=" class="btn btn-dark text-light shadow-sm">Join</a>
			 join classroom modal -->
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-success text-light shadow-sm" data-toggle="modal" data-target="#exampleModalCenter5">
			 Join
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    
			     <form action="ServletStudent" name="joinclass" method="post">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">Join Classroom</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      
						
					<label class="text-muted float-left" for="exampleInputPassword1">Contact No</label>
						<div class="form-group">
				    		
				    		<input type="text" name="contactno" class="form-control" id="exampleInputPassword1">
				  		</div>
				  	
				  		
					
						<input type="hidden" value=<%=mailid %> name="mailid">
						<input type="hidden" name="sname" value="<%=authorName%>">
						
						<p class="text-dark float-left">ask you teacher for the class code,then enter it here</p>
						<label  class="text-muted float-left" for="exampleInputPassword2">Class Code</label>
						<div class="form-group">
				    		
				    		<input type="text" name="classcode" class="form-control" id="exampleInputPassword2">
				  		</div>
						
						
					
						
						
						<p class="text-dark float-left">To sign in with a class code</p>
						<ul class="float-left">
						  <li class="text-dark float-left">&nbsp  Use an authorized account</li>
						  <li class="text-dark float-left">Use a class code with 5-7 letters or numbers,and no <span class="float-left ml-2">spaces or symbols</span></span></li>
						</ul>
						<p class="text-dark  float-left">If you have trouble joining the class,go to Help Center<span class="float-left ml-4">artical</span></span></p>
				 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			       <button type="submit" class="btn btn-primary">Join</button>	
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			<!-- /join classroom modal -->
		
	</div>
</div>

		<!-- end -->
		

		
<div class="container-fluid  mr-sm-5 mr-lg-3 mb-sm-2 mb-md-2 mb-lg-2 ">
	
		<div class="row">

<!-- database connectivity for select created class-->
	<%
		//Class.forName("com.mysql.cj.jdbc.Driver");
		String sql = "SELECT * FROM teacher inner join registration on teacher.mailid=registration.mailid where teacher.mailid='"+mailid+"' ";
		try {
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");
			
			Connection con= dbconn.Connection();
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			if (!rs.isBeforeFirst()) {
	%>
	
	
	<div>
		<%
			out.print("");
		%>
	</div>
	
	
	<%
		}
		
	while (rs.next()) {
	%>


				<div class="col-sm-6  col-lg-3 col-md-4 mt-3 p-1 p-md-2">

					<div class="card " style="height:100%;width:100%; border:1px solid #D5D5D5; border-radius:10px; "><!-- box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); -->
						<div class="card-header bg-primary " style="height:95px; border-radius:10px 10px 0px 0px;">
							
								<!-- dropdown for delete -->
								<form action="Delete" method="post">
								<div class="dropdown">
								  <a class="float-right text-light " href="#"  id="dropdownMenuLink<%out.print(rs.getString("classcode"));%>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								   <i class="fa fa-ellipsis-v"></i>
								  </a>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink<%out.print(rs.getString("classcode"));%>">
								    <button class="dropdown-item" id="d<%out.print(rs.getString("classcode"));%>">Delete</button>
								  </div>
								</div>
								<input type="hidden" value="<%out.print(rs.getString("classcode"));%>" name="delete">
								</form>
								
								<!-- dropdown for delete -->
								
								<a class="text-light" href="CreateTeacher.jsp?code=<%out.print(rs.getString("classcode"));%>&classname=<%out.print(rs.getString("classname"));%>&author=<%=authorName%>">
							
									<h3 class="card-title text-truncate">
										<%
											out.println(rs.getString("classname"));
										%>
										
									</h3> 
									<p class="card-text">
										<%
											out.println(rs.getString("section"));
										%>
									</p>
								</a> 
						
						</div>
						<br>

						<div class="card-body" style="height: 115px;">

							<%
								out.println(rs.getString("subject"));
							%>
							<br>
							<%
								out.println(rs.getString("classcode"));
							%>



						</div>
						<div class="card-footer bg-white"
							style="height: 55px; border-top: 1px solid #D5D5D5; border-radius: 0px 0px 10px 10px;">
							<%
								out.println(rs.getString("name"));
							%>

						</div>




					</div>
				

</div>


				<%
		}
	%>
	<%
	rs.close();
	st.close();
	con.close();

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	
	
	
	
	
	
	
		<!-- student -->
		
		
		
		

<!-- database connectivity -->
	<%
		//Class.forName("com.mysql.cj.jdbc.Driver");
		String sql1 = "SELECT * from student_class INNER JOIN teacher ON student_class.scode=teacher.classcode where smailid='"+mailid+"'" ;
		try {
			//Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root", "");
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con1= dbconn.Connection();
			Statement st1 = con1.createStatement();
			ResultSet rs1= st1.executeQuery(sql1);
			if (!rs1.isBeforeFirst()) {
	%>
	
	
	<div>
		<%
			out.print("");
		%>
	</div>
	
	
	<%
		}
		
	while (rs1.next()) {
	%>


				<div class="col-sm-6  col-lg-3 col-md-4 mt-3 p-1 p-md-2">

					<div class="card " style="height:100%;width:100%; border:1px solid #D5D5D5; border-radius:10px; "><!-- box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); -->
						<div class="card-header bg-info " style="height:95px; border-radius:10px 10px 0px 0px;">
							<!-- dropdown for delete -->
								<form action="Delete" method="post">
								<div class="dropdown">
								  <a class="float-right text-light " href="#"  id="dropdownMenuLink<%out.print(rs1.getString("classcode"));%>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								   <i class="fa fa-ellipsis-v"></i>
								  </a>
								
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink<%out.print(rs1.getString("classcode"));%>">
								    <button class="dropdown-item" id="d<%out.print(rs1.getString("classcode"));%>">Delete</button>
								  </div>
								</div>
								<input type="hidden" value="<%out.print(rs1.getString("classcode"));%>" name="delete">
								</form>
							<!-- dropdown for delete -->
								
									<a class="text-light" href="CreateStudent.jsp?code=<%out.print(rs1.getString("classcode"));%>&classname=<%out.print(rs1.getString("classname"));%>&author=<%=authorName%>&mailId=<%=mailid%>">	
									<h3 class="card-title ">
										<%
											out.println(rs1.getString("classname"));
										%>
										
									</h3> 
									<p class="card-text">
										<%
											out.println(rs1.getString("section"));
										%>
									</p>
								</a> 
						
						</div>
						<br>

						<div class="card-body" style="height: 115px;">

							<%
								out.println(rs1.getString("subject"));
							%>
							<br>
							<%
								out.println(rs1.getString("classcode"));
							%>



						</div>
						<div class="card-footer bg-white"
							style="height: 55px; border-top: 1px solid #D5D5D5; border-radius: 0px 0px 10px 10px;">
							<%
								out.println(rs1.getString("name"));
							%>

						</div>




					</div>
				

</div>


				<%
		}
	%>
	<%
	rs1.close();
	st1.close();
	con1.close();

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
		
		
		<!-- end -->
		
		</div>
		
		
		
	
	
	
	
	
	
	
	
	
	
		</div>
		
		
		
		
		
		
	
	

	</div>
		
<%//session.removeAttribute("mail"); %>
</body>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
  	<script type="text/javascript">
  	$(document).ready(function(){
		

		//for input type text 
		$("#cname,#section,#subject").on("keyup input",function(){
			
			
			var empty2=false;
		

			$("#cname,#section,#subject").each(function(){
			if($(this).val()=='')
				{
			
					empty2=true;
				}
			});
			if(empty2)
				{
					$('#submit').attr('disabled', 'disabled');
				}
			else{
				$('#submit').removeAttr('disabled');
				}
			
			});				

		
		//for input type checkbox...
		$("#read").attr('disabled',true);
		$("#terms").change(function(){
			if(this.checked){
				$("#read").attr('disabled',false);
				}
			else{
				$("#read").attr('disabled',true);
				}
			
			});




  		
  	});

  //call servlet...
  	function callServlet(methodType)
		{
  		
  			///var mail=document.getElementById("mail").value;
  		//var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
  			
  			//if(regex.test(mail))
  				//{
  					
  					
  					document.getElementById("create_class_Form").action="ServletTeacher";
  			  		document.getElementById("create_class_Form").method=methodType;
  			  		document.getElementById("create_class_Form").submit();
  					//return true;
  					
  			//	}
  			//else
  				//{
  				//document.getElementById("mail").setAttribute('data-container', 'body');
  				///document.getElementById("mail").setAttribute('data-placement', 'top');
  				//document.getElementById("mail").setAttribute('data-container', 'check mail id');
  				//document.getElementById("mail").setAttribute('data-toggle', 'popover');
  				
  					
  			//	}
  		
		
	  		
	  }
	

  	</script>
</html>