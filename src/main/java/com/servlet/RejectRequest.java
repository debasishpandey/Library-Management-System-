package com.servlet;

import com.util.DbConnection;
import com.util.RequestDetailsDao;
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

    RequestDetailsDao requestDetailsDao =RequestDetailsDao.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("requestId");
        requestDetailsDao.rejectRequest(id);
        req.getRequestDispatcher("/FDashboard").forward(req, resp);
    }
}
