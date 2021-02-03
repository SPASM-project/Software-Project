<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.SPASM.model.ForgotModel"%>
      <%@page import="com.SPASM.required.SendMail"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
if(b) {
	
	session.setAttribute("authcode", u);
	


%>
Enter security code
<form action="VerifyCodeServlet" method="post">
Please check your email for a message with your code. Your code is 6 digits long.

	<input type="text" name="authcode" placeholder="Enter Code"><br>
	<input type="submit" value="continue"><br><br>
</form>
<%} %>
</body>
</html>