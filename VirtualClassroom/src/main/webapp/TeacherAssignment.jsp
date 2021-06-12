<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css" integrity="sha512-Fppbdpv9QhevzDE+UHmdxL4HoW8HantO+rC8oQB2hCofV+dWV2hePnP5SgiWR1Y1vbJeYONZfzQc5iII6sID2Q==" crossorigin="anonymous" />
	
	<style>
	
  	.comment .text1
  	{
  		box-sizing: border-box;
  		border-radius: 0px;
  		padding-left:17px;
  		padding-top:23px;
  		font-size: 19px;
  		height:65px;
  		font-weight:500;
  		
  		font-family:sans-serif;
  	}
  	.comment  .text2
  	{
  		box-sizing: border-box;
  		border-radius: 0px;
  		padding-left:17px;
  		padding-top:23px;
  		font-size: 19px;
  		font-weight:500;
  		
  		font-family:sans-serif;
  	}
  	.comment form div 
  	{
		position: relative;

  	}
  	.comment form div label
  	{
  		
  		position: absolute;
  		top: 15px;
  		left: 16px;
  		color: black;
  		font-size: 16px;
  		font-family:sans-serif;
  		transition: .3s;
  		pointer-events: none;
  		
  		
  		
  		
  	}
  	.comment textarea:focus ~ label,.comment textarea:valid ~ label
  	{
  		top:8px;
  		left: 16px;
  		font-size: 12px;
  		font-family:sans-serif;
  		color: gray;
  	

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
  	height:1px;
  	bottom:1px;
  	background:black;
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
  .comment textarea:focus ~ .bar:before, .comment textarea:focus ~ .bar:after
  	{
  		width:50%;
  	}
	#children:hover{
	background:#f7f7f7;
	}
	</style>
	
	
	
<title><%out.println(request.getParameter("classname"));%></title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
<%
		//if (request.getParameter("code") == null) {
			

		//response.sendRedirect("CreateTeacher.jsp");
	//}///
	%>

<!-- declaration.... -->
<%!//int i; String com;String dt;%>

	
		<%
			
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in CreateAssignment.jsp:" + code);
		%>
<!--
	padding-top:23px;
  		padding-left:17px;
  		padding-right:17px;-->
<div class="container-fluid border  " >

	<!-- headder portion -->
	<div class="row  ">
		<div class="col-0  ">
			<span class="float-left">
				<a type="button" href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>" class="close" data-dismiss="modal" aria-label="Close">&times;</a>
			</span>	   
				
			
		 </div>
		 
		 <div class="col-1 ">
		 	<span class="text-left">
		 		<h5>Assignment</h5>
		 	</span>
		 </div>
		<span class="col-1 border offset-4 offset-lg-9"  style="">
			<button class="btn btn-dark" onclick="callServlet('post')" >Assign</button>
		</span>
	
	</div>
	
	

	<div class="row border "  style="height:43vw;" >
	
		<div class="col-lg-9 col-md-6 col-sm-12 col-12 border pl-md-5 pr-md-2 pt-4 p-0">
			<div class="container comment  " >

						 	<form  method="post" id="assignment" name="assign" >
								<div class="form-group" >
<textarea class="form-control text1 " rows="4" cols="60" name="title" required="required" 
style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;"></textarea>
									<label>Text</label>
									<div class="bar"></div>
								</div>
								
								<div class="form-group" >
								<textarea class="form-control text2 "
									 rows="4" cols="60" name="msg" required="required" 
									style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;"></textarea>
									<label>Instruction(Optional)</label>
									<div class="bar"></div>
								</div>
								
							
							</form>
							
	  </div>
	  </div>
  	<div class="col-lg-3 col-md-6   col-sm-6 col-12 border">
	
		<p>For</p>
		<span><button class="btn btn-light">Java DCST</button></span>
		<span><button class="btn btn-light ">All Student</button></span>
		 <div class="input-group">
		    <label for="exampleInputPassword1">Points</label>
		    <input type="text" class="form-control  w-50" id="exampleInputPassword1" style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;border-radius:0px;">
		    <div class="bar"></div>
	  	</div>
	  	
	  	<div class="input-group"  >
	  	<label for="exampleInputPassword1">Due</label>
		  <input type="button" class="form-control btn btn-light btn-block  " style="box-shadow:none;" value="No due date" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
			  <div class="input-group-append">
			    	<span class="input-group-addon dropdown-toggle">
					
		  			</span>
			  
			  		<div class="dropdown-menu " style="margin-top:-39px;box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 2px 20px 0 rgba(0, 0, 0, 0.19);">
			    		<div class="dropdown-item" >Due date & time</div>
			    		<div class="dropdown-divider"></div>
			    		<div class="dropdown-item" >
				    		<div class="input-group input-daterange"  id='datetime'>
			   					<input type='text' class="form-control w-100"   value="2012-04-05" />
			 				</div>
			    
			    		</div>
			    		<div class="dropdown-item" >
			    			<div class="input-group input-daterange"  id='datetime'>
			   					<input type='text' class="form-control w-100"   value="2012-04-05" />
			 				</div>
			    
			   			</div>
			   
			  
			 	   </div>
			
	  	
	  	</div>
	  	
	  	
	<label for="exampleInputPassword1">Topic</label>

	<div class="input-group">
		    
		   
		    <input type="text" class="form-control" id="exampleInputPassword" style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;border-radius:0px;">
		    <div class="input-group-addon">
				&times;
	  		</div>
		    <div class="bar"></div>
	 </div>
	
	</div>
 



</div>


</body>

<script type="text/javascript" src="/scripts/bootstrap-datetimepicker.*js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js" integrity="sha512-D7wym1iXOnyjJbX5hKh84TRFqnXTd7Qc0biqMOmoKgTRRZjUznfgM4Fk8Ta7x8Wp3o8HyKLb3A2kgxq1S6/4fA==" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	
     
		$(".text1").on("keyup input",function(){
			
			$(".text1").css('height','65px').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));
			
		});
		
		$(".text2").on("keyup input",function(){
			
		
			$(".text1").css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));
			
		});



		// $("#datetime").datepicker();
            
	

	});

//call PostServlet using js







		
	
		
		function servletCall(methodType)
		{

			//document.getElementById("comment").action="TeacherAssignmentServlet";
			//document.getElementById("comment").method=methodType;
		//	document.getElementById("comment").submit();
	
		document.getElementById("assignment").action="TeacherAssignmentServlet";
		document.getElementById("assignment").method=methodType;
		
		document.getElementById("assignment").submit();
		
	//	}
		





	</script>
</html>