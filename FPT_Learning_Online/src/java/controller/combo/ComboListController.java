/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.combo;

import dal.ComboDBContext;
import dal.CurriculumDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Combo;
import model.Curriculum;

/**
 *
 * @author HP
 */
public class ComboListController extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int curriculumId = Integer.parseInt(req.getParameter("curriculumId"));
        CurriculumDBContext curriculumdb = new CurriculumDBContext();
        Curriculum curriculum = curriculumdb.getCurriculumByID(curriculumId);   
        ComboDBContext combodb = new ComboDBContext();
        ArrayList<Combo> combos = combodb.getCombo(curriculumId);
        req.setAttribute("combos", combos);
        req.setAttribute("isNull", combos.size());
        req.setAttribute("curriculumId", curriculumId);
        req.setAttribute("curriculum", curriculum);
        req.getRequestDispatcher("../view/combo/combo.jsp").forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
