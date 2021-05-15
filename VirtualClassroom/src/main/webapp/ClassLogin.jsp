<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">


<style type="text/css">

*{
    margin:0px;
    padding:0px;
    box-sizing: border-box;
}
body{
    font-family: 'Poppins', sans-serif;
    background:#f3f2f2;
    height: 100%;
}
.b-height{
    position: relative;
    padding:35px 0px 0px;
}
.b-wrapper{
    display:flex;
    align-items:center;
    min-height: 550px;
    background-color: #fff;
    box-shadow: 0px 3px 10px rgba(0,0,0,.2);
} 
.b-min-height{
    height: 550px;
    background: #00bdaa;    
}
.b-logo{
    width:100px;
}
.b-title{
    padding:100px 0px 0px 0px;
}
.b-title h1{
    color:#fff;
    font-weight:500;
    font-size: 35px;
}
.b-title p{
    color: #e7e7e7;
    margin:30px 0px 40px;
}
.b-title button{
    letter-spacing: 0.4px;
    padding: 15px 85px;
    border-radius: 36px;
    border: 1.5px solid #fff;
    background: transparent;
    color: #fff;
    text-transform: uppercase;
    
}
.b-title button:focus{
    outline:none;
    
}
.b-form{
    /*width:60%;*/
    margin:auto;
}
.b-form-title h1{
    color: #00bdaa;
    font-size: 34px;
    font-weight: 900;
}
.b-form-title i{
    width: 50px;
   /* height: 50px;*/
    border: 1px solid #ddd;
    border-radius: 36px;
    line-height: 46px;
    font-size: 20px;
    margin: 13px 5px;
    color:#333;
    cursor:pointer;
}
.b-subtext{
    color: #b4b2b2;
    font-size: 14px;
}
.b-form .form-control{
    font-size:14px;
    height: 50px;
    padding-left: 45px;
    background: #edf9fe;
   
    color: #333;
    position: relative;
    margin-bottom: 3px;
}
.b-form .form-control:focus{
    outline:none;
    box-shadow:none;
} 
.form-group{
    position: relative;
}
.b-font{
    position: absolute;
    top: 18px;
    left: 18px;
    z-index: 10;
    color: #6b6b6b;
    font-size:13px;
}    
.b-form button{
    letter-spacing: 0.4px;
    padding: 15px 85px;
    border-radius: 36px;
    border: 1.5px solid #fff;
   /* background: #00bdaa;*/
    color: #fff;
    text-transform: uppercase;
    margin-top:25px;
    cursor: pointer;
}
.b-form button:focus{
    outline:none;
}
.b-form .b-forgot{
    /*border-bottom: 1px solid #e8e4e4;*/
    padding-bottom: 10px;
    color: #7e7e7e;
    font-size: 14px;
    font-weight: 600;
    cursor:pointer;
    display:none;
}

.swift_right{
    display:none;
}
.swift_element{
    display:flex;
    align-items:unset;
    flex-direction: row-reverse;
    transition:0.5s ease-in-out;
    -webkit-transition:0.5s ease-in-out;
    -moz-transition:0.5s ease-in-out;
    -ms-transition:0.5s ease-in-out;
    -o-transition:0.5s ease-in-out;
}
.disp
{
display: block;
}

.valid 
	{
position: absolute;	
 top: 18px;
 right:10px;
 visibility: hidden;
	}
small
{
	
	bottom:0;
	left:0;
	visibility: hidden;
}

.success input
{
border-color:#2ecc71;
}

 .error input
{
border-color:#e74c3c;
}

.success i.fa-check-circle
{
visibility: visible;
color:#2ecc71;
}

.error i.fa-exclamation-circle
{
visibility: visible;
color:#e74c3c;
}

.error small
{
visibility: visible;
color:#e74c3c;
}

</style>


