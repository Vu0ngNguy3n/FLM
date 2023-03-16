/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author HP
 */
public class LoadMoreController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountDBContext accountdb = new AccountDBContext();
        PrintWriter out = resp.getWriter();
        String userSearch = "";
        if (req.getParameter("userSearch") != null) {
            userSearch = req.getParameter("userSearch");
        }
        int index = Integer.parseInt(req.getParameter("num"));
        ArrayList<Account> accounts = accountdb.accounts(userSearch, index);
        int count = index * 6;
        for (Account account : accounts) {
            count++;
            out.println("<tr class=\"numrow\">\n"
                    + "                                                    <td class=\"pl-4\">" + count + "</td>\n"
                    + "                                                    <td>\n"
                    + "                                                        <h5 class=\"font-medium mb-0\"");
            if (account.isActive() == false) {
                out.println("style=\"color: red\"");
            }
            out.println(">" + account.getFullname() + "</h5>\n"
                    + "                                                        <span class=\"text-muted\">" + account.getUsername() + "</span>\n"
                    + "                                                    </td>\n"
                    + "\n"
                    + "                                                    <td>\n"
                    + "                                                        <span class=\"text-muted\">" + account.getGmail() + "</span><br />\n"
                    + "                                                        <span class=\"text-muted\">" + account.getPhone() + "</span>\n"
                    + "                                                    </td>\n"
                    + "                                                    <td>\n"
                    + "                                                        <span class=\"text-muted\">" + account.getRole().getRolename() + "</span><br />\n"
                    + "                                                        <span class=\"text-muted\">FPT University</span>\n"
                    + "                                                    </td>\n"
                    + "\n"
                    + "                                                    <td style=\"display: flex; justify-content: left;\">\n"
                    + "");
            if (!req.getParameter("name").equals(account.getUsername())) {
                out.println("<button type=\"button\" class=\"btn \" data-toggle=\"modal\" data-target=\"#exampleModal\"");
                if (account.isActive() == false) {
                    out.println("style=\"background-color: red; color: white\"");
                } else {
                    out.println("style=\"background-color: green; color: white\"");
                }
                out.println(">\n");
                if (account.isActive() == false) {
                    out.println("InActive");
                } else {
                    out.println("Active");
                }
                out.println("                                                        </button>\n"
                        + "\n"
                        + "                                                        <!-- Modal -->\n"
                        + "                                                        <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n"
                        + "                                                            <div class=\"modal-dialog\" role=\"document\">\n"
                        + "                                                                <div class=\"modal-content\">\n"
                        + "                                                                    <div class=\"modal-header\">\n"
                        + "                                                                        <h5 class=\"modal-title\" id=\"exampleModalLabel\" style=\"color: yellowgreen\">Warning</h5>\n"
                        + "                                                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n"
                        + "                                                                            <span aria-hidden=\"true\">&times;</span>\n"
                        + "                                                                        </button>\n"
                        + "                                                                    </div>\n"
                        + "                                                                    <form action=\"" + req.getContextPath() + "/FLM/userlist\" method=\"POST\">\n"
                        + "                                                                        <div class=\"modal-body\">\n"
                        + "                                                                            <input type=\"text\" name=\"username\" value=\"" + account.getUsername() + "\">\n"
                        + "                                                                            <input type=\"text\" name=\"active\" value=\"" + account.isActive() + "\">\n");
//                        + "                                                                            <c:if test=\"${a.active eq false}\">\n"
//                        + "                                                                                Are you sure to Active user: ${a.fullname}\n"
//                        + "                                                                            </c:if>\n"
//                        + "                                                                            <c:if test=\"${a.active eq true}\">\n"
//                        + "                                                                                Are you sure to InActive user: ${a.fullname}\n"
//                        + "                                                                            </c:if>\n"
                if (account.isActive() == false) {
                    out.println("Are you sure to Active user: " + account.getFullname());
                } else {
                    out.println("Are you sure to InActive user: " + account.getFullname());
                }
                out.println("                                                                        </div>\n"
                        + "                                                                        <div class=\"modal-footer\">\n"
                        + "                                                                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n"
                        + "                                                                            <button type=\"submit\" class=\"btn btn-primary\">Save changes</button>\n"
                        + "                                                                        </div>\n"
                        + "                                                                    </form>\n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div> ");
            }

            out.println("</td>\n"
                    + "                                                    <td>\n"
                    + "\n"
                    + "\n"
                    + "                                                        <button\n"
                    + "                                                            type=\"button\"\n"
                    + "                                                            class=\"btn btn-outline-info btn-circle btn-lg btn-circle ml-2\"\n"
                    + "                                                            >\n"
                    + "                                                            <i class=\"fa fa-trash\"></i>\n"
                    + "                                                        </button>\n"
                    + "                                                        <button\n"
                    + "                                                            type=\"button\"\n"
                    + "                                                            class=\"btn btn-outline-info btn-circle btn-lg btn-circle ml-2\"\n"
                    + "                                                            >\n"
                    + "                                                            <i class=\"fa fa-edit\"></i>\n"
                    + "                                                        </button>\n"
                    + "\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>");

        }

    }

}
