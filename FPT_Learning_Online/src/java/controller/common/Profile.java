/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.PageContext;
import java.sql.Date;
import model.Account;

/**
 *
 * @author Admin
 */
public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/profile/profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String phone_raw = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender_raw = request.getParameter("gender");
        String birthday_raw = request.getParameter("birthday");

        try {
            HttpSession session = request.getSession();

            Account a = (Account) session.getAttribute("account");

            if (!a.getFullname().equals(fullName) && fullName != null) {
                a.setFullname(fullName);
            }

            long phone = Long.parseLong(phone_raw);

            if (a.getPhone() != phone && phone_raw != null) {
                a.setPhone(phone);
            }

            if (!a.getAddress().equals(address) && address != null) {
                a.setAddress(address);
            }

            boolean gender = ("true".equalsIgnoreCase(gender_raw));

            if (a.isGender() != gender) {
                a.setGender(gender);
            }

            Date dob = Date.valueOf(birthday_raw);

            if (a.getDob() != dob) {
                a.setDob(dob);
            }

            AccountDAO dao = new AccountDAO();
            dao.update(a);

            session.setAttribute("account", a);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        response.sendRedirect("profile");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
