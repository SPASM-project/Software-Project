<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String email=request.getParameter("email");
%>
<form action="UpdatePasswordServlet" method="post">
	<input type="hidden" name="email" value="<%=email%>" ><br>
	New Password
	<input type="password" name="newPassword" ><br>
	<input type="submit" value="continue"><br><br>
</form>
</body>
</html>