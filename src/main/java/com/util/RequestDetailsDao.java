package com.util;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class RequestDetailsDao {
    private static RequestDetailsDao obj = new RequestDetailsDao();


        public String generateRequestId(int id) {
            String prefix="GIET-LMS-";
            LocalDate today = LocalDate.now();
            String datePart = today.toString().replace("-", "");
            return prefix+datePart+"-"+id;
        }

    private RequestDetails setToRequestDetails(ResultSet rs)  {

        try {
           return new RequestDetails(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                    rs.getDate(7),rs.getString(8),rs.getDate(9));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<RequestDetails> fetchAllDetailsByStudentId(String registrationNO){
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where StudentRegistrationNo =?");
            ps.setString(1,registrationNO);
            ResultSet rs=ps.executeQuery();
            ArrayList<RequestDetails> bookRequestDetails = new ArrayList<>();

            while(rs.next()){
                bookRequestDetails.add(obj.setToRequestDetails(rs));
            }
            return bookRequestDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<RequestDetails> fetchAllRequestDetails() {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest");
            ResultSet rs=ps.executeQuery();
            ArrayList<RequestDetails> bookRequestDetails = new ArrayList<>();

            while(rs.next()){
                bookRequestDetails.add(obj.setToRequestDetails(rs));
            }
            return bookRequestDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkBookRequest(String bookId,String registrationNo) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where Status in ('requested','issued') and BookId=? and StudentRegistrationNo=?");
            ps.setString(1,bookId);
            ps.setString(2,registrationNo);
            ResultSet rs=ps.executeQuery();
           if(rs.next()){
               System.out.println();
               return true;
           }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public ArrayList<RequestDetails> fetchRequestDetails() {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where Status='requested'");
            ResultSet rs=ps.executeQuery();
            ArrayList<RequestDetails> bookRequestDetails = new ArrayList<>();

            while(rs.next()){
                bookRequestDetails.add(obj.setToRequestDetails(rs));
            }
            return bookRequestDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<RequestDetails> fetchIssuedDetails() {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where Status='issued'");
            ResultSet rs=ps.executeQuery();
            ArrayList<RequestDetails> bookRequestDetails = new ArrayList<>();

            while(rs.next()){
                LocalDate date = LocalDate.now();
                Date dt=Date.valueOf(date);
                if(rs.getDate(9).after(dt) || rs.getDate(9).equals(dt)){
                    bookRequestDetails.add(obj.setToRequestDetails(rs));}

            }
            return bookRequestDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<RequestDetails> fetchDefaulterDetails() {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where Status='issued'");
            ResultSet rs=ps.executeQuery();
            ArrayList<RequestDetails> bookRequestDetails = new ArrayList<>();

            while(rs.next()){
                LocalDate date = LocalDate.now();
                Date dt=Date.valueOf(date);
                if(rs.getDate(9).before(dt)){
                    bookRequestDetails.add(obj.setToRequestDetails(rs));}

            }
            return bookRequestDetails;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public RequestDetails requestDetailsById(String id) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from bookrequest where RequestId=?");
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
               return setToRequestDetails(rs);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean addRequest(RequestDetails requestDetails) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("INSERT INTO bookrequest (RequestId, StudentRegistrationNo, StudentName, BookId, BookName, RequestDate, Status, DueDate) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1,requestDetails.getId());
            ps.setString(2,requestDetails.getRegistrationNo());
            ps.setString(3,requestDetails.getStudentName());
            ps.setString(5,requestDetails.getBookName());
            ps.setString(4,requestDetails.getBookId());
            ps.setDate(6,requestDetails.getDate());
            ps.setString(7,requestDetails.getStatus());
            ps.setDate(8,requestDetails.getDueDate());
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public boolean approveRequest(String id,Date dueDate) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("update bookrequest set Status='issued',DueDate=? where RequestId=?");
           ps.setDate(1,dueDate);
           ps.setString(2,id);
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public boolean bookReturn(String requestId) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("update bookrequest set Status='returned' where RequestId=?");
            ps.setString(1,requestId);
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

 public int maxId(){
     Connection con = null;
     try{
         DbConnection db = new DbConnection();
         con=db.getConnection();
         PreparedStatement ps=con.prepareStatement("SELECT MAX(CAST(RIGHT(RequestId, 4) AS UNSIGNED)) AS last_code\n" +
                 "FROM bookrequest\n" +
                 "WHERE RequestId LIKE 'GIET-LMS-%';\n");
         ResultSet set = ps.executeQuery();
         if(set.next()){
             return set.getInt(1);
         }

     } catch (SQLException e) {
         throw new RuntimeException(e);
     }
     return -1;
 }

}
