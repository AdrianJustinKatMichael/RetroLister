package com.codeup.retrolister.controllers;

import com.codeup.retrolister.models.User;
import com.codeup.retrolister.dao.DaoFactory;
import com.codeup.retrolister.util.Password;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet{

    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println(username);
        System.out.println(password);

        // Todo: Get User id user exist
        User user = DaoFactory.getUsersDao().findByUsername(username);

        // Todo: Check username and password are correct, if so change user status to online or active
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("profile.jsp");
        } else {
            response.sendRedirect("/login");
        }
    }
}