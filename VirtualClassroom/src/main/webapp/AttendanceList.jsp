<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<title><%out.println(request.getParameter("classname"));%></title>
</head>
<!-- declaration.... -->
<%!String code; %>
<!-- session management.... -->
<%
if (request.getParameter("code") == null) {
	response.sendRedirect("CreateTeacher.jsp");
}
%>
<!-- getting value.... -->
<%
	code = request.getParameter("code");
	String classname=request.getParameter("classname");
		
	session.setAttribute("classcode", code);
	session.setAttribute("classname", classname);
	System.out.println("classcode in People.jsp:" + code);
%>
<!-- Connection Object.... -->			
<% Db_Connection  dbconn=new Db_Connection ();%>

<body>
<div class="container">
<form action="AttendenceServlet" method="post">
<!-- data-provide="datepicker"  -->
	
	
<div class="row mt-5">
<div class="col-12">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover" id="myTable">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Sl.no.</th>
      <th scope="col">Student Name</th>
      <th scope="col">Subject Name</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
<!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
<%
	String sql ="SELECT * FROM virtualclassroom.attendence where classcode=? order by id" ;
	try {
			Connection con= dbconn.Connection();
			PreparedStatement s=con.prepareStatement(sql);
			
			s.setString(1,code);
			
			ResultSet r=s.executeQuery();
		
			if (!r.isBeforeFirst()) {
		
				out.print("");
			
			}
		%>
	<tbody>
		<%
			int i=1;
			while (r.next()) {
						
		%>
			<tr>
      			<th scope="row"><%=i%></th>
      			<td><%=r.getString("stu_name")%></td>
      			<td><%=r.getString("subject") %></td>
      			<td><%=r.getString("date") %></td>
      			<td><%if(Integer.parseInt(r.getString("present"))==1) out.println("Present"); else out.println("Absent"); %></td>
    		</tr>				
			
		<%
		i++;
		}
			
		%>
		
		
	 </tbody>
<%
r.close();
s.close();
con.close();	
} catch (Exception e) {
e.printStackTrace();
}
%>	


</table>
<div class="pagination-container">
	<nav>
		<ul class="pagination"></ul>
	</nav>
</div>
</div>
</div>
</div>

</form>
</div>


</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">

 $(document).ready(function(){
	
	$('#myTable').DataTable();
	
	// $('#newrows').click(function(){
		//var add='<tr>'
			//add+='<th scope="row"><input type="text" name="empname"></th>'
			//add+='<td ><input type="text" name="empname"></td>'
			//add+='<td><input type="text" name="empname"></td>'
			//add+='<td><input type="text" name="empname"></td>'
			//add+='</tr>';
	//$('table tbody').append(add);
	 //});
	 
	 	               
	 	//$('.input-daterange #datetime').datepicker({
	 		//format: 'mm/dd/yyyy',
	 	    //startDate: '0',
	 	   // todayHighlight:'true',
	 	   // autoclose:'false',
	 	    //weekStart:'1',
	 	    //beforeShowDate:'true',
	 	    //showOtherDays:'true'
	 	   
	 		
	 		//});
	 	
	 	//$("#read").change(function(){
			//if(this.checked){
				//alert();
				//$(this).attr('value')="1";
				//}
			//else{
				//$(this).attr('value')="0";
				//}
			//});
	 
 });
</script>
</html>