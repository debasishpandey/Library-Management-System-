package com.servlet;

import com.util.Book;
import com.util.BookDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/addBookServlet")
public class AddBook extends HttpServlet {
    BookDao bookDao = BookDao.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
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
        String bookTitle = req.getParameter("bookTitle");
        String bookAuthor = req.getParameter("bookAuthor");
        int quantity = Integer.parseInt(req.getParameter("bookCopies"));
        HttpSession session = req.getSession();

        Book book = new Book(null, bookTitle, bookAuthor, quantity);

        if (bookDao.addBook(book)) {
            session.setAttribute("msg", "Book added");
            session.setAttribute("type", "success");
            req.getRequestDispatcher("FDashboard").forward(req, resp);
        }else {
            session.setAttribute("msg", "Failed to add book");
            session.setAttribute("type", "error");
            req.getRequestDispatcher("FDashboard").forward(req, resp);

        }

    }
}
