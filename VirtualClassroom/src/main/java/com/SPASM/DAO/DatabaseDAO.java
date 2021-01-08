package com.SPASM.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SPASM.model.AssignmentMarksModel;
import com.SPASM.model.PostMsg;
import com.SPASM.model.RegistrationModel;
import com.SPASM.model.ReplyModel;
import com.SPASM.model.Student;
import com.SPASM.model.StudentAssignmentPrivateCommentModel;
import com.SPASM.model.StudentAssignmentReplyModel;
import com.SPASM.model.StudentAssignmentViewServletModel;
import com.SPASM.model.Teacher;
import com.SPASM.model.TeacherAssignment;
import com.SPASM.model.TeacherAssignmentPrivateCommentModel;


public class DatabaseDAO {
	
	Db_Connection dbconn=new Db_Connection();
	
	/*check for login*/
	
	public boolean loginCheck(String mail,String pass)
	{
		System.out.println(mail+" "+pass);
		String sql="SELECT * FROM registration WHERE mailid=? AND password=md5(?)";
		try {
			
				
			Connection con= dbconn.Connection();
				System.out.println("connected");
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1, mail);
				st.setString(2,pass);
				ResultSet rs=st.executeQuery();
				
				while(rs.next())
				{
					return true;
				}
		}catch(Exception e)
		{
			e.printStackTrace();
			}
		return false;
	}
	
	/*registration for class*/
	
