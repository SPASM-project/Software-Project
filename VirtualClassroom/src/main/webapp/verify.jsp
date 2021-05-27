<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.SPASM.model.ForgotModel"%>
<%@page import="com.SPASM.required.SendMail"%>
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

<%ForgotModel fm=(ForgotModel)session.getAttribute("mailModel"); 
if(fm.getEmail()==null){
	response.sendRedirect("forgot.jsp");
}
%>

<%
boolean b=false;
String email=request.getParameter("email");
System.out.println("hidde"+email);
SendMail ms=new SendMail();
String code=ms.getRandom();
ForgotModel u=new ForgotModel();
u.setCode(code);
u.setEmail(email);

try {
	b=ms.sendMail(u);
} catch (Exception e) {
	
	e.printStackTrace();
} 
System.out.println(b);
if(b) {
	
	session.setAttribute("authcode", u);
	


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
		
			<form  action="VerifyCodeServlet" method="post">
			<div class="card-body">
				<div class="border-bottom text-dark" style="font-weight:500;font-size:20px;">
				Enter security code
				</div>
				<div class="mt-2"  style="font-weight:500;font-size:15px;">
				Please check your email for a message with your code. Your code is 6 digits long.
				</div>
				<div class="row">
				<div class="col-md-6 col-sm-12 col-12">
					<div class="form-group " >
	    				
	    				<input type="password" class="form-control mt-2" id="exampleInputPassword1" name="authcode" placeholder="Enter Code" style="box-shadow: none;">
						<small class="text-danger"><%if(session.getAttribute("otp")!=null) out.println(session.getAttribute("otp"));%></small>	  				
	  				</div>
				</div>
				
				<div class="col-4 d-md-block d-sm-none d-none" style="font-weight:500;font-size:15px;">
					<div >
						We sent your code to:
					</div>
					<p><%=fm.getEmail().charAt(0) %>***@*****</p>
					
					
				</div>
				<input type="hidden" value="<%=fm.getEmail()%>" name="email">
				</div>
			</div>
			<div class="card-footer text-right" >
				<input class="btn btn-primary btn-sm" id="continue" disabled type="submit" value="Continue">
				<a class="btn btn-outline-info btn-sm" href="ClassLogin.jsp" role="button">Cancel</a>
			</div>
			</form>
		</div>
		</div>
	</div>
</div>
</body>


<%}else{
	System.out.println("not");
}
	%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#exampleInputPassword1").on("keyup input",function(){
		
		var empty=false;
	

		$("#exampleInputPassword1").each(function(){
		if($(this).val()=='')
			{
		
				empty=true;
			}
		});
		if(empty)
			{
				$('#continue').attr('disabled', 'disabled');
			}
		else{
			$('#continue').removeAttr('disabled');
			}
		
		});
});


</script>
</html>