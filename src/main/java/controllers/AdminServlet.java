package controllers;

import dao.DaoFactory;
import dao.UsersDao;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    private HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("users", DaoFactory.getUsersDao().all());
//        System.out.println(DaoFactory.getUsersDao().all().size()); // <--- for checking in services terminal
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }
}
