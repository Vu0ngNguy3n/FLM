/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import model.Account;

/**
 *
 * @author admin
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null) {
            response.sendRedirect("home");
        } else {
            Cookie arr[] = request.getCookies();
            if (arr != null) {
                for (Cookie cookie : arr) {
                    if (cookie.getName().equals("username")) {
                        String[] userPass = cookie.getValue().split(":");
                        String username = userPass[0];
                        String decodedPassword = new String(Base64.getDecoder().decode(userPass[1]));
                        request.setAttribute("username", username);
                        request.setAttribute("password", decodedPassword);
                    }
                }
                request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDBContext accountdb = new AccountDBContext();
        Account account = accountdb.getAccount(username, password);
        if (account == null) {
            request.setAttribute("success", false);
            request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("account", account);
            request.getSession().setMaxInactiveInterval(200);
            String remember = request.getParameter("rememberme");
            if (account.isActive()) {
                request.setAttribute("active", false);
                request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
            }
            if (remember != null) {
                Cookie arr[] = request.getCookies();
                boolean removeCookie = false;
                if (arr != null) {
                    for (Cookie cookie : arr) {
                        if (cookie.getName().equals("username")) {
                            Cookie cookie1 = new Cookie("username", "");
                            cookie1.setMaxAge(0);
                            response.addCookie(cookie1);
                            removeCookie = true;
                        }
                    }
                    if (removeCookie == false) {
                        String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes());
                        Cookie cookie = new Cookie("username", username + ":" + encodedPassword);
                        cookie.setMaxAge(60 * 60 * 24 * 7);
                        response.addCookie(cookie);
                    }
                }
            }
            request.setAttribute("login", true);
            request.getRequestDispatcher("/FLM/home").forward(request, response);
        }
    }

}
