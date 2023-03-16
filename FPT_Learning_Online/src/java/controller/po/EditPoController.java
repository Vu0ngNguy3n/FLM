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
//public class EditPoController extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String raw_id = req.getParameter("poid1");
//        String poname1 = req.getParameter("poname1");
//        String podescription1 = req.getParameter("podescription1");
//        String raw_curriculumid1 = req.getParameter("curriculumid1");
//
//        int id, curriculumid;
//        PoDBContext po = new PoDBContext();
//        try {
//            id = Integer.parseInt(raw_id);
//            curriculumid = Integer.parseInt(raw_curriculumid1);
//
//            po.UpdatePo(poname1, podescription1, curriculumid, id);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        resp.sendRedirect(req.getContextPath() + "/FLM/po/view?cid=" + raw_curriculumid1);
//        // resp.sendRedirect("../po");
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String raw_id = req.getParameter("poid1");
//        int id;
//        PoDBContext dao = new PoDBContext();
//        try {
//            id = Integer.parseInt(raw_id);
//            PO cur = dao.getPobyID(id);
//            req.setAttribute("cur", cur);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//        req.getRequestDispatcher("/view/po/editpo.jsp").forward(req, resp);
//
//    }
//}
