<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.*" %>
<%@page import="java.awt.*" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />



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
  	.comment  div 
  	{
		position: relative;

  	}
  	.comment  div label
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
  	width:1px;
  	height:1px;
  	bottom:0px;
  	background:black;
  	position: absolute;
  	transition: .5s;
  	
  	
  }
  .bar:before
  {
  	left:50%;
  } 
  .bar:after
  {
  	right:50%;
  }
  .comment textarea:focus ~ .bar:before, .comment textarea:focus ~ .bar:after
  	{
  		width:50%;
  	}

 


	#close_page:focus
	{
	border:1px solid;
	background-color: 	#E5E4E2;
	
	}
	
</style>
	
	
	
<title><%out.println(request.getParameter("classname"));%></title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
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
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in CreateAssignment.jsp:" + code);
		GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice();
		int width = gd.getDisplayMode().getWidth();
		int height = gd.getDisplayMode().getHeight();
		
		%>
		
<div class="container-fluid c_form" >

<!-- headder portion -->

	<div class="row border-bottom pl-4 pr-4 pt-3 pb-3" >
		<div class="col-0 " >
			<span class="float-left border-none rounded-circle pb-1 pl-1 pr-1" >
				<a type="button" href="TeacherCreate.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author") %>" class="close " style="" data-dismiss="modal" aria-label="Close" id="close_page">&times;</a>
			</span>	   
		</div>
		 
		 <div class="col-4 col-lg-1 col-md-2  ">
		 	<span class="text-left ">
		 		<h5>Assignment</h5>
		 	</span>
		 </div>
		<span class="col-4 col-lg-1 col-md-2   offset-3 offset-md-7 offset-lg-9 mr-0 mr-lg-2 " id="btn_spn" style="">
			<button class="btn btn-dark ml-4" id="assign_btn" disabled onclick="callServlet('post')" >Assign</button>
		</span>
	
	</div>

