///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package controller.po;
//
//import dal.PoDBContext;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//import model.PO;
//
///**
// *
// * @author l
// */
//public class InsertPoController extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int poId = Integer.parseInt(req.getParameter("poid"));
//        String poName = req.getParameter("poName");
//        String poDecription = req.getParameter("poDecription");
//        int cid = Integer.parseInt(req.getParameter("cid"));
//        PoDBContext po = new PoDBContext();
//        po.InsertPo(poId, poName, poDecription, cid);
//        req.setAttribute("po", poId);
//        resp.sendRedirect(req.getContextPath() + "/FLM/curriculum");
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int cid = Integer.parseInt(req.getParameter("cid"));
//        PoDBContext po = new PoDBContext();
//        po.getPODetail(cid);
//        req.setAttribute("po", cid);
//        req.getRequestDispatcher("/view/po/insertpo.jsp").forward(req, resp);
//    }
//
//}
