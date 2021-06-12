<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.SPASM.model.ForgotModel"%>
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
<title>e-Ducation</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
<%//ForgotModel fm=(ForgotModel)session.getAttribute("mailModel"); 
//if(fm.getEmail()==null){
	//response.sendRedirect("forgot.jsp");
//}
%>


<body style="background-color:#FFF8DC;">


<div class="container-fluid">
	<div class="row bg-primary">
		<div class="col-12">
			<div style="height:12vh;">
			<p style="font-weight:500;font-size:43px;">e-Ducation</p>
			
			</div>
		</div>
	</div>
	
	<div class="row " style="height:70vh;background-color:#F0FFFF;">
		<div class="col-lg-6  offset-lg-3 col-md-8 offset-md-1 col-sm-12 col-12" style="height:250px;margin-top:83px;">
		<div class="card mt-5" style="overflow:hidden;border-radius:0px;box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);">
		
			<form  action="ForgotServlet" method="post">
			<div class="card-body">
				<div class="border-bottom text-dark" style="font-weight:500;font-size:20px;">
				Find Your Account
				</div>
				<div class="mt-2"  style="font-weight:500;font-size:15px;">
				Please enter your email address or phone number to search for your account.
				</div>
				
				 <div class="form-group mt-2 " >
        			<input class="form-control " id="mail" type="text" name="email" placeholder="Email" style="box-shadow: none;">
                                
                     <small class="text-danger ml-2"><% if(session.getAttribute("error")!=null) out.println(session.getAttribute("error")); %></small>          
      			</div>
				
				
			</div>
			<div class="card-footer text-right" >
				<input class="btn btn-primary btn-sm" id="submit" disabled type="submit" value="Search">
				<a class="btn btn-outline-info btn-sm" href="ClassLogin.jsp" role="button">Cancel</a>
			</div>
			</form>
		</div>
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
	$("#mail").on("keyup input",function(){
		
		var empty=false;
	

		$("#mail").each(function(){
		if($(this).val()=='')
			{
		
				empty=true;
			}
		});
		if(empty)
			{
				$('#submit').attr('disabled', 'disabled');
			}
		else{
			$('#submit').removeAttr('disabled');
			}
		
		});
});


</script>
</html>