package controllers;

import dao.DaoFactory;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        if (request.getParameter("id") != null) {
            Long profileId = Long.valueOf(request.getParameter("id"));
            User profileUser = DaoFactory.getUsersDao().findUserById(profileId);
            request.setAttribute("profileUser", profileUser);
        }

        User user = (User) request.getSession().getAttribute("user");
        if (user.isAdmin()) request.setAttribute("admin", "true");
        request.setAttribute("user", user);
        
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
