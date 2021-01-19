<%@page import="com.SPASM.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    



<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view file</title>
</head>
<body>


    
        
        <%  
            String id=request.getParameter("id");
            System.out.println(id+"vi");
            Blob file = null;
            byte[ ] fileData = null ;
           
            try
            {    
            	 Db_Connection  dbconn=new Db_Connection () ;
                Connection conn= dbconn.Connection();
            
                String sqlString = "SELECT student_file FROM student_assignment_upload WHERE id = '"+id+"'";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
               out.clear();
                if (rs.next()) 
                {
                    file = rs.getBlob("student_file");
                    fileData=file.getBytes(1, (int)file.length());
                    
                   // RandomAccessFile raf = new RandomAccessFile(file, "r");
                    //FileChannel channel = raf.getChannel();
                    //ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
                   // PDFFile pdf = new PDFFile(buf);
                  //  PDFPage page = pdf.getPage(0);
                  
                } 
                response.reset();
                response.setContentType("application/pdf; charset = utf-8");
                request.setCharacterEncoding("UTF-8");
                response.setHeader("Content-Disposition", "inline");
                
                response.setContentLength(fileData.length);
                
                response.getOutputStream().write(fileData);
                
                
                response.getOutputStream().flush();
                response.getOutputStream().close();
                myStatement.close();
                rs.close();
                if(true) return;
            } catch (Exception ex) {} 
           
        %>
        
      
        
    
</body>
</html>