package com.servlet;

import com.util.RequestDetails;
import com.util.RequestDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.Period;
import java.util.ArrayList;

@WebServlet("/ReturnDefaulter")
public class PaymentPage extends HttpServlet {
    RequestDetailsDao requestDetailsDao =RequestDetailsDao.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String registrationNo = req.getParameter("registrationNo");
        String requestId = req.getParameter("requestId");
        String bookId = req.getParameter("bookId");

        RequestDetails requestDetails1 = requestDetailsDao.requestDetailsById(requestId);

        Date date2 = new Date(System.currentTimeMillis());
        Date date1= requestDetails1.getDueDate();

         Period period = Period.between(date1.toLocalDate(), date2.toLocalDate());

        int fine=20*period.getDays();
        req.setAttribute("fine",fine);
        req.getRequestDispatcher("PaymentPage.jsp").forward(req, resp);


    }
}
