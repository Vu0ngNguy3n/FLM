/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.syllabus;

import dal.SyllabusDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Subject;
import model.Syllabus;

/**
 *
 * @author asus
 */
@WebServlet(name="Addsyl", urlPatterns={"/FLM/addsyl"})
public class Addsyl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Addsyl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addsyl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
           request.getRequestDispatcher("/view/syllabus/syllabusdetail.jsp").forward(request, response); 
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//  String txt = request.getParameter("txt");
//            SyllabusDBContext syl = new SyllabusDBContext();
//        List<Syllabus> list = syl.searchByCodeSyl(txt);    
SyllabusDBContext dao = new SyllabusDBContext();
        String codesyl = request.getParameter("codesyl");
        String namesyl = request.getParameter("namesyl");
        String namesyl2 = request.getParameter("namesyl2");       
        String isactive_raw = request.getParameter("isactive");
        String isapproved_raw = request.getParameter("isapproved");
        String descriptionnosyl = request.getParameter("descriptionnosyl");
        try {

             Boolean isApproved = Boolean.parseBoolean(isapproved_raw);
            Boolean isActive = Boolean.parseBoolean(isactive_raw);
            
           
   dao.insertSyllabus(codesyl, namesyl, namesyl2,isActive,isApproved, descriptionnosyl);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("syllabusdetail");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
