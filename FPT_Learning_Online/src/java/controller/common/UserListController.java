/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.common;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author HP
 */
public class UserListController extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        AccountDBContext account = new AccountDBContext();
        if (req.getParameter("username") != null) {
            boolean active = Boolean.parseBoolean(req.getParameter("active"));
            account.updateAccount(req.getParameter("username"), active);
            req.setAttribute("update", active);
            req.setAttribute("userCheck", req.getParameter("username"));
        }
        String userSearch = "";
        if(req.getParameter("userSearch") != null){
            userSearch=req.getParameter("userSearch");
        }
        int pages= account.getNumPages(userSearch);
        ArrayList<Account> accounts = account.accounts(userSearch,0);
        req.setAttribute("pages", pages);
        req.setAttribute("isNull", accounts.size());
        req.setAttribute("userSearch", userSearch);
        req.setAttribute("accounts", accounts);
        req.getRequestDispatcher("../view/profile/userlist.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
