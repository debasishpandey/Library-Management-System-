package com.servlet;

import com.util.DbConnection;
import com.util.Student;
import com.util.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/SLogin")
public class StudentLogin extends HttpServlet {
StudentDao studentDao = new StudentDao();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("StudentLogin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String registrationNo = req.getParameter("registrationNo");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        session.setAttribute("isStudent", true);

       String name= studentDao.loginStudent(registrationNo, password);
        Student student = studentDao.getStudent(registrationNo);

            if( name!=null) {
                session.setAttribute("user",name);
                session.setAttribute("student", student);
                session.setAttribute("registrationNo",registrationNo);
                req.getRequestDispatcher("/SDashboard").forward(req, resp);
            }else {

                req.setAttribute("error", "Invalid Registration No or password!");
                req.getRequestDispatcher("StudentLogin.jsp").forward(req, resp);
            }
    }
}
