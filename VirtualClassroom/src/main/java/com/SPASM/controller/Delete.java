package com.SPASM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classcode=request.getParameter("delete");
		//response.getWriter().print(classcode);
		HttpSession session=request.getSession();	
    	String mail=(String) session.getAttribute("mailid");
    	//response.getWriter().print(session.getAttribute("mailid"));
    	DatabaseDAO dao=new DatabaseDAO();
    	if(dao.deleteClassroom(classcode)) {
    		response.sendRedirect("StartingPage.jsp?mail="+mail);
    	}
    	else {
    		System.out.println("not deleted");
    	}
    	
	}

}
