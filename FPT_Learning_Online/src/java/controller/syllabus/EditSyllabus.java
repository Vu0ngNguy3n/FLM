/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.syllabus;

import controller.curriculum.*;
import dal.CurriculumDBContext;
import dal.SyllabusDBContext;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Curriculum;
import model.Syllabus;

/**
 *
 * @author trinh
 */
@WebServlet(name = "EditSyllabus", urlPatterns = {"/FLM/editsyllabus"})
public class EditSyllabus extends HttpServlet {

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
        String raw_id = request.getParameter("syllabusId");     
        SyllabusDBContext dao = new SyllabusDBContext();
        try {
          int  syllabusId = Integer.parseInt(raw_id);          
            Syllabus cur = dao.getSyllabusByID(syllabusId);
            request.setAttribute("cur", cur);
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("/view/syllabus/editsyllabus.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        SyllabusDBContext dao = new SyllabusDBContext();
      String raw_id = request.getParameter("syllabusId");
        String sylcode = request.getParameter("sylcode");
        String sylnameEn = request.getParameter("sylnameEn");
        String sylnameVn = request.getParameter("sylnameVn");
        String raw_isActive = request.getParameter("isActive");
        String raw_isApproved = request.getParameter("isApproved");
        String decisionNo = request.getParameter("decisionNo");
        try {
           int id = Integer.parseInt(raw_id);
         Boolean isApproved = Boolean.parseBoolean( raw_isActive);
            Boolean isActive = Boolean.parseBoolean(raw_isApproved);
//            Curriculum c = new Curriculum(id, curCode, curName, description, decisionNo, credit);
            Syllabus c= new Syllabus(id, sylcode, sylnameEn, sylnameVn, isActive, isApproved, decisionNo);
            
            dao.editSyllabus(c);           
        } catch (Exception e) {
            System.out.println(e);
        }
        response.sendRedirect("syllabusdetail");
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
