package com.servlet;

import com.util.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/updateQuantity")
public class UpdateBookQuantity extends HttpServlet {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("bookId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        boolean updated = bookDao.updateQuantity(quantity, bookId);
        if (updated) {
            request.setAttribute("message", "Book updated successfully");
            request.getRequestDispatcher("/FDashboard").forward(request, response);
        }else {
            request.setAttribute("message", "Failed to update book");
            request.getRequestDispatcher("/FDashboard").forward(request, response);
        }
    }
}
