/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.po;

import dal.PoDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.PO;

/**
 *
 * @author l
 */
public class PoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String poid = req.getParameter("pid");//search
        //     int pid = Integer.parseInt(req.getParameter("poid"));

        PoDBContext po = new PoDBContext();
        List<PO> list = po.searchAll(poid);
        if (list.isEmpty()) {
            String message = "ID = " + poid + " does not exist!";
            req.setAttribute("message", message);
        }
//        req.setAttribute("poId", poId);
        req.setAttribute("list", list);
        req.getRequestDispatcher("../view/po/po.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../view/po/po.jsp").forward(req, resp);
    }

//    @Override
//    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        String poid = req.getParameter("pid");//search
//        PoDBContext po = new PoDBContext();
//        List<PO> list = po.searchAll(poid);
//        if (list.isEmpty()) {
//            String message = "PoID = " + poid + " does not exist!";
//            req.setAttribute("message", message);
//        }
////        req.setAttribute("poId", poId);
//        req.setAttribute("list", list);
//        req.getRequestDispatcher("../view/po/po.jsp").forward(req, resp);
//    }
//
//    @Override
//    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("../view/po/po.jsp").forward(req, resp);
//    }
}