<!-- body portion -->
<form method="post" id="assignment" name="assign" enctype="multipart/form-data" >
	<div class="row ">
		
		<div class="col-lg-9 col-md-6 col-sm-12 col-12  pl-md-5 pr-md-2 pl-sm-2 pr-sm-2 pl-0 pr-0 pt-4  border-right" id="cols">
		
			<div class="container comment   " >
		
					
					
						
						<div class="form-group" >
							
							<textarea class="form-control text1"
									name="title" required="required" col="60"
									style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;"></textarea>
							<label>Text</label>
							<div class="bar"></div>
						</div>
								
						<div class="form-group" >
							<textarea class="form-control text2 " id="Msg"
									  name="instruction" required="required" rows="4" 
									style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;"></textarea>
							<label>Instruction(Optional)</label>
							<div class="bar"></div>
						</div>
						<textarea id='userFied' style="display:none;"></textarea>
						<input type="file" name="file_assign" multiple="multiple">
					
					
					
			</div>
			
			<!-- end of create_assign -->
		</div>
		 
		 	<!-- end of left-column -->
		 
		<div class="col-lg-3 col-md-6   col-sm-6 col-12  mt-4 p-3 ">	
			
			<div class="row pl-4 pr-4 mt-2">
				<p>For</p>
			</div>
			
			<div class="row pl-2 pr-4 mt-2">
				<div class="col-12">
					<button class="btn btn-success" disabled><%=request.getParameter("classname") %> CLASS</button>
				
					<button class="btn btn-success" disabled>ALL STUDENTS</button>
				</div>
			</div>
			
			<div class="row pl-4 pr-4 mt-3">
				<label for="exampleInputPassword1">Point</label>
			</div>
			
			<div class="row pl-4 pr-4 w-50 mt-1">
				<!--  <form method="post"  id="assignment1" name="assign1" >-->
				<div class="input-group">
		    	
		    		<input type="text"  name="points" value="10" class="form-control " id="exampleInputPassword1" style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;border-radius:0px;">
		    		<div class="bar"></div>
	  			</div>
	  			
	  		</div>
	  		
	  		<div class="row pl-4 pr-4 mt-4">
	  			<label for="exampleInputPassword1">Due</label>
	  		</div>
	  		
	  		
	  		<div class="row pl-4 pr-4 mt-1">
		  		<div class="input-group"  >
		  		
		  			
		  			<input type="button" class="form-control btn btn-dark btn-block  " style="box-shadow:none;" value="NO DUE DATE" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
		  			
		  				<!-- add on append -->
		  			
		  			<div class="input-group-append">
		  				<!--  <span class="input-group-addon dropdown-toggle"></span>-->
		  				
		  				<div class="dropdown-menu " style="margin-top:-39px;box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1), 0 2px 20px 0 rgba(0, 0, 0, 0.19);">
		  					
		  					<div class="dropdown-item" >Due Date & Time</div>
		  					
				    		<div class="dropdown-divider"></div>
				    		
				    		<div class="dropdown-item" >
				    			<div class="input-group input-daterange" data-provide="datepicker" >
				   					<input type='text' name="due" class="form-control w-100 "  id='datetime'  value="<%=LocalDate.now()%>" />
				 				</div>
				 			</div>
				 			
				 			<div class="dropdown-item" >
				    			<div class="input-group input-daterange"  id='datetime1'>
				   					<input type='text' name="time" class="form-control w-100"   value="11:59 PM" />
				 				</div>
				    		</div>
		  			
		  				</div>
		  			</div>
		  		
		  		
		  		</div>
		  		
		  	</div>
	  		
	  		<!-- end of input group of right side 
	  		<div class="row pl-4 pr-4 mt-4">
	  			<label for="exampleInputPassword1">Topic</label>
	  		</div>
	  		-->
	  		<div class="row pl-4 pr-4 rowl">
		  		<div class="input-group ingl">
			    	<input type="hidden" name="topic" class="form-control" id="exampleInputPassword" style=" resize:none;overflow:hidden;background:#EDEDED;outline:none;border:none;border-bottom:1px solid black;box-shadow: none!important;border-radius:0px;">
			    	<!--  <div class="input-group-addon">&times;</div>-->
			   		<div class="bar"></div>
		 		</div>
		 	</div>
		 	
				 	<!-- hidden input for transefar author name to TacherAssignmentServlet -->
				 		<input type="hidden" name="authorName" value="<%=request.getParameter("author") %>">
				 	<!-- end of hidden input -->
		
		</div>	<!-- end of column right -->
	</div>	<!-- end of second row -->
		
</form>

</div>
</body>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous"></script>


	
	
	
	
	
<script type="text/javascript">
document.getElementById('cols').style.height=(screen.height-212)+"px";
$(document).ready(function(){
	               
	$('.input-daterange #datetime').datepicker({
		format: 'mm/dd/yyyy',
	    startDate: '0',
	    todayHighlight:'true',
	    autoclose:'false',
	    weekStart:'1',
	    beforeShowDate:'true',
	    showOtherDays:'true'
	   
		
		});
	

	
	$(".text1").on("keyup input",function(){
		
		$(".text1").css('height','65px').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));

		var empty=false;
		$(".text1").each(function(){
			if($(this).val()=='')
				{
			
					empty=true;
				}
			});
			if(empty)
				{
					$('#assign_btn').attr('disabled', 'disabled');
				}
			else{
				$('#assign_btn').removeAttr('disabled');
				//$('#btn_spn').prepend("<div class='mr-5'> saving..</div>");
				}
		
	});
	
	$(".text2").on("keyup input",function(){
		
	
		$(".text2").css('height','auto').css('height',this.scrollHeight+(this.offsetHeight-this.clientHeight));
		
	});

});


//call TeacherAssignmentServlet using js
	function callServlet(methodType)
	{

		//text=document.getElementById('Msg').value;
		//text=text.replace(/ /g, "[sp] [sp]");
		//text=text.replace(/\n/g, "[nl]");
		//document.getElementById('userFied').value=text;
		//return false; 
		//
		//text1.replace("[sp]","\n");
		////text1%>
	
		document.getElementById("assignment").action="TeacherAssignmentServlet";
		document.getElementById("assignment").method=methodType;
		document.getElementById("assignment").submit();
		//document.forms.action="TeacherAssignmentServlet";
		//document.forms.method=methodType;
		//document.forms.submit();
	
	
	}



</script>
</html>