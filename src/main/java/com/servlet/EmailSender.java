package com.servlet;

import com.util.Student;
import com.util.StudentDao;
import com.util.UtilityMailSender;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.*;

@WebServlet("/Send")
public class EmailSender extends HttpServlet {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int OTP_LENGTH = 6;
    StudentDao studentDao = new StudentDao();

    public static String generateOtp() {
        SecureRandom random = new SecureRandom();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);

        for (int i = 0; i < OTP_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            otp.append(CHARACTERS.charAt(index));
        }

        return otp.toString();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Sending email");
        String registrationNo=req.getParameter("registrationNo");
        HttpSession session = req.getSession();
        Student student  =studentDao.getStudent(registrationNo);
        String email = student.getEmail();
                String otp = generateOtp();
                String body="OTP for Account Verification is "+otp;
                String subject = "LMS OTP for Account Verification";

                session.setAttribute("otp", otp);
                session.setAttribute("email", email);
                boolean b = UtilityMailSender.sendMail(email, body,subject );
                if (b) {
                    session.setAttribute("bool", true);
                    req.getRequestDispatcher("passwordReset.jsp").forward(req, resp);

                }

            else {
                req.setAttribute("error", "Please provide registered email!");
                req.getRequestDispatcher("passwordReset.jsp").forward(req, resp);
            }



    }
}
