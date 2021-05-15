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
</head>
<body>



<body style="background-color:#FFF8DC;">
<%ForgotModel fm=(ForgotModel)session.getAttribute("mailModel"); 
if(fm.getEmail()==null){
	response.sendRedirect("forgot.jsp");
}
%>
<%
	String email=request.getParameter("email");
%>
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
		
			<form   id="forgot" method="post">
			<div class="card-body">
				<div class="border-bottom text-dark" style="font-weight:500;font-size:20px;">
				Choose a new password
				</div>
				<div class="mt-2"  style="font-size:14px;">
				Create a new password that is at least 6 characters long. A strong password has a combination of letters, digits and punctuation marks.
				</div>
				<input type="hidden" name="email" value="<%=email%>" >
				<div class="form-group">
    				<label for="exampleInputPassword1" style="font-weight:500;font-size:20px;">New Password</label>
    				<input type="password" class="form-control" name="newPassword" id="exampleInputPassword1" style="box-shadow: none;" >
  					<small></small>
  				</div>
			</div>
			<div class="card-footer text-right" >
				<input class="btn btn-primary btn-sm" id="continue"  type="submit" value="Continue">
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
	 $('#continue').click(function(){

		 checkInputs();
		
		 });

	
	//$("#exampleInputPassword1").on("keyup input",function(){
		
		//var empty=false;
	

//		$("#exampleInputPassword1").each(function(){
	//	if($(this).val()=='')
		//	{
		
			//	empty=true;
			//}
		//});
		//if(empty)
			//{
				//$('#continue').attr('disabled', 'disabled');
			//}
		//else{
			//$('#continue').removeAttr('disabled');
			//}
		
		//});
	
	
	function checkInputs(){
		var pass=document.getElementById("exampleInputPassword1");
		
		var passValue=pass.value.trim();
		if(passValue ==='')
		{
		
		setErrorFor(pass,'Password cannot be blank');
		
	}
	else if(!isPass(passValue))
		{
		setErrorFor(pass,'Please chosse a stronger password,it should contain atleast uppercase,lowercase number & charecter');
		
	}
	else 
		{
			
			setSuccessFor(pass);
			callServlet();
		}
	}
	
	function setErrorFor(input,message)
	{
		var formGroup=input.parentElement;
		var small=formGroup.querySelector('small');
		small.innerText=message;
		formGroup.className='form-group error';
	}




	function setSuccessFor(input)
	{
		var formGroup=input.parentElement;
		formGroup.className='form-group success';
	}
	function isPass(pass)
	{
		return /(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@_#<>?|.=\+*,;:&^%$!~`])[a-zA-Z0-9@_<>?|.=\+*,;:&^%$!~`\s]{8,}/.test(pass);
	}
	
	
	function callServlet(){
		
		document.getElementById("forgot").action="UpdatePasswordServlet";
		document.getElementById("forgot").method='post';
		document.getElementById("forgot").submit();
		}
});


</script>
</html>