/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import PasswordEncryption.PasswordEncryption;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

/**
 *
 * @author admin
 */
public class GuestSignUpController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/guest/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        AccountDBContext accountdb = new AccountDBContext();
        if (accountdb.isExistUsername(username) || accountdb.isExistEmail(email)) {
            String fullname = request.getParameter("lastname");
            long phone = Long.parseLong(request.getParameter("phone"));
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            if (!accountdb.isExistUsername(username)) {
                request.setAttribute("username", username);
            } else {
                request.setAttribute("statusUser", accountdb.isExistUsername(username));
            }
            request.setAttribute("fullname", fullname);
            if (!accountdb.isExistEmail(email)) {
                request.setAttribute("email", email);
            } else {
                request.setAttribute("statusEmail", accountdb.isExistEmail(email));
            }
            request.setAttribute("phone", phone);
            request.setAttribute("password", password);
            request.setAttribute("cpasswword", cpassword);
            request.getRequestDispatcher("../view/guest/signup.jsp").forward(request, response);
        } else {
            String fullname = request.getParameter("lastname");
            long phone = Long.parseLong(request.getParameter("phone"));
            String password = PasswordEncryption.PasswordEncode(request.getParameter("password"));
            accountdb.guest(username, password, email, phone, fullname);
            request.getRequestDispatcher("login").forward(request, response);
        }
    }

}
