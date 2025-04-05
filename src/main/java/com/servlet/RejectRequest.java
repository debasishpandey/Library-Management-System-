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
@WebServlet("/Reject")
public class RejectRequest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("requestId"));
        Connection con = null;
        try{
            DbConnection db = new DbConnection();
            con=db.getConnection();
            PreparedStatement ps=con.prepareStatement("update bookrequest set status='Rejected' where requestid=?");
            ps.setInt(1, id);
            int row=ps.executeUpdate();



            req.getRequestDispatcher("/FDashboard").forward(req, resp);


        }
        catch(SQLException  e){
            System.out.println(e);
        }
        finally {


            try {
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }
}
