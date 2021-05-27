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
<%!String code;int i; %>
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




<!-- data-provide="datepicker"  -->
	
	

<div class="col-12">
<div class="table-responsive">
<table class="table table-striped table-bordered table-hover" id="myTable">
  <thead class="thead-dark">
    <tr>
      <th scope="col" class="text-center">Sl.no.</th>
      <th scope="col" class="text-center">Student Name</th>
      <th scope="col" class="text-center">Total Attendance</th>
      <th scope="col" class="text-center">Average attendance</th>
      <th scope="col" class="text-center">Status</th>
    </tr>
  </thead>
<!--database connectivity for post msg-- "SELECT id,post,date FROM upload WHERE classcode=?"-->
<%
	String sql ="select * from student_class inner join teacher on student_class.scode=teacher.classcode where classcode=? order by id" ;
	String sql1="SELECT sum(present) as total_attendance, avg(present) as avarage_attendance FROM virtualclassroom.attendence where stu_id=? and classcode=? and date between ? and ? order by id";
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
			i=1;
			while (r.next()) {
					
	
try {
			Connection con1= dbconn.Connection();
			PreparedStatement s1=con1.prepareStatement(sql1);
			
			s1.setInt(1,r.getInt("id"));
			s1.setString(2,code);
			s1.setString(3,(String)session.getAttribute("sdate"));
			s1.setString(4,(String)session.getAttribute("edate"));
			ResultSet r1=s1.executeQuery();
		
			if (!r1.isBeforeFirst()) {
		
				out.print("");
			
			}
			
			while (r1.next()) {
						
		%>
			<tr>
      			<th scope="row" class="text-center"><%=i%></th>
      			<td class="text-center"><%=r.getString("sname")%></td>
      			<td class="text-center"><%=r1.getInt("total_attendance") %></td>
      			<td class="text-center"><%=r1.getFloat("avarage_attendance")*100%>%</td>
      			<td class="text-center">
      			<%if((r1.getFloat("avarage_attendance")*100)>60.0){%>
      			<i class="fa fa-circle text-success" aria-hidden="true"></i>
      			<%}else if((r1.getFloat("avarage_attendance")*100)<60.0 && (r1.getFloat("avarage_attendance")*100)>35.0) {%>
      			<i class="fa fa-circle text-warning" aria-hidden="true"></i>
      			<%}else{%>
      			<i class="fa fa-circle text-danger" aria-hidden="true"></i>
      			<%} %>
      			</td>
    		</tr>				
		<%}
r1.close();
s1.close();
con1.close();	
} catch (Exception e) {
e.printStackTrace();
}
%>	
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
	
	//$('#myTable').DataTable();
	
	//$("#btn").on('click',function(){
		//document.getElementById('attendance').style.display='block';
	//});
	
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
