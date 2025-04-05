package com.servlet;

import com.util.Book;
import com.util.BookDao;
import com.util.DbConnection;
import com.util.RequestDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/FLogin")
public class FacultyLogin extends HttpServlet {
    RequestDetailsDao requestDetailsDao = new RequestDetailsDao();
    private static void loging(){}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter out = resp.getWriter();
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from faculty where username=? and password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                HttpSession session = req.getSession();
                session.setAttribute("user", username);
                req.setAttribute("message", "Successfully logged in");
               req.getRequestDispatcher("FDashboard").forward(req, resp);

            }else {
                req.setAttribute("error", "Invalid username or password!");

                req.getRequestDispatcher("Faculty-login.jsp").forward(req, resp);
            }
        }
        catch(SQLException e){
            out.println(e);
        }
        finally {

            out.close();
            try {
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


    }
}
