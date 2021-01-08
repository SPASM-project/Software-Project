package com.SPASM.DAO;

import java.sql.*;


public class Db_Connection 
{
	// private  String url="jdbc:mysql://localhost:3306/mysql_virtualclassroom";
	 private  String url="jdbc:mysql://localhost:3306/virtualclassroom";
	 //private  String username="id15452607_monishid15452607_vc";
	 //private  String password="Root-12345678";
	 private  String username="root";
	 private  String password="10339";
//	  String url="jdbc:postgresql://"+"localhost:5432"+"/virtual";
//	  String username="postgres";
//	  String password="10339";
	 
//	  String url="jdbc:postgresql://"+"ec2-3-228-114-251.compute-1.amazonaws.com:5432"+"/d5gt7msqf8sog2?sslmode=require";
//	  String username="azcnxvmijefkdm";
//	  String password="34fc194306ac06fc64ee898f5f3d64ede9e1a0c8137e52516b4ea26590bd71c9";
    public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        	//Class.forName("org.postgresql.Driver");
           
            Connection myConnection = DriverManager.getConnection(url,username,password);
            System.out.println("connected");
            return myConnection;
        } catch (Exception ex) {}
        return null;
    }
}