<title>e-Ducation</title>
</head>
<body class="bg-secondary">
<div class="container">
    <div class="row align-items-center justify-content-center">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 b-height">
            <div class="row b-wrapper"> 
                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 b-min-height">
                  <!--   <div class="b-logo swift_left">
                        <a href = "https://www.youtube.com/channel/UCg-bMxpjvoQVxVs69iyqGuQ" target = "_blank"><img src="images/Logo.png" alt="Programming Guide Logo" title="Programming Guide Logo" class="img-fluid"></a>
                    	</div>--> 
                    <div class="b-title text-center">
                        <h1 class="user_title">Welcome to e-Ducation</h1>
                        <p class="user_subTitle">To keep Connected with us please </br> login with your personal info.</p>
                        <button type="button" class="swift sign_in">Sign In</button>
                    </div>
                </div>
                
                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
                   <!--  <div class="b-logo swift_right">
                        <a href = "https://www.youtube.com/channel/UCg-bMxpjvoQVxVs69iyqGuQ" target = "_blank"><img src="images/Logo.png" alt="Programming Guide Logo" title="Programming Guide Logo" class="img-fluid"></a>
                    </div> -->
                    <div class="b-form text-center">
                        <div class="b-form-title">
                            <h1 class="form_title">Create Account</h1>
                           
                            <p class="b-subtext">or use your email for registration</p>
                        </div>
                        
                        
                        <form  id="logreg" method="post">
                            <div class="form-group username ">
                                <input class="form-control "  id="user" type="text"  name="user" placeholder="Name" >
                                <i class="fas fa-user b-font"></i>
                                
                                <i class="fas fa-check-circle valid"></i>
                                <i class="fas fa-exclamation-circle valid"></i>
                                <small>Error Message</small>
                                
                            </div>
                            <div class="form-group f1 ">
                                <input class="form-control " id="mail" type="email" name="mail" placeholder="Email">
                                <i class="fas fa-envelope b-font b1"></i>
                                
                                <i class="fas fa-check-circle valid"></i>
                                <i class="fas fa-exclamation-circle valid"></i>
                                <small>Error Message</small>
                                
                            </div>
                             <div class="form-group f">
                                <input class="form-control " id="mail1" type="email" name="mail_login" placeholder="Email">
                                <i class="fas fa-envelope b-font b"></i>
                                
                                <i class="fas fa-check-circle valid"></i>
                                <i class="fas fa-exclamation-circle valid"></i>
                                <small>Error Message</small>
                                
                            </div>
                            <div class="form-group ">
                                <input class="form-control" id="pass" type="password" name="pass" placeholder="Password">
                                <i class="fas fa-unlock-alt b-font"></i>
                              	
                              	<i class="fas fa-check-circle valid "></i>
                                <i class="fas fa-exclamation-circle valid"></i>
                                <small>Error Message</small>
                              
                            </div>
                          
                            <div class="form-group">
                                <a href="forgot.jsp" style="text-decoration:none;"><span class="b-forgot">Forgot your password?</span></a>
                            </div>
                            <button type=" button" id="sbtn"    class="btn btn-info sign_up">Sign Up</button>
                             <button type=" button" id="sbtn1"   class="btn btn-info sign_up1">Sign In</button>
                        </form>
                        
                        
                    </div>
                </div> 

            </div>
        </div>
    </div>
</div>



</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
var form=document.getElementById("logreg");
var user=document.getElementById("user");
var mail=document.getElementById("mail");
var pass=document.getElementById("pass");




