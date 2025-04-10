package com.servlet;


import com.util.RequestDetails;
import com.util.RequestDetailsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/RequestBook")
public class RequestBook extends HttpServlet {


    RequestDetailsDao requestDetailsDao = RequestDetailsDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null ) {
            if (session.getAttribute("isStudent")!=null &&(Boolean) session.getAttribute("isStudent"))
                resp.sendRedirect("SDashboard");
            else {
                req.getRequestDispatcher("SLogin").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("SLogin").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String bookId = request.getParameter("bookId");
        String registrationNo =session.getAttribute("registrationNo").toString();
        String bookName = request.getParameter("bookName");

        String page = request.getParameter("sourcePage");
        System.out.println(page);
        String username = (String) session.getAttribute("user");
        LocalDate date = LocalDate.now();
        Date dt=Date.valueOf(date);

        int firstNo=1001;
        int maxId=requestDetailsDao.maxId();
        int newId=-1;
        if(firstNo>maxId){
            newId=firstNo;
        }
        else {
            newId=maxId+1;
        }
        String requestId=requestDetailsDao.generateRequestId(newId);

        RequestDetails requestDetails = new RequestDetails(requestId,registrationNo,username, bookId, bookName,dt,"requested",null );

        boolean alreadyRequested = requestDetailsDao.checkBookRequest(bookId,registrationNo );
        if(alreadyRequested){
            session.setAttribute("msg", "Book is already requested");
            session.setAttribute("type", "warning");
            request.getRequestDispatcher("/SDashboard").forward(request,response);

        }else {
            boolean b = requestDetailsDao.addRequest(requestDetails);

            if(b){
                session.setAttribute("msg", "Request added");
                session.setAttribute("type", "success");
                session.setAttribute("user",username);
                request.getRequestDispatcher("/SDashboard").forward(request,response);
            }else

            {
                session.setAttribute("msg", "Request added");
                session.setAttribute("type", "error");
                System.out.println("Error");
                session.setAttribute("user",username);
                request.getRequestDispatcher("/SDashboard").forward(request,response);
            }
        }





    }

}
