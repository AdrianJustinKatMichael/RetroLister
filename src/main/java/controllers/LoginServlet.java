package controllers;

import dao.DaoFactory;
import models.User;
import util.Password;

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
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());
        boolean isAdmin = user.isAdmin();

        if (validAttempt && isAdmin) {
            session.setAttribute("user", user);
            session.setAttribute("admin", user);
            response.sendRedirect("/index");
            System.out.println("Logged in as admin.");
        } else if (validAttempt){
            session.setAttribute("user", user);
            response.sendRedirect("/index");
            System.out.println("Logged in as regular user.");
        } else {
            response.sendRedirect("/login");
        }
    }
}