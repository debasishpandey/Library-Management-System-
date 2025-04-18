package com.servlet;

import com.util.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/removeBookServlet")
public class RemoveBook extends HttpServlet {
    BookDao bookDao = BookDao.getInstance();

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
        boolean b = bookDao.deleteBook(bookId);
        if (b) {
            req.setAttribute("message", "Book deleted successfully");
            req.getRequestDispatcher("/FDashboard").forward(req, resp);
        }else {
            req.setAttribute("message", "Failed to delete book");
            req.getRequestDispatcher("/FDashboard").forward(req, resp);
        }
    }
}
