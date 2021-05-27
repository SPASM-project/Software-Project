package com.SPASM.model;



public class AttendanceModel {
	private String present;
	private String absent;
	private String classcode;
	private String stu_name;
	private String teacher_name;
	private String date;
	private String classname;
	private Integer stu_id;
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public String getAbsent() {
		return absent;
	}
	public void setAbsent(String absent) {
		this.absent = absent;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	@Override
	public String toString() {
		return "AttendanceModel [present=" + present + ", absent=" + absent + ", classcode=" + classcode + ", stu_name="
				+ stu_name + ", teacher_name=" + teacher_name + ", date=" + date + ", classname=" + classname
				+ ", stu_id=" + stu_id + "]";
	}
	
	
	

}
