package controllers;

import dao.DaoFactory;

import models.Ad;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        request.setAttribute("username", username);
        List<Ad> profileAds;
        boolean canEdit;

        if (request.getParameter("id") != null) {
            Long profileId = Long.valueOf(request.getParameter("id"));

            if (profileId == user.getId()) {
                request.setAttribute("profileUser", user);
                if (user.isAdmin()) request.setAttribute("admin", "true");
                canEdit = true;
            } else {
                User profileUser = DaoFactory.getUsersDao().findUserById(profileId);
                request.setAttribute("profileUser", profileUser);
                request.setAttribute("admin", "false");
                canEdit = false;
            }

            profileAds = DaoFactory.getAdsDao().usersAds(profileId);
        } else {
            request.setAttribute("profileUser", user);
            if (user.isAdmin()) request.setAttribute("admin", "true");
            profileAds = DaoFactory.getAdsDao().usersAds(user.getId());
            canEdit = true;
        }

        request.setAttribute("profileAds", profileAds);
        request.setAttribute("canEdit", canEdit);

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // update information or delete account
        String updateUsername = request.getParameter("username");
        String updateEmail = request.getParameter("email");
        String currentPassword = request.getParameter("password");
        String updatePassword = request.getParameter("password-new");
        String confirmPassword = request.getParameter("password-confirm");

        /*
        *   When the form is submitted these String objects need to be executed
        *   Updating to the database with the new values
        *   Will need a multi-tier password-check conditional
        *   (compare current pw to db pw; then update to confirm; if both pass; update pw to db)
        *   Everything else will pass through update methods in UsersDao
        *   Afterwards, redirect to /logout servlet
        * */

        // update your own ads or delete them
    }
}
