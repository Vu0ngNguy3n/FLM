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
import model.Decision;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DecisionDetailController", urlPatterns = {"/FLM/decisionDetail"})
public class DecisionDetailController extends HttpServlet {

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
            out.println("<title>Servlet DecisionDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DecisionDetailController at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id = 0;

        try {

            id = Integer.parseInt(id_raw);

        } catch (NumberFormatException e) {
            System.out.println("decisiondetail - get " + e);
        }

        DecisionDAO dao = new DecisionDAO();
        Decision decision = dao.getDecisionByDecisionID(id);

        request.setAttribute("decision", decision);

        request.getRequestDispatcher("/view/admin/decision/detail.jsp").forward(request, response);
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
        String decisionID = request.getParameter("id");

        DecisionDAO dao = new DecisionDAO();

        String decisionNo = request.getParameter("decisionNo");
        String name = request.getParameter("name");
        String note = request.getParameter("note");
        String active = request.getParameter("isActive");
        String fileName = request.getParameter("fileName");
        boolean isActive = active.equalsIgnoreCase("true");
        String approved = request.getParameter("isApproved");
        boolean isApproved = approved.equalsIgnoreCase("true");
        int id = 0;
        try {
            id = Integer.parseInt(decisionID);

        } catch (NumberFormatException e) {
            System.out.println("decision detail controller " + e);
        }
        Decision decision = dao.getDecisionByDecisionID(id);
        if (decisionNo != null && !decisionNo.isEmpty()) {

            boolean status = dao.checkExist(decisionNo, decision.getDecisionNo());
            if (status) {
                request.setAttribute("error", "DecisionNo Was Exist");
                request.setAttribute("decision", decision);

                request.getRequestDispatcher("/view/admin/decision/detail.jsp").forward(request, response);
            } else {

                decision.setDecisionNo(decisionNo);
                decision.setDecisionName(name);
                decision.setNote(note);
                decision.setFileName(fileName);
                decision.setIsActive(isActive);
                decision.setIsApproved(isApproved);

                dao.updateDecision(decision);

                HttpSession session = request.getSession();
                session.setAttribute("message", "Update");

                response.sendRedirect("decisionDetail?id=" + id);
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
