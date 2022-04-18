package controllers;

import dao.DaoFactory;
import models.Ad;
import models.User;
import util.GetPosters;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "AdDetailsServlet", urlPatterns = "/ad")
public class AdDetailsServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        request.setAttribute("username", username);

        Long adId = Long.valueOf(request.getParameter("id"));
        request.getSession().setAttribute("adId", adId);
        Ad ad = DaoFactory.getAdsDao().findAdById(adId);
        User creator = DaoFactory.getUsersDao().findUserById(ad.getUserId());
        if (creator.getUsername().equals(username)) {
            boolean canEdit = true;
            request.setAttribute("canEdit", canEdit);
        }
        request.setAttribute("creator", creator);
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ad.jsp").forward(request, response);
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updateTitle = request.getParameter("updateTitle");
        String updateConsole = request.getParameter("updateConsole");
        String updateDescription = request.getParameter("updateDescription");
        String imageUrl = GetPosters.getImagePoster(updateTitle);
        String updatePostType = request.getParameter("updatePostType");
        Long adId = (Long) request.getSession().getAttribute("adId");
        System.out.println(adId);
        Ad adToChange = DaoFactory.getAdsDao().findAdById(adId);
        long userId = adToChange.getUserId();
        String updateAdButton = request.getParameter("updateAdButton");
        String deleteAdButton = request.getParameter("deleteAdButton");

        if (updateAdButton != null) {
            boolean inputHasErrors = updateTitle.isEmpty()
                    || updateConsole.isEmpty()
                    || updatePostType.isEmpty()
                    || updateDescription.isEmpty();
            if (inputHasErrors) {
                response.sendRedirect("/ad?id=" + adId);
            }
            Ad updatedAd = new Ad(adId, userId, updateTitle, updateConsole, updateDescription, imageUrl, updatePostType);
            DaoFactory.getAdsDao().update(updatedAd);
            response.sendRedirect("/ad?id=" + adId);
        }
        if (deleteAdButton != null) {
            DaoFactory.getAdsDao().delete(adId);
            response.sendRedirect("/index");
        }

//        if (request.getSession().getAttribute("user") != null) {
//            User user = (User) request.getSession().getAttribute("user");
//            String username = user.getUsername();
//            request.setAttribute("username", username);
//        } else {response.sendRedirect("/login"); return;}
//
//        Long adId = Long.valueOf(request.getParameter("id"));
//        Ad ad = DaoFactory.getAdsDao().findAdById(adId);
//        User creator = DaoFactory.getUsersDao().findUserById(ad.getUserId());
//        request.setAttribute("creator", creator);
//        request.setAttribute("ad", ad);
//        request.getRequestDispatcher("/WEB-INF/ad.jsp").forward(request, response);
    }
}
