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
        String userId = request.getParameter("usernames");
//        String buttonDel = request.getParameter("delete");
//        String buttonPro = request.getParameter("promote");
//
//        if (buttonDel != null) {
//            User user = DaoFactory.getUsersDao().findUserById(Long.valueOf(userId));
//            DaoFactory.getAdsDao().deleteByUserId(user.getId());
//            DaoFactory.getUsersDao().deleteUser(user.getId());
//        } else if (buttonPro != null) {
//            User user = DaoFactory.getUsersDao().findUserById(Long.valueOf(userId));
//            DaoFactory.getUsersDao().update(user);
//        }
//        Long userId = Long.valueOf(request.getParameter("userList"));
        System.out.println(userId);
        String test = request.getParameter("delete");
        if (test.equals("yes")) {
             DaoFactory.getUsersDao().deleteUser(Long.valueOf(userId));
        }
        DaoFactory.getUsersDao().all();
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }
}
