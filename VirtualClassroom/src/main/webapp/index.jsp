<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
<title>virtual classroom</title>
</head>
<body>
<%
//response.sendRedirect("ClassLogin.jsp");
%>
<jsp:forward page="ClassLogin.jsp"></jsp:forward>
</body>


	
    <script type="text/javascript">
	//function test()
	//{
		//var mail=document.getElementById("mail").value;
	//var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
		
	//	/if(regex.test(mail))
	//		{
		//	onsubmit="return test()"
				//document.getElementById("mail").style.border= "3px solid green";
				//return true;
				
			//}
	//else
		//	//{
			//document.getElementById("mail").style.border= "3px solid red";
		//return false;
				
			//}
	//}
//$(document).ready(function(){
	//$("#mail").on("keyup input",function(){

		//var regex=/^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})$/;
		//if(regex.test($(this).val()))
			//{
			//document.getElementById("mail").style.border= "3px solid green";
			//return true;
			//}
		//else
			//{
			//document.getElementById("mail").style.border= "3px solid red";
			//return false;
			//}

		//});
	
//});

	/*function callServlet(){
	
document.getElementById("logreg").action="Login";
document.getElementById("logreg").method='get';
document.getElementById("logreg").submit();
}

function callServlet2(){
	
document.getElementById("logreg").action="Registration";
document.getElementById("logreg").method='post';
document.getElementById("logreg").submit();
}
		
		*/
		
		
		
		
		/*
		
		
		
		
const form=document.getElementById("logreg");
const user=document.getElementById("user");
const mail=document.getElementById("mail");
const pass=document.getElementById("pass");


form.addEventListener('submit', function(e) {
	e.preventDefault();
	checkInputs();
});




	



function checkInputs()
{

const userValue=user.value.trim();
const mailValue=mail.value.trim();
const passValue=pass.value.trim();

	if(userValue === '')
		{
		
		setErrorFor(user,'username cannot be blank');
		return false;
	}
	else if(!isUser(userValue))
		{
		setErrorFor(user,'User is not valid');
		return false;
	}
	else
		{
			
			setSuccessFor(user);
			return true;
		}

	if(mailValue === '')
	{
		
		setErrorFor(mail,'Email cannot be blank');
		return false;
	}
	else if(!isEmail(mailValue))
		{
		setErrorFor(mail,'Email is not valid');
		return false;
		}
	else
		{
			
			setSuccessFor(mail);
			return true;
		}


	if(passValue === '')
		{
		
		setErrorFor(pass,'Password cannot be blank');
		return false;
	}
	else if(!isPass(passValue))
		{
		setErrorFor(pass,'Password is not valid');
		return false;
	}
	else 
		{
			
			setSuccessFor(pass);
			return true;
		}
	
	return false;
	
}


function setErrorFor(input,message)
{
	const formGroup=input.parentElement;
	const small=formGroup.querySelector('small');
	small.innerText=message;
	formGroup.className='form-group error';
}

function setSuccessFor(input)
{
	const formGroup=input.parentElement;
	formGroup.className='form-group success';
}


function isEmail(email)
{
	return /^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})?$/.test(email);
	
}

function isPass(pass)
{
	return /(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@])[a-zA-Z0-9@]{8,}/.test(pass);
}

function isUser(user)
{
	return /^(?=.*[a-zA-Z])[a-zA-Z]{3,}$/.test(user);
}*/

</script>


</html>






