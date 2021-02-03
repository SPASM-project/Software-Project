<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.SPASM.model.ForgotModel"%>
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
<form  action="verify.jsp" method="post">
Reset Your Password
send code via <%=fm.getEmail() %>
<input type="hidden" value="<%=fm.getEmail() %>" name="email">
<input type="submit" value="continue">
</form>
</body>
</html>