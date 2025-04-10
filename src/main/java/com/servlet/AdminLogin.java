package com.servlet;

import com.util.DbConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Alogin")
public class AdminLogin extends HttpServlet {
    static  Connection con=DbConnection.getConnection();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("AdminLogin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(username+" "+password);


        try {
          PreparedStatement ps=con.prepareStatement("select * from admin where username=? and password=?");
          ps.setString(1,username);
          ps.setString(2,password);
          ResultSet rs=ps.executeQuery();
          if(rs.next()){
              req.getRequestDispatcher("Signup.jsp").forward(req, resp);
          }else{
              req.setAttribute("error", "Invalid username or password!");
              req.getRequestDispatcher("AdminLogin.jsp").forward(req, resp);
          }
        } catch ( SQLException e) {
            throw new RuntimeException(e);
        }



    }
}
