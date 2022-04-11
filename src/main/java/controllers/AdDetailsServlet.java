package controllers;

import dao.DaoFactory;
import models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdDetailsServlet", urlPatterns = "/ad")
public class AdDetailsServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        Long adId = Long.valueOf(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().findAdById(adId);
        request.getSession().setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ad.jsp").forward(request, response);
    }
}
