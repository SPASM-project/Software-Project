package com.SPASM.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.AssignmentMarksModel;


public class AssignmentMarksUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AssignmentMarksUpdateServlet() {
        super();
       
    }

	
    DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome to AssignmentMarksServlet..");
		String stuAssignId=request.getParameter("stuAssignId");
		String stuId=request.getParameter("stuId");
		int marks=Integer.parseInt(request.getParameter("marks"));
		System.out.println("stuId:"+stuAssignId+"stuName:"+stuId);
		System.out.println(marks);
		
		AssignmentMarksModel amm=new AssignmentMarksModel();
		amm.setStuAssignId(stuAssignId);
		amm.setStuId(stuId);
		amm.setMarks(marks);
		
		try {
			dao.insertStudentAssignmentUpdateMarks(amm);
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
