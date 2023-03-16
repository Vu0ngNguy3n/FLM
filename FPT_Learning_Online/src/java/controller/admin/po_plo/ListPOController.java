/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.po_plo;

import dal.MappingDBContext;
import dal.PoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Curriculum;
import model.Mapping;
import model.PO;

/**
 *
 * @author l
 */
public class ListPOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String poid = req.getParameter("pid");//search
        PoDBContext po = new PoDBContext();
        ArrayList<PO> list = po.SearchPObyCode(poid);
        System.out.println(list);
        if (list.isEmpty()) {
            String message = "ID = " + poid + " does not exist!";
            req.setAttribute("message", message);
        }
        req.setAttribute("list", list);
        req.getRequestDispatcher("/view/admin/POPLO/POList.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/POPLO/POList.jsp").forward(req, resp);
    }

}
