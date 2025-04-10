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

@WebServlet("/SDashboard")
public class StudentDashboard extends HttpServlet {

    RequestDetailsDao requestDetailsDao = RequestDetailsDao.getInstance();
    StudentDao studentDao = StudentDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
       if (session != null &&session.getAttribute("isStudent")!=null && (Boolean) session.getAttribute("isStudent")) {
           String registrationNo = (String) session.getAttribute("registrationNo");

           ArrayList<Book> allBooks = BookDao.fetchAllBooks();
           session.setAttribute("allBooks", allBooks);

           Student student =studentDao.getStudent(registrationNo);
           student.setPassword(null);
           session.setAttribute("student", student);

           ArrayList<RequestDetails> requestDetails = requestDetailsDao.fetchAllDetailsByStudentId(registrationNo);
           session.setAttribute("requestDetails", requestDetails);

           req.getRequestDispatcher("Student-Dashboard.jsp").forward(req, resp);
       }else {
           resp.sendRedirect("SLogin");
       }


    }
}
