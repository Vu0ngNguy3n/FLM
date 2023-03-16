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
import model.Assessments;
import model.CLO;
import model.Material;
import model.Question;
import model.Session;
import model.SyllabusDetail;

/**
 *
 * @author bongt
 */
@WebServlet(name = "SyllabusDetailViewServlet", urlPatterns = {"/FLM/syllabusdetails"})
public class SyllabusDetailViewServlet extends HttpServlet {

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
            out.println("<title>Servlet SyllabusDetailViewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SyllabusDetailViewServlet at " + request.getContextPath() + "</h1>");
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
        String txt = request.getParameter("id");
        SyllabusDBContext dBContext = new SyllabusDBContext();
        String subcode = dBContext.getSubjectcode(txt);
        List<Material> material = dBContext.getMaterial(subcode);
        List<CLO> clo = dBContext.getClo(txt);
        SyllabusDetail sy = new SyllabusDetail();
        sy = dBContext.getSyllabusDetail(txt);
        List<Session> ses = dBContext.getSession(txt);
        List<Question> ques=dBContext.getQuestion(txt);
        List<Assessments> assess= dBContext.getAssessmentses(txt);
        
        request.getSession().setAttribute("sy", sy);
        request.getSession().setAttribute("id", txt);
        request.setAttribute("clo", clo);
        request.setAttribute("material", material);
        request.setAttribute("session", ses);
        request.setAttribute("ques", ques);
        request.setAttribute("a", assess);
        request.getRequestDispatcher("/view/syllabus/syllabusdetailview.jsp").forward(request, response);
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
        processRequest(request, response);
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
