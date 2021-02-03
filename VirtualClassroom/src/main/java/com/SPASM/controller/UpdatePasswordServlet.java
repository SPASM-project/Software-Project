package com.SPASM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.UpdatePasswordModel;


public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdatePasswordServlet() {
        super();
       
    }

	DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("newPassword");
		System.out.println("s"+email+password);
		UpdatePasswordModel upm=new UpdatePasswordModel();
		upm.setEmail(email);
		upm.setPassword(password);
		try {
			dao.updatePassword(upm);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("StartingPage.jsp?mail="+email);
	}

}
