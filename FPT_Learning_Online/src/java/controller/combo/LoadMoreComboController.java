/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.combo;

import dal.ComboDBContext;
import dal.CurriculumDBContext;
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
import model.Subject;

/**
 *
 * @author HP
 */
public class LoadMoreComboController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ComboDBContext comboDB = new ComboDBContext();
        String comboSearch = "";
        if (request.getParameter("comboSearch") != null) {
            comboSearch = request.getParameter("comboSearch");
        }
        boolean sort = true;
        if(request.getParameter("sort") != null){
            sort = Boolean.parseBoolean(request.getParameter("sort"));
        }
        PrintWriter out = response.getWriter();
        ArrayList<Combo> combos = comboDB.combos(comboSearch);
        CurriculumDBContext curriculum = new CurriculumDBContext();
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
        int page = Integer.parseInt(request.getParameter("num"));
        for (int i = page * 10; i < page * 10 + 10; i++) {
            out.println("<tr class=\"numrow\">\n"
                    + "                            <td>" + combos.get(i).getComboid() + "</td>\n"
                    + "                            <td><p>" + combos.get(i).getComboNameVn() + "</p></td>\n"
                    + "                            <td>" + curriculum.curriculumCode(combos.get(i).getCurriculumId()) + "</td>\n"
                    + "                            <td>\n"
                    + "                                <ul style=\"list-style-type: none\">");
            
            if (combos.get(i).getSubjects() != null) {
                ArrayList<Subject> subjects = combos.get(i).getSubjects();
                for (Subject subject : subjects) {
                    out.println("<li style=\"font-size: 16px\">\n"
                            + "                                            " + subject.getSubjectCode() + "\n"
                            + "                                        </li>");
                }
                
            }
            
            out.println("</ul>\n"
                    + "                            </td>\n"
                    + "                            <td>\n"
                    + "                                <button class=\"add btn btn-outline-warning   mb-2 \" style=\"color: white; background-color: orange;\" >\n"
                    + "                                        <i class=\"fa-solid fa-plus mr-1\"></i><a href=\"" + request.getContextPath() + "/FLM/combochange?status=0&comboId=" + combos.get(i).getComboid() + "\" style=\"text-decoration: none; color: white\">Edit</a>\n"
                    + "                                    </button>"
                    + "                            </td>\n"
                    + "                        </tr>");
        }
        
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
