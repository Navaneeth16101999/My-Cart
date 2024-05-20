/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.myproject.servelets;

import com.learn.myproject.dao.UserDao;
import com.learn.myproject.entities.User;
import com.learn.myproject.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author navan
 */
public class LoginServelet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //coding
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //validations

            //authenticating user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            // System.out.println(user);
            HttpSession httpsession = request.getSession();

            if (user == null) {
                //  out.println("<h1> Invalid Details</h1>");
                httpsession.setAttribute("message", "Account does not exist");
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("<h1>Welcome" + user.getUsername() + "</h1>");
                httpsession.setAttribute("current-user", user);
                if (user.getUsertype().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                } else if (user.getUsertype().equals("normal")) {
                    response.sendRedirect("normal.jsp");
                } else {
                    out.println("We have not identified the user type");

                }

            }
            }

        }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
