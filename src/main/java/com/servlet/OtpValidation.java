package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/valid-otp")
public class OtpValidation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        String otp = (String) session.getAttribute("otp");
        String EnteredOtp = req.getParameter("otp");
        if (EnteredOtp.equals(otp)) {

            req.getRequestDispatcher("Change-Password.jsp").forward(req, resp);
        }
    }
}
