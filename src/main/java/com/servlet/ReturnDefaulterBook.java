package com.servlet;

import com.util.*;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
@WebServlet("/ReturnDefaulterBookk")
public class ReturnDefaulterBook extends HttpServlet {
    RequestDetailsDao requestDetailsDao = new RequestDetailsDao();
    PaymentDetailsDao paymentDetailsDao = new PaymentDetailsDao();
    BookDao bookDao = new BookDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         String requestId = req.getParameter("requestId");
         String amount = req.getParameter("cashAmount");
         String receiptNo = req.getParameter("ddNo");
         LocalDate date = LocalDate.now();
         Date dt=Date.valueOf(date);
        RequestDetails requestDetails = requestDetailsDao.requestDetailsById(requestId);
        PaymentDetails paymentDetails = new PaymentDetails(0,requestDetails.getStudentName(),requestId,amount,dt,receiptNo);


        if(requestDetailsDao.bookReturn(requestId)){
            paymentDetailsDao.addPaymentDetails(paymentDetails);
            bookDao.increaseQuantity(1,requestDetails.getBookId());
            req.getRequestDispatcher("FDashboard").forward(req, resp);
            req.setAttribute("message", "Book Returned");
        }else
        {
            req.getRequestDispatcher("FDashboard").forward(req, resp);
            req.setAttribute("message", "something went wrong!!");
        }

    }
}
