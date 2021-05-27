package com.SPASM.controller;

import java.io.IOException;
//import java.io.PrintWriter;

//import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
  public Login() {
      super();
      
  }
  protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
  {
	  
	System.out.println("welcome login...");
  	String mail=request.getParameter("mail_login");
  	String pass=request.getParameter("pass");
  	DatabaseDAO dao=new DatabaseDAO();
  	if(dao.loginCheck(mail, pass))
  	{
  			HttpSession session=request.getSession();	
	    	session.setAttribute("mailid", mail);
	    	response.sendRedirect("StartingPage.jsp?mail="+mail);
  	
  	}
  	else
  	{
  		response.sendRedirect("ClassLogin.jsp");
  	}

  	
  }
}
