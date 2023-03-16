/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.admin.po_plo;

import dal.PoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.PLO;
import model.PO;

/**
 *
 * @author l
 */
public class ListPLOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ploid = req.getParameter("plid");//search
        PoDBContext po = new PoDBContext();
        List<PLO> listplo = po.searchPLO(ploid);
        if (listplo.isEmpty()) {
            String message = "ID = " + ploid + " does not exist!";
            req.setAttribute("message", message);
        }
        req.setAttribute("listplo", listplo);
        req.getRequestDispatcher("/view/admin/POPLO/PLOList.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/admin/POPLO/PLOList.jsp").forward(req, resp);
    }

}
