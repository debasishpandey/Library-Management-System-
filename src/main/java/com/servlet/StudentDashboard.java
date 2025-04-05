package com.servlet;

import com.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/SDashboard")
public class StudentDashboard extends HttpServlet {
    BookDao bookDao = new BookDao();
    RequestDetailsDao requestDetailsDao = new RequestDetailsDao();
    StudentDao studentDao = new StudentDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = (String) session.getAttribute("user");
        String registrationNo = (String) session.getAttribute("registrationNo");

        ArrayList<Book> allBooks = BookDao.fetchAllBooks();
        session.setAttribute("allBooks", allBooks);

        Student student =studentDao.getStudent(registrationNo);
        student.setPassword(null);
        session.setAttribute("student", student);

        ArrayList<RequestDetails> requestDetails = requestDetailsDao.fetchAllDetailsByStudentId(registrationNo);
        session.setAttribute("requestDetails", requestDetails);

        req.getRequestDispatcher("Student-Dashboard.jsp").forward(req, resp);

    }
}
