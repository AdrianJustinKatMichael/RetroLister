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
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("button pressed");
        String userId = request.getParameter("value");
        String username = request.getParameter("usernames");
        String buttonDel = request.getParameter("delete");
        String buttonPro = request.getParameter("promote");

        try {
            if ("delete".equals(buttonDel)) {
                DaoFactory.getAdsDao().deleteByUserId(Long.valueOf(userId));
                DaoFactory.getUsersDao().deleteUserById(Long.valueOf(userId));
            }
            if ("promote".equals(buttonPro)) {
                User user = DaoFactory.getUsersDao().findUserById(Long.valueOf(userId));
                DaoFactory.getUsersDao().update(user);
                System.out.println("follow through");
                DaoFactory.getUsersDao().all();
            }
            request.setAttribute("users", DaoFactory.getUsersDao().all());
        } catch (Exception e) {
            System.out.println("error");
        }

        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }
}
