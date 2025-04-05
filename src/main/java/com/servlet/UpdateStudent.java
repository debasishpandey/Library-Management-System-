package com.servlet;

import com.util.FileHandel;
import com.util.Student;
import com.util.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
@MultipartConfig
@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
    StudentDao studentDao = new StudentDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        Date dob= Date.valueOf(req.getParameter("dob"));
        HttpSession session = req.getSession();
        Student student = (Student) session.getAttribute("student");
        student.setEmail(email);
        student.setPhoneNumber(phoneNumber);
        student.setDob(dob);
        student.setImage(student.getRegistrationNumber()+".jpg");
        Part filePart = req.getPart("profilePicture");
        if (filePart != null) {
            boolean b = FileHandel.saveFile(filePart, student.getRegistrationNumber(), "C:/Users/debas/IdeaProjects/jsp-practice/src/main/webapp/ProfilePhoto");
            if (b) {
                System.out.println("Profile photo uploaded");
            }
        }
        boolean b= studentDao.updateStudent(student);
        if (b) {
            req.getRequestDispatcher("/SDashboard").forward(req, resp);
        }else {
            System.out.println("Update failed");
        }

    }
}
