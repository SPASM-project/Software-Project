package com.SPASM.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.StudentAssignmentViewServletModel;

@MultipartConfig(maxFileSize = 60177215)
public class StudentAssignmentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public StudentAssignmentViewServlet() {
        super();  
    }
    InputStream inputStream = null;
    DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome to StudentAssignmentView...");
		
		 response.setContentType("text/html;charset=UTF-8");
			
			String id=request.getParameter("id");
			System.out.println(request.getParameter("authorName")+id);
			String author=request.getParameter("authorName");
			
			int sid=Integer.parseInt(request.getParameter("sid"));
			
			String title=request.getParameter("title");
			System.out.println("title:"+" "+title);
			
			Part filePart = request.getPart("file_uploaded");
			 
			
			 
	        
	         if (filePart != null) 
	         {
	             System.out.println(filePart.getSubmittedFileName());
	             System.out.println(filePart.getSize());
	             System.out.println(filePart.getContentType());
	             inputStream = filePart.getInputStream();
	         }
			
			HttpSession session=request.getSession();
			String classcode=(String) session.getAttribute("classcode");
			String classname=(String) session.getAttribute("classname");
			String mailId=(String) session.getAttribute("mailId");
			
			System.out.println("student assignment post to:"+id);
			
			
			StudentAssignmentViewServletModel savs=new StudentAssignmentViewServletModel();
			 
			savs.setAssignId(id);
			savs.setAuthorName(author);
			savs.setCode(classcode);
			savs.setFile(filePart);
			savs.setFilename(filePart.getSubmittedFileName());
			savs.setTitle(title);
			savs.setSid(sid);
			try {
				dao.insertStudentAssignment(savs, inputStream);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("StudentAssignmentView.jsp?code="+classcode+"&classname="+classname+"&author="+author+"&id="+id+"&mailId="+mailId);//URL re-writing
	}
	
}
