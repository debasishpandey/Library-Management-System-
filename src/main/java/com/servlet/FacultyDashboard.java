package com.servlet;


import com.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/FDashboard")
public class FacultyDashboard extends HttpServlet {
    RequestDetailsDao requestDetailsDao = RequestDetailsDao.getInstance();
    StudentDao studentDao =StudentDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null ) {
            if (session.getAttribute("faculty")!=null &&(Boolean) session.getAttribute("faculty"))
                this.doPost(req, resp);
            else {
                req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);


        session.setAttribute("isStudent", false);
        ArrayList<Book> allBooks=BookDao.fetchAllBooks();
        session.setAttribute("allBooks", allBooks);
        session.setAttribute("allDetails",requestDetailsDao.fetchAllRequestDetails());
        session.setAttribute("allRequest", requestDetailsDao.fetchRequestDetails());
        session.setAttribute("allIssued",requestDetailsDao.fetchIssuedDetails());
        session.setAttribute("allDefaulter",requestDetailsDao.fetchDefaulterDetails());
        session.setAttribute("students", studentDao.fetchAllStudents());


      req.getRequestDispatcher("Faculty-Dashboard.jsp").forward(req, resp);
    }
}
