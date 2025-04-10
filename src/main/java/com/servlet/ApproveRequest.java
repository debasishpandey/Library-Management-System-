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

@WebServlet("/Approve")
public class ApproveRequest extends HttpServlet {
    BookDao bDaoObj =BookDao.getInstance();
    RequestDetailsDao rDaoObj =RequestDetailsDao.getInstance();
    StudentDao sDaoObj =StudentDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null ) {
            if (session.getAttribute("faculty")!=null &&(Boolean) session.getAttribute("faculty"))
                resp.sendRedirect("FDashboard");
            else {
                req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = req.getParameter("requestId");

        Date dueDate = Date.valueOf(req.getParameter("dueDate"));
        System.out.println(dueDate);
        String bookId = req.getParameter("bookId");
        System.out.println(bookId);

        session.setAttribute("notavailable",false);
            Book book=bDaoObj.fetchBookById(bookId);
            if(book.getQuantity()<=0){

                session.setAttribute("notavailable",true);
                req.getRequestDispatcher("FDashboard").forward(req,resp);
            }else {


                if(rDaoObj.approveRequest(id,dueDate)){

                bDaoObj.decreaseQuantity(1,bookId);
                    RequestDetails rd=rDaoObj.requestDetailsById(id);
                    Student student=sDaoObj.getStudent(rd.getRegistrationNo());

                String subject="Book Request Approved";
                String body="Dear "+student.getName()+",\n" +
                        "\n" +
                        "We are pleased to inform you that your request for the book "+rd.getBookName()+" has been approved. You can now collect the book from the library during working hours.\n" +
                        "\n" +
                        "Book Details:  \n" +
                        "\n" +
                        "Book Name: "+rd.getBookName()+"\n" +
                        "\n" +
                        "Request ID: "+rd.getId()+"\n" +
                        "\n" +
                        "Due Date: "+dueDate+"\n" +
                        "\n" +
                        "Please ensure that you return the book before the due date to avoid any late fees. The library imposes a fine of ₹20 per day for each day the book is returned late.\n" +
                        "\n" +
                        "We hope you enjoy reading the book and appreciate your promptness in returning it on time.\n" +
                        "\n" +
                        "Should you have any questions, feel free to contact the library.";

                UtilityMailSender.sendMail(student.getEmail(),body,subject);
                req.getRequestDispatcher("FDashboard").forward(req,resp);
                }
                else {
                    System.out.println("something went wrong");
                }
            }

        }
    }

