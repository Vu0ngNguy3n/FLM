/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import PasswordEncryption.PasswordEncryption;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;
import model.Account;
import org.apache.commons.logging.Log;

/**
 *
 * @author l
 */
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDBContext accountDBContext = new AccountDBContext();
        HttpSession session = req.getSession();
        // đã login
        Account account = (Account) session.getAttribute("account");
        String password = req.getParameter("password");
        String npassword = req.getParameter("npassword");
        String repassword = req.getParameter("repassword");
        req.setAttribute("password", password);
        req.setAttribute("npassword", npassword);
        req.setAttribute("repassword", repassword);
        if (!npassword.equals(repassword)) {
            req.setAttribute("notConfirm", "Confirm password does not match");
        } else {
            password = PasswordEncryption.PasswordEncode(password).toString();
            if (account.getPassword().equals(password)) {
                npassword = PasswordEncryption.PasswordEncode(npassword).toString();
                accountDBContext.updatePasswordByUsername(account.getGmail(), npassword);
                req.setAttribute("succi", "Password changed successfully. Please comback to home page");

            } else {
                req.setAttribute("succi", "Incorrect password.");
            }
        }
        req.getRequestDispatcher("../view/changepass/changepass.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                req.getRequestDispatcher("../view/changepass/changepass.jsp").forward(req, resp);

    }

   

}
