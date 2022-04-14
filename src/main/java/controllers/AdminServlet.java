package controllers;

import dao.DaoFactory;
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
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            String username = user.getUsername();
            request.setAttribute("username", username);
        }
        request.setAttribute("users", DaoFactory.getUsersDao().all());
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("usernames");
        String buttonDel = request.getParameter("deletion");
        String buttonPro = request.getParameter("promote");
        String confirm = request.getParameter("delete");

        if (buttonDel != null) {
            if (confirm.equals("yes")) {
                DaoFactory.getUsersDao().deleteUser(Long.valueOf(userId));
//                request.setAttribute("users", DaoFactory.getUsersDao().all());
            }
        } else if (buttonPro != null) {
            if (confirm.equals("yes")) {
                DaoFactory.getUsersDao().update(Long.valueOf(userId));
//                request.setAttribute("users", DaoFactory.getUsersDao().all());
            }
        }
        else {
            throw new ServletException("something went awry");
        }

//        this will keep the navbar recognizing our login status
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            String username = user.getUsername();
            request.setAttribute("username", username);
        }
        request.setAttribute("users", DaoFactory.getUsersDao().all());
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }
}