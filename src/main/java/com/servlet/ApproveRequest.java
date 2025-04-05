package com.servlet;

import com.util.Book;
import com.util.BookDao;
import com.util.RequestDetailsDao;
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
    BookDao bDaoObj =new BookDao();
    RequestDetailsDao rDaoObj =new RequestDetailsDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = req.getParameter("requestId");
        System.out.println(id);
        Date dueDate = Date.valueOf(req.getParameter("dueDate"));
        System.out.println(dueDate);
        String bookId = req.getParameter("bookId");
        System.out.println(bookId);
        boolean notAvailable=false;
        session.setAttribute("notavailable",notAvailable);
            Book book=bDaoObj.fetchBookById(bookId);
            if(book.getQuantity()<=0){
                notAvailable=true;
                session.setAttribute("notavailable",notAvailable);
                req.getRequestDispatcher("FDashboard").forward(req,resp);
            }else {
                if(rDaoObj.approveRequest(id,dueDate)){
                bDaoObj.decreaseQuantity(1,bookId);
                req.getRequestDispatcher("FDashboard").forward(req,resp);
                }
                else {
                    System.out.println("something went wrong");
                }
            }

        }
    }

