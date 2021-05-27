package com.SPASM.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AvarageAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AvarageAttendanceServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate=request.getParameter("sdate");
		String endDated=request.getParameter("edate");
		String author=request.getParameter("author");
		/*create session*/
		HttpSession session=request.getSession();
		String classcode=(String) session.getAttribute("classcode");
		String classname=(String) session.getAttribute("classname");
		session.setAttribute("sdate", startDate);
		session.setAttribute("edate", endDated);
		System.out.println("Dates:"+startDate+" "+endDated);
		/*end*/
		response.sendRedirect("AvarageAttendance.jsp?code="+classcode+"&classname="+classname+"&author="+author);//URL re-writing
		
	}

}
