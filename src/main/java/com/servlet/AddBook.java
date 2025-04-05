package com.servlet;

import com.util.DbConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@WebServlet("/addBookServlet")
public class AddBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookTitle = req.getParameter("bookTitle");
        String bookAuthor = req.getParameter("bookAuthor");
        int quantity = Integer.parseInt(req.getParameter("bookCopies"));
        HttpSession session = req.getSession();

        Connection con = null;
        try {
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement stmt= con.prepareStatement("insert into book (name,author,quantity) values (?,?,?)");
            stmt.setString(1, bookTitle);
            stmt.setString(2, bookAuthor);
            stmt.setInt(3, quantity);
            int row=stmt.executeUpdate();
            if (row>0) {
                System.out.println("Book Added Successfully");
                session.setAttribute("Added", true);
                req.getRequestDispatcher("FDashboard").forward(req, resp);
            }else {
                session.setAttribute("Added", false);
                req.getRequestDispatcher("FDashboard").forward(req, resp);
                System.out.println("Book Not Added Successfully");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
