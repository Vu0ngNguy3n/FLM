/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.elective;

import dal.ElectiveDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Elective;

/**
 *
 * @author HP
 */
public class ElectiveDetailController extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ElectiveDBContext electiveDb = new ElectiveDBContext();
        int electiveId = Integer.parseInt(request.getParameter("electiveId"));
        Elective elective = electiveDb.getElectiveSubject(electiveId);
        request.setAttribute("elective", elective);
        request.getRequestDispatcher("../view/elective/electiveDetail.jsp").forward(request, response);
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

}
