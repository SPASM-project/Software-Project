<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
<h1>Welcome to virtual classroom</h1>
<a href="index.jsp"><button>Create</button></a>
<a href="JoinClass.jsp"><button>Join</button></a>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
String sql="SELECT * FROM teacher";
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualclassroom", "root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	  if(!rs.isBeforeFirst())
      {
%>
             <div><%out.print("No Files!"); %></div>
          <%
      }    
	if(rs.next())
	{
%>
<div>

<%out.println(rs.getString("classname")); %>
<%out.println(rs.getString("section")); %>
<%out.println(rs.getString("subject")); %>

<a href="CreateTeacher.jsp?classcode=<%rs.getString("classcode"); %>">view</a>

</div>


		
	<% }
	
	
	rs.close();
	st.close();
	con.close();
	
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>