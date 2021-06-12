package com.SPASM.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.DAO.Db_Connection;
import com.SPASM.model.AttendanceModel;
import java.sql.*;

public class AttendenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Db_Connection dbconn=new Db_Connection(); 
	DatabaseDAO dao;
    public AttendenceServlet() {
        super();
        dao=new DatabaseDAO();
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String date=request.getParameter("date");
		System.out.print(date);
		String present[]=request.getParameterValues("present");
	
		String classcode[]=request.getParameterValues("classcode");
		String classname[]=request.getParameterValues("classname");
		String teacher_name[]=request.getParameterValues("teacher_name");
		String stu_name[]=request.getParameterValues("stu_name");
		String stu_id[]=request.getParameterValues("stu_id");
		List<AttendanceModel> aml=new ArrayList<AttendanceModel>();
	    AttendanceModel am=new AttendanceModel();
		for(String p: classcode) {
//			am.setClasscode(p);
//			aml.add(am);
//			a=p;
			out.println(p);
		}
		String absent[]= {};
		for(String p: classname) {
		
//			am.setClassname(p);
//			aml.add(am);
//			b=p;
			out.println(p);
		}
		
		for(String p: teacher_name) {
					
			
//			am.setTeacher_name(p);
//			aml.add(am);
//			c=p;
			out.println(p);
		}
		for(String p: stu_name) {
//			am.setStu_name(p);
//			aml.add(am);
//			d=p;
			out.println(p);
		}
		for(String p: stu_id) {
			
//			am.setStu_id(Integer.parseInt(p));
//			aml.add(am);
//			h=Integer.parseInt(p);
			out.println(p);
		}
		for(String p:present) {
			
//			am.setPresent(p);
//			aml.add(am);
//			e=p;
			out.println(p);
		}
		
//		for(int i=0;i<stu_id.length;i++) {
//			if(present[i]=="0") {
//				absent[i]="1";
//			}
//			else {
//				absent[i]="0";
//			}
//			out.println(absent[i]+"a");
//		}
//		for(String p: absent) {
//			
////			am.setAbsent(p);
////			aml.add(am);
////			f=p;
//			out.println(p+"a");
//		}
		am.setDate(date);
//		System.out.println(!1);
		
			String sql="insert into attendence values(NULL,?,?,?,?,?,?,?,NULL)";
			Connection con= dbconn.Connection();
			PreparedStatement st;
			try {
				st = con.prepareStatement(sql);
				con.setAutoCommit(false);
				for(int i=0;i<stu_id.length;i++) {
				//for(User )
					 //am=i.next();
					 st.setString(1,classcode[i] );
					 st.setInt(2, Integer.parseInt(stu_id[i]));
					 st.setString(3, classname[i]);
					 
					 st.setString(4, stu_name[i]);
					 st.setString(5, teacher_name[i]);
					 st.setInt(6,Integer.parseInt(present[i]));
					 
					
					 st.setString(7,date);
					 st.addBatch();
				}
				
				int[] u=st.executeBatch();
				if(u.length==stu_id.length)
				{
						session.setAttribute("status","success");
					
				}else {
					session.setAttribute("status","error");
				}
				System.out.println(u.length+"=="+stu_id.length+"row inserted");
				con.commit();
				con.setAutoCommit(true);
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		
		
		
		
		/*create session*/
		
		String code=(String) session.getAttribute("classcode");
		String classn=(String) session.getAttribute("classname");
		session.setAttribute(code, classn);
		System.out.println("assign to:"+classcode);
		/*end*/
		response.sendRedirect("AddAttendance.jsp?code="+code+"&classname="+classn+"&author="+teacher_name[0]);//URL re-writing
		
	}
	

}
