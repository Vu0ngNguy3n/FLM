/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.elective;

import dal.CurriculumDBContext;
import dal.ElectiveDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Curriculum;
import model.Elective;

/**
 *
 * @author HP
 */
public class ElectiveController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int curriculumId = Integer.parseInt(request.getParameter("curriculumId"));
        CurriculumDBContext curriculumDb = new CurriculumDBContext();
        Curriculum curriculum = curriculumDb.getCurriculumByID(curriculumId);
        ElectiveDBContext electiveDb = new ElectiveDBContext();
        ArrayList<Elective> electives = electiveDb.getElectives(curriculumId);
        
        request.setAttribute("electives", electives);
        request.setAttribute("curriculum", curriculum);
        request.getRequestDispatcher("../view/elective/elective.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
