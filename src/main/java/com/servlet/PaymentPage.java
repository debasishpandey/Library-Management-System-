package com.servlet;

import com.util.RequestDetails;
import com.util.RequestDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.Period;


@WebServlet("/ReturnDefaulter")
public class PaymentPage extends HttpServlet {
    RequestDetailsDao requestDetailsDao =RequestDetailsDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null ) {
            if (session.getAttribute("faculty")!=null &&(Boolean) session.getAttribute("faculty"))
                resp.sendRedirect("FDashboard");
            else {
                req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String requestId = req.getParameter("requestId");


        RequestDetails requestDetails1 = requestDetailsDao.requestDetailsById(requestId);

        Date date2 = new Date(System.currentTimeMillis());
        Date date1= requestDetails1.getDueDate();

         Period period = Period.between(date1.toLocalDate(), date2.toLocalDate());

        int fine=20*period.getDays();
        req.setAttribute("fine",fine);
        req.getRequestDispatcher("PaymentPage.jsp").forward(req, resp);


    }
}
