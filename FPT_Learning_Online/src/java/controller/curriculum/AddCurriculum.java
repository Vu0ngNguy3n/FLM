/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.curriculum;

import dal.CurriculumDBContext;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author trinh
 */
@WebServlet(name = "AddCurriculum", urlPatterns = {"/FLM/addcurriculum"})
public class AddCurriculum extends HttpServlet {

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
        request.getRequestDispatcher("/view/curriculum/curriculumdetail.jsp").forward(request, response);      
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
//      response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
         String codeCurriculum = request.getParameter("codeCurriculum");
        String nameCurriculum = request.getParameter("nameCurriculum");
        String description = request.getParameter("description");
        String decision = request.getParameter("decision");
        String credit_raw = request.getParameter("credit");
        
        try {
            int credit = Integer.parseInt(credit_raw);
            CurriculumDBContext dao = new CurriculumDBContext();
        dao.insertCurriculum(codeCurriculum, nameCurriculum, description, decision, credit);
        } catch (Exception e) {
        }
        
        response.sendRedirect("curriculumdetail");
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
