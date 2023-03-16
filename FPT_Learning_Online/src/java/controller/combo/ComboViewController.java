/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.combo;

import dal.ComboDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Combo;

/**
 *
 * @author HP
 */
public class ComboViewController extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String comboSearch = "";
        if(request.getParameter("comboSearch") != null){
            comboSearch = request.getParameter("comboSearch");
        }
        boolean sort = true;
        if(request.getParameter("sort") != null){
            sort = Boolean.parseBoolean(request.getParameter("sort"));
        }
        ComboDBContext comboDb=  new ComboDBContext();
        ArrayList<Combo> combos = comboDb.combos(comboSearch);
        int totalPage = comboDb.totalPage(comboSearch);
        if(sort==false){
            Collections.sort(combos, new Comparator<Combo>(){
                @Override
                public int compare(Combo cb1, Combo cb2){
                    if(cb1.getComboNameVn().compareTo(cb2.getComboNameVn())>0) {
                        return 1;
                    }else{
                        if(cb1.getComboNameVn().compareTo(cb2.getComboNameVn())< 0){
                            return -1;
                        }else{
                            return 0;
                        }
                    }
                }
            });
        }
        request.setAttribute("sort", sort);
        request.setAttribute("comboSearch", comboSearch);
        request.setAttribute("pages", totalPage);
        request.setAttribute("combos", combos);
        request.getRequestDispatcher("../view/combo/combolist.jsp").forward(request, response);
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
