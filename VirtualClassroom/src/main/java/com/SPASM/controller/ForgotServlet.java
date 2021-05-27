package com.SPASM.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.ForgotModel;



public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ForgotServlet() {
        super();
        
        
    }
    
	DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		HttpSession session=request.getSession();
		ForgotModel fm=new ForgotModel();
		
		fm.setEmail(email);
		if(dao.mailCheck(fm))
	  	{
		    	
		    	session.setAttribute("mailModel", fm);
		    	response.sendRedirect("SendOTPView.jsp");
				out.println("mail found");
	  	
	  	}
	  	else
	  	{
	  		//out.println("not found");
	  		session.setAttribute("error", "Mail not found");
	  		response.sendRedirect("forgot.jsp");
	  	}


	}

}
