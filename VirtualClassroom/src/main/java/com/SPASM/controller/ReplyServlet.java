package com.SPASM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.ReplyModel;




public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ReplyServlet() {
        super();
       
    }

    DatabaseDAO d=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String new_reply_text=request.getParameter("new-reply");
		String new_reply_code=request.getParameter("code");
		String new_reply_author=request.getParameter("author");
		System.out.println(new_reply_code+new_reply_text);
		HttpSession session=request.getSession();
		String classcode=(String) session.getAttribute("classcode");
		String classname=(String) session.getAttribute("classname");
		
		ReplyModel rm=new ReplyModel();
		rm.setNew_reply_code(new_reply_code);
		rm.setNew_reply_text(new_reply_text);
		rm.setNew_reply_author(new_reply_author);
	try {
			d.insertReply(rm);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	response.sendRedirect("CreateTeacher.jsp?code="+classcode+"&classname="+classname+"&author="+new_reply_author); //URL re-writing
	}

	
}
