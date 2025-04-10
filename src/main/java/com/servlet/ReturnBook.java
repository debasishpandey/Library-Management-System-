package com.servlet;

import com.util.BookDao;
import com.util.RequestDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {

    BookDao bDaoObj =BookDao.getInstance();
    RequestDetailsDao rDaoObj =RequestDetailsDao.getInstance();

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

        String bookId = req.getParameter("bookId");
        String requestId = req.getParameter("requestId");

        if(rDaoObj.bookReturn(requestId)){
            bDaoObj.increaseQuantity(1,bookId);
            req.getRequestDispatcher("FDashboard").forward(req, resp);
            req.setAttribute("message", "Book Returned");
        }else {
            req.getRequestDispatcher("FDashboard").forward(req, resp);
            req.setAttribute("message", "something went wrong!!");
        }
    }
}
