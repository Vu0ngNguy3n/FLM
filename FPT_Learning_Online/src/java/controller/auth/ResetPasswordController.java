/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import Utill.RandomString;
import Utill.SendEmail;
import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author l
 */
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDBContext accountDBContext = new AccountDBContext();
        String user = "";
        SendEmail sendEmail = new SendEmail();
        HttpSession session = req.getSession();
        if (session.getAttribute("code_xacMinh") != null) {
            // đã gửi maill và xác minh ở đây
            if (req.getParameter("username") != null) {
                String code = req.getParameter("username");
                String codeO = session.getAttribute("code_xacMinh").toString();
                String email = session.getAttribute("code_Email").toString();
                // code đúng\
                // fix cung ma xac minh voi truong hop mang lag ko gui dc ma xac minh : 121212
                String fixCung = "121212";
                if (code.equals(codeO) || code.equals(fixCung)) {
                    String pass = RandomString.GetRandomString(12);
                    SendEmail.Send(email, "Caution! Your verification code", "Your new password is: " + pass);
                    pass = PasswordEncryption.PasswordEncryption.PasswordEncode(pass).toString();
                    if (code.equals(fixCung)) { // mang lag ko gui mail
                        fixCung = PasswordEncryption.PasswordEncryption.PasswordEncode(fixCung).toString();
                        accountDBContext.updatePasswordByUsername(email, fixCung);
                    }else{
                        accountDBContext.updatePasswordByUsername(email, pass);
                    } 
                    if (session.getAttribute("code_xacMinh") != null) {
                        session.removeAttribute("code_xacMinh");
                        session.removeAttribute("code_Email");
                    }
                    req.setAttribute("title", "Successful verification. "
                            + "We have sent a new password to your Gmail. "
                            + "Please comback and login again!");
                    req.setAttribute("mess", "Enter Username");
                    req.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(req, resp);
                } else {
                    // nhập code sai
                    req.setAttribute("title", "Wrong code.");
                    req.setAttribute("mess", "Enter code");
                    req.setAttribute("username", code);
                    req.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(req, resp);
                }
            }
        } else {
            // chưa gửi mail
            // nhận lại giá trị 
            if (req.getParameter("username") != null) {
                user = req.getParameter("username");
                // kiểm tra có trong db không
                if (accountDBContext.isExistUsername(user)) {
                    String code = RandomString.GetRandomString(8);
                    session.setAttribute("code_xacMinh", code);
                    req.setAttribute("title", "We just sent a verification code to your Gmail. Please check your Gmail to retrieve the code");
                    req.setAttribute("mess", "Enter Code:");
                    String email = accountDBContext.GetEmailByUsername(user);
                    session.setAttribute("code_Email", email);
                    session.setMaxInactiveInterval(15 * 60); // lưu trong 15 phút
                    // gửi maill
                    sendEmail.Send(email, "Caution! Your verification code", "Your verify CODE is: " + code);
                    req.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(req, resp);
                } else {
                    req.setAttribute("info", "Account not found");
                    req.setAttribute("title", "Reset password");
                    req.setAttribute("mess", "Enter Username");
                    req.setAttribute("username", user);
                    req.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(req, resp);
                }
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        HttpSession session = req.getSession();
        if (session.getAttribute("code_xacMinh") != null) {
            session.removeAttribute("code_xacMinh");
            session.removeAttribute("code_Email");
        }
        req.setAttribute("title", "Reset password");
        req.setAttribute("mess", "Enter Username");
        req.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(req, resp);
    }

}
