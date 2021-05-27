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
<title><%out.println(request.getParameter("classname"));%></title>
</head>
<!-- declaration.... -->
<%!String code; %>
<!-- session management.... -->
<%
//if (request.getParameter("code") == null) {
	//response.sendRedirect("CreateTeacher.jsp");
//}
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
	<div class="row ">
	<div class="col-4 p-2 offset-4">
	<div class="form-group input-daterange" >
			<label for="datetime">Date</label>
			<input type='date' name="date" class="form-control "  id='datetime'  value="<%=LocalDate.now()%>" />
	</div>
	</div>
	</div>
	
<div class="row">
<div class="col-12">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Sl.no.</th>
      <th scope="col">Student Name</th>
      <th scope="col">Subject</th>
      <th scope="col">Present</th>
      <th scope="col">Absent</th>
    </tr>
  </thead>
<!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
<%
	String sql ="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=? order by id" ;
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
      			<td><%=r.getString("sname")%></td>
      			<td><%=classname %></td>
      			<td>
      				<div class="form-check">
        				<input class="form-check-input a" id='read' name='present' type="checkbox" value="1">
	       				
      				</div>	
      			</td>
      			<td>
      				<div class="form-check">
        				<input class="form-check-input a" id='<%=r.getInt("id")%>' name='present' type="checkbox" value="0">
	       				
      				</div>	
      			
      			
      				
      				<input type="hidden" value='<%=r.getString("sname")%>' name="stu_name">
      				<input type="hidden" value='<%=request.getParameter("author")%>' name="teacher_name">
      				<input type="hidden" value='<%=code%>' name="classcode">
      				<input type="hidden" value='<%=classname%>' name="classname">
      				<input type="hidden" value='<%=r.getInt("id")%>' name="stu_id">
      			</td>
    		</tr>				
			
		<%
		i++;
		}
			
		%>
		<tr>
		<td colspan=5 class="text-center">
		<input type="submit" class="btn btn-warning" value="Save" id="btn">
		</td>
		</tr>
		
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
</div>
</div>
</div>

</form>
</div>


</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">
 $(document).ready(function(){
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