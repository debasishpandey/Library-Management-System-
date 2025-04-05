package com.servlet;

import com.util.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/removeBookServlet")
public class RemoveBook extends HttpServlet {
    BookDao bookDao = new BookDao();
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
