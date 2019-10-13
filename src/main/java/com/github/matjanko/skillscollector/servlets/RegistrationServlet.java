package com.github.matjanko.skillscollector.servlets;

import com.github.matjanko.skillscollector.model.dao.UserDao;
import com.github.matjanko.skillscollector.model.entities.User;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.github.matjanko.skillscollector.listeners.HibernateInitializer.SESSION_FACTORY;

@WebServlet(urlPatterns = "/register")
public class RegistrationServlet extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = (SessionFactory) super.getServletContext()
                .getAttribute(SESSION_FACTORY);

        userDao = new UserDao(sessionFactory);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User newUser = new User();
        req.setAttribute("newUser", newUser);

        req.getRequestDispatcher(
                "/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new User(username, password);
        user.setFirstName(firstName);
        user.setLastName(lastName);

        userDao.save(user);

        resp.sendRedirect("/register");
    }
}
