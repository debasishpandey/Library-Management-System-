package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymentDetailsDao {
    public boolean addPaymentDetails(PaymentDetails paymentDetails) {
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("INSERT INTO paymentdetails (student_Name, request_Id, amount, date, receipt_No)  \n" +
                    "VALUES (?, ?, ?, ?, ?)");
            ps.setString(1,paymentDetails.getStudentName());
            ps.setString(2,paymentDetails.getRequestId());
            ps.setString(3,paymentDetails.getAmount());
            ps.setDate(4,paymentDetails.getDate());
            ps.setString(5,paymentDetails.getReceiptNo());
            ps.executeUpdate();
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
