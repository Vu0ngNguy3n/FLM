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
import model.Curriculum;

/**
 *
 * @author trinh
 */
@WebServlet(name = "EditCurriculum", urlPatterns = {"/FLM/edit"})
public class EditCurriculum extends HttpServlet {

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
        String raw_id = request.getParameter("curriculumId");
      
        int id;
        CurriculumDBContext dao = new CurriculumDBContext();
        try {
            id = Integer.parseInt(raw_id);
           
            Curriculum cur = dao.getCurriculumByID(id);
            request.setAttribute("cur", cur);
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("/view/curriculum/editcurriculum.jsp").forward(request, response);
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
      String raw_id = request.getParameter("curriculumId");
        String curCode = request.getParameter("codeCurriculum");
        String curName = request.getParameter("nameCurriculum");
        String description = request.getParameter("description");
        String decisionNo = request.getParameter("decision");
        String raw_credit = request.getParameter("credit");
//        credit = request.getParameter("credit");
//         String credit_id = request.getParameter("curriculumId");
        int id,credit;
        CurriculumDBContext dao = new CurriculumDBContext();
        try {
            id = Integer.parseInt(raw_id);
            credit= Integer.parseInt(raw_credit);
            Curriculum c = new Curriculum(id, curCode, curName, description, decisionNo,credit);
            
            dao.editCurriculum(c);
            
            
        } catch (Exception e) {
            System.out.println(e);
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
