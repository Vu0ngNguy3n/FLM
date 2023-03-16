/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import Utill.RandomString;
import Utill.SendEmail;
import controller.verifyguest.SendEmailVerifyPassword;
import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ConfirmEmailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            AccountDBContext accountDBContext = new AccountDBContext();
            SendEmailVerifyPassword sendEmail = new SendEmailVerifyPassword();
            HttpSession session = request.getSession();
            if (session.getAttribute("code_xacMinh") != null) {
                // đã gửi maill và xác minh ở đây

                String code = request.getParameter("username");
                String codeO = session.getAttribute("code_xacMinh").toString();
                String emailCon = session.getAttribute("code_Email").toString();
                // code đúng\
                // fix cung ma xac minh voi truong hop mang lag ko gui dc ma xac minh : 121212
                String fixCung = "121212";
                if (code.equals(codeO) || code.equals(fixCung)) {
                    String pass = RandomString.GetRandomString(12);
                    SendEmail.Send(emailCon, "Caution! Your verification code", "Your new password is: " + pass);
                    if (session.getAttribute("code_xacMinh") != null) {
                        session.removeAttribute("code_xacMinh");
                        session.removeAttribute("code_Email");
                    }
                    request.setAttribute("title", "Successful verification. "
                            + "We have sent a new password to your Gmail. "
                            + "Please comback and login again!");
                    request.setAttribute("mess", "Enter Username");
                    request.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(request, response);
                } else {
                    // nhập code sai
                    request.setAttribute("title", "Wrong code.");
                    request.setAttribute("mess", "Enter code");
                    request.setAttribute("username", code);
                    request.getRequestDispatcher("../view/resetpass/resetpass.jsp").forward(request, response);
                }

            } else {
                String fullname = request.getParameter("lastname");
                long phone = Long.parseLong(request.getParameter("phone"));
                String password = request.getParameter("password");
                String cpassword = request.getParameter("cpassword");
                request.setAttribute("username", username);
                request.setAttribute("fullname", fullname);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("password", password);
                request.setAttribute("cpasswword", cpassword);
                String code = RandomString.GetRandomString(8);
                session.setAttribute("code_xacMinh", code);
                session.setMaxInactiveInterval(15 * 60); // lưu trong 15 phút
                // gửi maill
                sendEmail.Send(email, "Congratulation! Your verification code", "Your verify CODE is: " + code);
                request.getRequestDispatcher("../view/guest/verifyemail.jsp").forward(request, response);
            }
            String fullname = request.getParameter("lastname");
            long phone = Long.parseLong(request.getParameter("phone"));
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            request.setAttribute("username", username);
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("password", password);
            request.setAttribute("cpasswword", cpassword);
            request.getRequestDispatcher("../view/guest/verifyemail.jsp").forward(request, response);
        }
    }

}
