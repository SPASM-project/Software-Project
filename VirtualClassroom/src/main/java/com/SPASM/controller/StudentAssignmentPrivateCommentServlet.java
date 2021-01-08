package com.SPASM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.StudentAssignmentPrivateCommentModel;


public class StudentAssignmentPrivateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public StudentAssignmentPrivateCommentServlet() {
        super();
       
    }
    DatabaseDAO dao=new DatabaseDAO();
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		System.out.println("welcome to StudentAssignmentPrivateCommentServlet....");
		
   		 response.setContentType("text/html;charset=UTF-8");
   		 String private_comment=request.getParameter("private-cmnt");
   		 String id= request.getParameter("id");
   		 String author=request.getParameter("authorName");
   		 String comment_title=request.getParameter("title");
   		 String comment_classcode=request.getParameter("code");
   		 
   		 System.out.println(private_comment);
   		 System.out.println(id);
   		 System.out.println(author);
   		 System.out.println(comment_title);
   		 
   		 System.out.println(comment_classcode);
   		 
   		 	HttpSession session=request.getSession();
   			String classcode=(String) session.getAttribute("classcode");
   			String classname=(String) session.getAttribute("classname");
   			String mailId=(String) session.getAttribute("mailId");
   			System.out.println("student assignment comment to:"+id);
 			
   			
   			StudentAssignmentPrivateCommentModel sarm=new StudentAssignmentPrivateCommentModel();
   			sarm.setPrivate_comment(private_comment);
   			sarm.setAuthor(author);
   			sarm.setComment_classcode(comment_classcode);
   			sarm.setComment_title(comment_title);
   			sarm.setId(id);
   			
   			try {
   				dao.insertStudentAssignmentPrivateComment(sarm);
   			} catch (ClassNotFoundException e) {
   				
   				e.printStackTrace();
   			}
   		 
   			response.sendRedirect("StudentAssignmentView.jsp?code="+classcode+"&classname="+classname+"&author="+author+"&id="+id+"&mailId="+mailId);//URL re-writing
	
	

}
}