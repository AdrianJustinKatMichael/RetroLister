package controllers;

import dao.DaoFactory;
import models.Ad;
import models.User;
import util.Password;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user"); //using object to access the ID of the logged-in user
        Long userId = user.getId();
        String updateUsername = request.getParameter("username");
        String updateEmail = request.getParameter("email");
        String currentPassword = request.getParameter("password-current");
        boolean validAttempt = Password.check(currentPassword, user.getPassword());
        String newPassword = request.getParameter("password-new");
        String confirmNewPass = request.getParameter("password-confirm");
        String editUserButton = request.getParameter("editUserButton");

        if (editUserButton != null) {
            if (updateUsername != null) { DaoFactory.getUsersDao().updateUsername(userId, updateUsername); }
            if (updateEmail != null) { DaoFactory.getUsersDao().updateEmail(userId, updateEmail); }
            if (currentPassword != null) {
                if (validAttempt) {
                    if (newPassword.equals(confirmNewPass)) { DaoFactory.getUsersDao().updatePassword(userId, newPassword); }
                }
            }
            response.sendRedirect("/login");
        }

        // update your own ads or delete them
    }
}
