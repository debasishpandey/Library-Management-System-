package com.servlet;


import com.util.*;
import jakarta.mail.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
@WebServlet("/FDashboard")
public class FacultyDashboard extends HttpServlet {
    RequestDetailsDao requestDetailsDao = new RequestDetailsDao();
    StudentDao studentDao = new StudentDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        System.out.println("FacultyDashboard doPost");
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
