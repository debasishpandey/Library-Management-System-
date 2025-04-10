package com.servlet;

import com.util.DbConnection;
import com.util.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
@WebServlet("/reset")
public class ResetPassword extends HttpServlet {
    StudentDao studentDao = StudentDao.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String registrationNo = session.getAttribute("registrationNo").toString();
        String password = req.getParameter("newPassword");
        System.out.println(registrationNo+" "+password);
            if(studentDao.changePassword(registrationNo,password)) {
                System.out.println("Password reset successful");
                resp.sendRedirect("SLogin");
            }else {
                System.out.println("Password reset failed");
                req.getRequestDispatcher("passwordReset.jsp").forward(req, resp);
            }


    }
}
