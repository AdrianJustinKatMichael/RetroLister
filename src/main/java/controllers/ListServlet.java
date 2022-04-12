package controllers;

import dao.*;
import models.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ListServlet", urlPatterns = "/list")
public class ListServlet extends HttpServlet{

    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ads adsDao = DaoFactory.getAdsDao();
        List<Ad> ads = new ArrayList<>();
        if (request.getSession().getAttribute("user") != null) {
            ads = adsDao.all();
        } else {
            ads = adsDao.lastFiveAds();
        }
        request.setAttribute("ads", ads);
        request.getRequestDispatcher("/WEB-INF/list.jsp").forward(request, response);
    }

}