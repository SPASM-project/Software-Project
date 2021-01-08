package com.SPASM.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.PostMsg;


@MultipartConfig(maxFileSize = 60177215)
public class StudentPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public StudentPostServlet() {
        super();
       
    }

	

    InputStream inputStream = null;
   DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("welcome student post servlet");
		//List<String> st=new ArrayList<String>();
	//st.add(request.getParameter("msg"));
	//PrintWriter out=response.getWriter();
		 response.setContentType("text/html;charset=UTF-8");
		
		String st=request.getParameter("msg");
		System.out.println(request.getParameter("authorName"));
		String author=request.getParameter("authorName");
		 Part filePart = request.getPart("file_uploaded");
         
         if (filePart != null) 
         {
             System.out.println(filePart.getSubmittedFileName());
             System.out.println(filePart.getSize());
             System.out.println(filePart.getContentType());

             inputStream = filePart.getInputStream();
         }
		
		HttpSession session=request.getSession();
		String classcode=(String) session.getAttribute("classcode");
		String classname=(String) session.getAttribute("classname");
		String mailId=(String) session.getAttribute("mailId");
		System.out.println("post to:"+classcode);
		
	PostMsg m=new PostMsg();
	m.setMsg(st);
	m.setCode(classcode);
	m.setFilename(filePart.getSubmittedFileName());
	m.setFile(filePart);
	m.setAuthorName(author);
    
	try {
		dao.msgInsert(m,inputStream);
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}

	response.sendRedirect("CreateStudent.jsp?code="+classcode+"&classname="+classname+"&author="+author+"&mailId="+mailId);//URL re-writing
	}
}
