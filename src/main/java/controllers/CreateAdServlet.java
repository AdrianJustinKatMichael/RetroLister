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

@WebServlet(name = "CreateAdServlet", urlPatterns = "/create-ad")
public class CreateAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) { response.sendRedirect("/login"); return; }

        User user = (User) request.getSession().getAttribute("user");
        String username = user.getUsername();
        request.setAttribute("username", username);

        request.getRequestDispatcher("/WEB-INF/create-ad.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String console = request.getParameter("console");
        String postType = request.getParameter("post-type");
        String description = request.getParameter("description");
        String imageURL = GetPosters.getImagePoster(title);
        long userId = Long.parseLong(request.getParameter("userId"));  // getting this from saved user from session

        // validate input
        boolean inputHasErrors = title.isEmpty()
                || console.isEmpty()
                || description.isEmpty()
                || postType.isEmpty();

        if (inputHasErrors) {
            response.sendRedirect("/index");
            return;
        }

        // Add Ad Object to database
        Ad adToInsert = new Ad(userId, title, console, description, imageURL, postType);

        // Redirect to ad details
        long newId = DaoFactory.getAdsDao().insert(adToInsert);
        response.sendRedirect("/ad?id=" + newId);
    }
}