package com.SPASM.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.model.ForgotModel;


public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public VerifyCodeServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter ot=response.getWriter();
		String code=request.getParameter("authcode");
		System.out.println("c"+code);
		HttpSession session=request.getSession();
		ForgotModel u=(ForgotModel) session.getAttribute("authcode");
		
		System.out.println("u"+u.getCode());
		if(code.trim().equals(u.getCode().trim())) {
			String email=u.getEmail();
			response.sendRedirect("updatePassword.jsp?email="+email);
		}
		else {
			response.sendRedirect("forgot.jsp");
			
			
		}
	}

}