$(document).ready(function(){
	 $('.sign_up1').hide();
	 $('#mail1,.b,.f').hide();
	 
	var btn=$('.sign_in').html();
	
	if(btn=="Sign In")
		{
		form.addEventListener('submit', function(e) {
			e.preventDefault();
			checkInputs();
		});
	}

	
	
		 $('.sign_up1').click(function(){

			 callServlet();

			 });

		
	


	
	$('.swift').click(function(){
	var signButton = $(this).html();
								      
	if(signButton == 'Sign Up')
	{
	  
		 //$('.sign_up').html('Sign Up'); // sign up button text change
		 
		 $('.sign_up').show();
		
		$('.sign_up1').hide();
		 $('#mail1,.b,.f').hide();
		 $('#mail,.b1,.f1').show();
		 
	     $('.sign_in').html('Sign In'); // sign in button text change
	     $('.swift_right').hide(); // second logo hide
	     $('.b-forgot').hide(); // forgot option hide
	     $('.form_title').html('Create Account');
	     $('.b-subtext').html('or use your email for registration');
	     $('.user_title').html('Welcome to e-Ducation');
	     $('.user_subTitle').html('To keep Connected with us please </br> login with your personal info.');
	     $('.b-title').css('margin-top','0px');
	     $('.form-control').css('margin-bottom','-20px');
	     $('.swift_left').show();
	     $('.username').show();
	     $('.b-wrapper').removeClass('swift_element');
	     

	    
	
	}
	else{

		 
		$('.sign_up1').show();
		
		 $('.sign_up').hide();
		
		 $('#mail,.b1,.f1').hide();
		 $('#mail1,.b,.f').show();
		 
	       // $('.sign_up').html('Sign In'); // sign up button text change
	        $('.sign_in').html('Sign Up'); // sign in button text change
	        $('.swift_right').show(); // second logo show
	        $('.b-forgot').show(); // forgot option show
	        $('.form_title').html('Sign in to Guide').css('margin-top','100px'); // form title text change
	        $('.b-subtext').html('or use your email account'); // form sub title text change
	        $('.user_title').html('Hello, Student'); // user title text change
	        $('.user_subTitle').html('Enter your personal details </br> and start journey with us.'); // user sub title text change
	        $('.b-title').css('margin-top','100px'); // user section add margin top in css
	        $('.swift_left').hide(); // default logo hide
	        $('.username').hide(); // form user field hide
	        $('.b-wrapper').addClass('swift_element'); // add reverse
	      
	    
	}

});



	function preventBack()
	{
		window.history.forward();
	}
	setTimeout("preventBack()",0);
	window.onunload=function(){null};
		
	
});


function checkInputs()
{

var userValue=user.value.trim();
var mailValue=mail.value.trim();
var passValue=pass.value.trim();



function isEquall()
{
	$.post('CheckMail.jsp',{mail:mailValue},
			function(data)
			{
			
			setErrorFor(mail,data);
			
			});
	
	}




	if(userValue === '')
		{
		
		setErrorFor(user,'username cannot be blank');
		
	}
	else if(!isUser(userValue))
		{
		setErrorFor(user,'Username shoulbe greater than three');
		
	}
	else
		{
			
			setSuccessFor(user);
			
		}

	if(mailValue === '')
	{
		
		setErrorFor(mail,'Email cannot be blank');
		
	}
	else if(!isEmail(mailValue))
		{
		setErrorFor(mail,'Email is not valid');
		
		}
	
	else
		{
			
			setSuccessFor(mail);
			
		}


	if(passValue === '')
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
			
		}
	if(userValue != ''  &&  mailValue != ''  &&  passValue != '' && isPass(passValue))
		{
		isEquall();
		callServlet2();
		
		}
	
	else
		{
		checkInputs();
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


function isEmail(email)
{
	return /^([a-zA-Z0-9\.-]+)@([a-zA-Z-]+).([a-z]{2,8})(\.[a-z]{2,8})?$/.test(email);
	
}

function isPass(pass)
{
	return /(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@_#<>?|.=\+*,;:&^%$!~`])[a-zA-Z0-9@_<>?|.=\+*,;:&^%$!~`\s]{8,}/.test(pass);
}

function isUser(user)
{
	return /^(?=.*[a-zA-Z\s])[a-zA-Z\s]{3,}$/.test(user);
}





function callServlet(){
	
	document.getElementById("logreg").action="Login";
	document.getElementById("logreg").method='get';
	document.getElementById("logreg").submit();
	}



function callServlet2(){
	
	document.getElementById("logreg").action="Registration";
	document.getElementById("logreg").method='post';
	document.getElementById("logreg").submit();
	
}







</script>

</html>

