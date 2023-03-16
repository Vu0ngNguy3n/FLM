/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.decision;

import dal.DecisionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import model.Decision;

/**
 *
 * @author phanh
 */
@WebServlet(name = "DecisionAddController", urlPatterns = {"/FLM/decisionAdd"})
public class DecisionAddController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DecisionAddController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DecisionAddController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        request.getRequestDispatcher("/view/admin/decision/add.jsp").forward(request, response);
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
        String decisionNo = request.getParameter("decisionNo");
        String name = request.getParameter("name");
        String note = request.getParameter("note");
        String active = request.getParameter("isActive");
        String fileName = request.getParameter("fileName");
        boolean isActive = active.equalsIgnoreCase("true");
        String approved = request.getParameter("isApproved");
        boolean isApproved = approved.equalsIgnoreCase("true");
        if (decisionNo != null && !decisionNo.isEmpty()) {
            DecisionDAO dao = new DecisionDAO();

            boolean status = dao.checkExist(decisionNo, "");

            if (status) {
                request.setAttribute("error", "DecisionNo Was Exist");
                request.setAttribute("decisionNo", decisionNo);
                request.setAttribute("name", name);
                request.setAttribute("note", note);
                request.setAttribute("fileName", fileName);
                request.setAttribute("isActive", isActive);
                request.setAttribute("isApproved", isApproved);

                request.getRequestDispatcher("/view/admin/decision/add.jsp").forward(request, response);
            } else {
                LocalDate curDate = java.time.LocalDate.now();

                Decision decision = new Decision(0, decisionNo, name, Date.valueOf(curDate.toString()), note, Date.valueOf(curDate.toString()), fileName, isActive, isApproved);

                int result = dao.add(decision);

                HttpSession session = request.getSession();
                session.setAttribute("message", "Add");

                response.sendRedirect("decisionList");
            }

        }

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
