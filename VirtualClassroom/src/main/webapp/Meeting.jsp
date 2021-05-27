<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>

  <script src='https://meet.jit.si/external_api.js'></script>
  <title><%out.println(request.getParameter("classname"));%></title>
</head>
<%
		if (request.getParameter("code") == null) {
			

		response.sendRedirect("CreateTeacher.jsp");
	}
%>
<%
		 
		String code = request.getParameter("code");
		String classname=request.getParameter("classname");
		
		session.setAttribute("classcode", code);
		session.setAttribute("classname", classname);
		System.out.println("classcode in Meeting.jsp:" + code);
%>
<body class="bg-dark">
 

<div class="container" id="jitsi-container">
	<div class="row" id="r">
		<div class="col-4 offset-4" id="c">
			<button id="start" class="btn btn-light " type="button" style="margin-top:40vh;" >Start Meeting</button>
			<a href="CreateTeacher.jsp?code=<%out.print(code);%>&classname=<%out.print(classname);%>&author=<%=request.getParameter("author")%>" class="btn btn-secondary ml-1" id="end" type="button" style="margin-top:40vh;" >Back Classroom</a>
		</div>
		
	
	</div>
	
	

</div>
 
<script>
var button = document.querySelector('#start');
var end = document.querySelector('#end');

var r = document.querySelector('#r');
var c = document.querySelector('#c');

var container = document.querySelector('#jitsi-container');
var api = null;

button.addEventListener('click', () => {
	
	
	r.style.display= "none";
	c.style.display= "none";
	
	button.style.display= "none";
	end.style.display= "none";
	
    var possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var stringLength = 30;
   
    function pickRandom() {
    return possible[Math.floor(Math.random() * possible.length)];
    }
 
var randomString = Array.apply(null, Array(stringLength)).map(pickRandom).join('');
 
    var domain = "meet.jit.si";
    var options = {
        "roomName": randomString,
        "parentNode": container,
        //"width": screen.width-2,
        "height": screen.height-139,
    };
    api = new JitsiMeetExternalAPI(domain, options);
});
 
</script>
</body>
</html>