public void registrationInsert(RegistrationModel rm) throws ClassNotFoundException {
		
		
		System.out.println("comming..."+rm.getMailId());
		String sql="INSERT INTO registration ( name,mailid,password) VALUES (?,?,md5(?))";
		try
		{
			
			Connection con= dbconn.Connection();
			
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, rm.getUser());
			st.setString(2, rm.getMailId());
			st.setString(3, rm.getPassword());
			//st.setString(4, rm.getContactNo());
			
			
			int i=st.executeUpdate();
			System.out.println(i+"row inserted registration table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public void insert(Teacher h) throws ClassNotFoundException {
		
		
		System.out.println("comming..."+h.getMailid());
		String sql="INSERT INTO teacher (classname, section, name, subject, mailid,classcode) VALUES (?,?,?,?,?,?)";
		//String sql="INSERT INTO public.teacher (classname, mailid, name, section, subject,classcode) VALUES (?,?,?,?,?,?)";
		try
		{
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con= dbconn.Connection();
			
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,h.getClassname());
				st.setString(5,h.getMailid());
			st.setString(3,h.getName());
			//st.setString(2,h.getClassdescription());
			st.setString(2,h.getSection());
			
			st.setString(4,h.getSubject());
			//st.setString(6, h.getTeachername());
			
			//st.setString(8,h.getPassword());
			st.setString(6, h.getClasscode());
			int i=st.executeUpdate();
			System.out.println(i+"row inserted teacher table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public void studentInsert(Student s) throws ClassNotFoundException {
		
		
		
		String sql="INSERT INTO student_class (smailid, scontactno,scode,sname) VALUES (?,?,?,?)";
		try
		{
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con= dbconn.Connection();
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,s.getMailid());
			st.setString(2,s.getContactno());
			st.setString(3, s.getStudentCode());
			st.setString(4, s.getSname());
			int i=st.executeUpdate();
			System.out.println(i+"row inserted for student table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
public boolean search(String classcode) throws ClassNotFoundException {
		
		
		
		String sql="SELECT * FROM teacher WHERE classcode=?";
		try
		{
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con= dbconn.Connection();
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,classcode);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

public void msgInsert(PostMsg h,InputStream is) throws ClassNotFoundException {
	
	
	
	String sql="INSERT INTO upload (classcode,post,document,filename,date,time,msg_author) VALUES (?,?,?,?,?,?,?)";
	try
	{
		//Db_Connection  dbconn=new Db_Connection () ;
		Connection con= dbconn.Connection();
				
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        System.out.println("comming in ..");
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,h.getCode());
		st.setString(2, h.getMsg());
		
		if (is != null) 
	    {
			
             st.setBinaryStream(3, is, (int) h.getFile().getSize());
             st.setString(4,h.getFilename());
             
	    }
		
		st.setDate(5, sqlDate);
		st.setTime(6, sqlTime);
		st.setString(7, h.getAuthorName());
		int i=st.executeUpdate();
		System.out.println(i+"row inserted for upload table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}
public void insertReply(ReplyModel c) throws ClassNotFoundException {
	//	System.out.println(h.getNew_com_code()+h.getNew_com_text());
		//driver();
	
		String sql="INSERT INTO upload_comment (msg_id,comment,date_cmnt,time_cmnt,reply_author) VALUES (?,?,?,?,?)";
		try
		{
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con= dbconn.Connection();
			
			
			java.util.Date utilDate = new java.util.Date();
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	        
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,c.getNew_reply_code());
			st.setString(2,c.getNew_reply_text());
			
			
			st.setDate(3, sqlDate);
			st.setTime(4, sqlTime);
			
			st.setString(5, c.getNew_reply_author());
			int i=st.executeUpdate();
			System.out.println(i+"row inserted teacher table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

public void assignmentTeacherInsert(TeacherAssignment ta,InputStream is) throws ClassNotFoundException {
	
	
	
	String sql="INSERT INTO assignment (classcode,classname,title,instruction,points,due_time,due_date,topic,assign_file,assign_file_name,date,time,author) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	try
	{
		//Db_Connection  dbconn=new Db_Connection () ;
		Connection con= dbconn.Connection();
				
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        System.out.println("comming in assignment insertion ..");
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,ta.getClasscode());
		st.setString(2,ta.getClassname());
		st.setString(3,ta.getTitle());
		st.setString(4,ta.getInstruction());
		st.setString(5,ta.getPoints());
		st.setString(6,ta.getDueTime());
		
		st.setString(7,ta.getDue());
		st.setString(8,ta.getTopic());
		
		
		
		if (is != null) 
	    {
			
             st.setBinaryStream(9, is, (int) ta.getAssignFile().getSize());
             st.setString(10,ta.getAssign_file_name());
             
	    }
		
		st.setDate(11, sqlDate);
		st.setTime(12, sqlTime);
		st.setString(13,ta.getAuthorName());
		int i=st.executeUpdate();
		System.out.println(i+"row inserted for upload table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}



public void insertStudentAssignment(StudentAssignmentViewServletModel c,InputStream is) throws ClassNotFoundException {
	//	System.out.println(h.getNew_com_code()+h.getNew_com_text());
		//driver();
	
		String sql="INSERT INTO student_assignment_upload (assign_id ,	author,	classcode , student_file, student_file_name, date,	time, title, sid) VALUES (?,?,?,?,?,?,?,?,?)";
		try
		{
			//Db_Connection  dbconn=new Db_Connection () ;
			Connection con= dbconn.Connection();
			
			
			java.util.Date utilDate = new java.util.Date();
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	        
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,c.getAssignId());
			st.setString(2,c.getAuthorName());
			st.setString(3, c.getCode());
			if (is != null) 
		    {
				
	             st.setBinaryStream(4, is, c.getFile().getSize());
	             st.setString(5,c.getFilename());
	             
		    }
			
			st.setDate(6, sqlDate);
			st.setTime(7, sqlTime);
			st.setString(8,c.getTitle());
			st.setInt(9, c.getSid());
			
			int i=st.executeUpdate();
			System.out.println(i+"row inserted student_assignment_upload table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

public void insertStudentAssignmentReply(StudentAssignmentReplyModel c) throws ClassNotFoundException {
	
	
		String sql="INSERT INTO student_assignment_reply ( assign_id, title, author, asign_comment,assign_classcode,date,time) VALUES (?,?,?,?,?,?,?);";
		try
		{
			Connection con= dbconn.Connection();
			
			
			java.util.Date utilDate = new java.util.Date();
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	        
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,c.getId());
			st.setString(2,c.getComment_title());
			st.setString(3, c.getAuthor());
			st.setString(4,c.getAssign_comment());
			st.setString(5,c.getComment_classcode());
			st.setDate(6, sqlDate);
			st.setTime(7, sqlTime);
			
			
			int i=st.executeUpdate();
			System.out.println(i+"row inserted student_assignment_reply table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}




public void insertStudentAssignmentPrivateComment(StudentAssignmentPrivateCommentModel c) throws ClassNotFoundException {
	
	
	String sql="INSERT INTO student_assignment_private_comment (private_id, title, author, private_comment,private_classcode,date,time) VALUES (?,?,?,?,?,?,?);";
	try
	{
		Connection con= dbconn.Connection();
		
		
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,c.getId());
		st.setString(2,c.getComment_title());
		st.setString(3, c.getAuthor());
		st.setString(4,c.getPrivate_comment());
		st.setString(5,c.getComment_classcode());
		st.setDate(6, sqlDate);
		st.setTime(7, sqlTime);
		
		
		int i=st.executeUpdate();
		System.out.println(i+"row inserted student_assignment_private_comment table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}



public void insertStudentAssignmentMarks(AssignmentMarksModel c) throws ClassNotFoundException {
	
	
	String sql="INSERT INTO student_marks (stu_assign_id,marks,date,time,sid) VALUES (?,?,?,?,?);";
	try
	{
		Connection con= dbconn.Connection();
		
		
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,c.getStuAssignId());
		st.setInt(2,c.getMarks());
		
		st.setDate(3, sqlDate);
		st.setTime(4, sqlTime);
		st.setInt(5, Integer.parseInt(c.getStuId()));
		
		int i=st.executeUpdate();
		System.out.println(i+"row inserted student_marks table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}


public void insertTeacherAssignmentPrivateComment(TeacherAssignmentPrivateCommentModel c) throws ClassNotFoundException {
	
	
	String sql="INSERT INTO teacher_private_comment (stu_assign_id,private_comment,date,time) VALUES (?,?,?,?);";
	try
	{
		Connection con= dbconn.Connection();
		
		
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,c.getStuAssignId());
		st.setString(2,c.getPrivateComment());
		
		st.setDate(3, sqlDate);
		st.setTime(4, sqlTime);
		
		
		int i=st.executeUpdate();
		System.out.println(i+"row inserted teacher_private_comment table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}


public void insertStudentAssignmentUpdateMarks(AssignmentMarksModel c) throws ClassNotFoundException {
	
	
	String sql="update student_marks set marks=? where stu_assign_id=?";
	try
	{
		Connection con= dbconn.Connection();
		
		
		//java.util.Date utilDate = new java.util.Date();
        //java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        //java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1,c.getMarks());
		st.setString(2,c.getStuAssignId());
		
		
		//st.setDate(3, sqlDate);
		//st.setTime(4, sqlTime);
		
		
		int i=st.executeUpdate();
		System.out.println(i+"row updated student_marks table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}
}