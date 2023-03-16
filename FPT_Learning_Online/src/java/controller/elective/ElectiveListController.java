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
import java.util.ArrayList;
import model.Elective;

/**
 *
 * @author HP
 */
public class ElectiveListController extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String electiveSearch = "";
        int defaultNumber = 0;
        if(request.getParameter("electiveSearch") != null){
            electiveSearch= request.getParameter("electiveSearch");
        }
        if(request.getParameter("page")!= null){
            defaultNumber = Integer.parseInt(request.getParameter("page"));
        }
        
        
        ElectiveDBContext electiveDb = new ElectiveDBContext();
        ArrayList<Elective> electives = electiveDb.electives(electiveSearch);
        int total = electives.size();
        String electiveName = request.getParameter("electiveName");
        if(request.getParameter("update") != null){
            request.setAttribute("update",true );
        }
        if(request.getParameter("add") != null){
            request.setAttribute("add", true);
        }        
        request.setAttribute("electiveName", electiveName);
        request.setAttribute("page", defaultNumber);
        request.setAttribute("electives", electives);
        request.setAttribute("total", total);
        request.getRequestDispatcher("../view/elective/electivelist.jsp").forward(request, response);
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
