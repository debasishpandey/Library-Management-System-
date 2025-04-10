package com.servlet;


import com.util.Student;
import com.util.StudentDao;
import com.util.UtilityMailSender;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
@WebServlet("/Register")
public class SignUp extends HttpServlet {
    StudentDao studentDao =StudentDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student(req.getParameter("registrationNumber")
        ,req.getParameter("name"),req.getParameter("email"),req.getParameter("password"),
                req.getParameter("phoneNumber"), Date.valueOf(req.getParameter("dob")),
                req.getParameter("category")+" "+req.getParameter("branch"),
                Date.valueOf(req.getParameter("joinDate")),null,null,null);

        String body="Dear "+student.getName()+",\n" +
                "\n" +
                "Congratulations! Your account has been successfully created on Giet LMS.\n" +
                "\n" +
                "Here are your login details:\n" +
                "\uD83D\uDCE7 Registration No: "+student.getRegistrationNumber()+"\n" +
                "\uD83D\uDD11 Temporary Password: "+student.getPassword()+" (Please change it after logging in)\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "Welcome aboard!\n" +
                "Best regards,  \n" +
                "Giet LMS Team  \n" +
                "\n";
        String subject="Your Giet LMS Account Has Been Successfully Created!";
     if(  studentDao.addStudent(student)){


         boolean b = UtilityMailSender.sendMail(student.getEmail(), body, subject);
         if(b){
             System.out.println("Email Sent");
         }
         resp.sendRedirect("StudentLogin.jsp");
     }
     else{
         System.out.println("Error");
     }
    }
}
