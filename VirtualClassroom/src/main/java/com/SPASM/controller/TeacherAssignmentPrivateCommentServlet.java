package com.SPASM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.TeacherAssignmentPrivateCommentModel;


public class TeacherAssignmentPrivateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public TeacherAssignmentPrivateCommentServlet() {
        super();
       
    }

	
	DatabaseDAO dao=new DatabaseDAO();
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("welcome to TeacherAssignmentPrivateCommentServlet...");
			String stuAssignId=request.getParameter("stuAssignId");
			String stuName=request.getParameter("stuId");
			String privateComment=request.getParameter("privateComment");
			System.out.println(stuAssignId+stuName);
			System.out.println(privateComment);
			
			TeacherAssignmentPrivateCommentModel amm=new TeacherAssignmentPrivateCommentModel();
			amm.setStuAssignId(stuAssignId);
			amm.setStuName(stuName);
			amm.setPrivateComment(privateComment);
			
			try {
				dao.insertTeacherAssignmentPrivateComment(amm);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			HttpSession session=request.getSession();
			String classcode=(String) session.getAttribute("classcode");
			String classname=(String) session.getAttribute("classname");
			String author=(String) session.getAttribute("author");
			String id=(String) session.getAttribute("id");
			String title=(String) session.getAttribute("title");
			
		
			response.sendRedirect("TacherAssignmentView.jsp?code="+classcode+"&classname="+classname+"&author="+author+"&id="+id+"&title="+title);//URL re-writing
	}

}
