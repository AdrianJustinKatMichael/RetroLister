package controllers;

import dao.DaoFactory;
import models.User;
import util.Password;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordRepeat = request.getParameter("password-repeat");

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (! password.equals(passwordRepeat));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        // Valid Account does not already exist in the DAO/Model
        User user = DaoFactory.getUsersDao().findByUsername(username);
        if (user != null) {
            response.sendRedirect("/register");
            System.out.println("User already exists.");
            return;
        }

        // Add User to database
        String hashedPassword = Password.hash(password);
        User userToInsert = new User(username, email, hashedPassword);
        DaoFactory.getUsersDao().insert(userToInsert);
        response.sendRedirect("/login");
    }
}