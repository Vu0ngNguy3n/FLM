/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.combo;

import dal.ComboDBContext;
import dal.ElectiveDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Combo;
import model.Elective;

/**
 *
 * @author HP
 */
public class ComboDetailsController extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int comboid = Integer.parseInt(req.getParameter("comboid"));
        
        ComboDBContext combodb = new ComboDBContext();
        Combo combo = combodb.getComboDetail(comboid);
        req.setAttribute("combo", combo);
        req.getRequestDispatcher("../view/combo/combodetails.jsp").forward(req, resp);
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
