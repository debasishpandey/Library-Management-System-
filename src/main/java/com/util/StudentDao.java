package com.util;

import lombok.Getter;

import java.sql.*;
import java.util.ArrayList;

public class StudentDao {
    @Getter
    private static final StudentDao instance=new StudentDao();
    static  Connection con=DbConnection.getConnection();
    private StudentDao() {

    }
    public boolean addStudent(Student student) {


        try{

            PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, student.getRegistrationNumber());
            ps.setString(2,student.getName());
            ps.setString(3,student.getEmail());
            ps.setString(4,student.getPassword());
            ps.setString(5,student.getPhoneNumber());
            ps.setDate(6,student.getDob());
            ps.setString(7,student.getDepartment());
            ps.setDate(8,student.getJoinDate());
            ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            ps.setString(11, student.getImage());
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean deleteStudent(String id) {
        try {

            PreparedStatement ps=con.prepareStatement("delete from student where registration_number=?");
            ps.setString(1, id);
           int row= ps.executeUpdate();
            if(row>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public String loginStudent(String registrationNumber, String password) {

        try {

            PreparedStatement ps=con.prepareStatement("SELECT * from student where registration_number=? and password=?");
            ps.setString(1, registrationNumber);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
               return rs.getString(2);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public Student setToStudent(ResultSet rs)  {
        Student student = null;
        try {
             student = new Student(rs.getString(1),rs.getString(2),rs.getString(3)
            ,rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),
                    rs.getDate(8),rs.getTimestamp(9),rs.getTimestamp(10),rs.getString(11));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return student;
    }
    public Student getStudent(String registrationNumber) {


        Student student = null;
        try {

            PreparedStatement ps=con.prepareStatement("SELECT * from student where registration_number=? ");
            ps.setString(1, registrationNumber);

            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return   setToStudent(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean changePassword(String registrationNo, String newPassword) {

        Student student = null;
        try {

            PreparedStatement ps=con.prepareStatement("update student set password=? where registration_number=?");
            ps.setString(2, registrationNo);
            ps.setString(1, newPassword);

            int i = ps.executeUpdate();
            if(i>0){

                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;

    }

    public ArrayList<Student> fetchAllStudents() {

        ArrayList<Student> students=new ArrayList<>();
        try {

            PreparedStatement ps=con.prepareStatement("select * from student");

         ResultSet rs= ps.executeQuery();
         while(rs.next()){
             students.add(setToStudent(rs));
         }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }
    public boolean updateStudent(Student student) {

        try {

            PreparedStatement ps=con.prepareStatement("UPDATE student \n" +
                    " SET email = ?, \n" +
                    "     phone_number = ?, \n" +
                    "     dob = ?, \n" +
                    "     image = ?, \n" +
                    "     updated_at = CURRENT_TIMESTAMP \n" +
                    " WHERE registration_number = ? ");

            ps.setString(1, student.getEmail());
            ps.setString(2, student.getPhoneNumber());
            ps.setDate(3, student.getDob());
            ps.setString(4, student.getImage());
            ps.setString(5, student.getRegistrationNumber());
           int row = ps.executeUpdate();
          if(row>0){
              return true;
          }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
