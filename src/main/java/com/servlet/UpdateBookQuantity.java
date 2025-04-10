package com.servlet;

import com.util.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/updateQuantity")
public class UpdateBookQuantity extends HttpServlet {
    BookDao bookDao = BookDao.getInstance();
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
