package com.servlet;

import com.util.Student;
import com.util.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/SLogin")
public class StudentLogin extends HttpServlet {
StudentDao studentDao = StudentDao.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null ) {
            if (session.getAttribute("isStudent")!=null &&(Boolean) session.getAttribute("isStudent"))
                resp.sendRedirect("SDashboard");
            else {
                req.getRequestDispatcher("StudentLogin.jsp").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("StudentLogin.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String registrationNo = req.getParameter("registrationNo");
        String password = req.getParameter("password");




       String name= studentDao.loginStudent(registrationNo, password);
        Student student = studentDao.getStudent(registrationNo);

            if( name!=null) {
                HttpSession session = req.getSession();
                session.setAttribute("isStudent", true);
                session.setAttribute("user",name);
                session.setAttribute("student", student);
                session.setAttribute("registrationNo",registrationNo);
                session.setAttribute("msg", "Login successful");
                session.setAttribute("type", "success");
                req.getRequestDispatcher("/SDashboard").forward(req, resp);
            }else {

                req.setAttribute("error", "Invalid Registration No or password!");
                req.setAttribute("type", "error");
                req.setAttribute("msg", "Invalid Registration No or password!");
                req.getRequestDispatcher("StudentLogin.jsp").forward(req, resp);
            }
    }
}
