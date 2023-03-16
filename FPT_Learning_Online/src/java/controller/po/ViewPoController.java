/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.po;

import dal.CurriculumDBContext;
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
public class ViewPoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid"));
        PoDBContext po = new PoDBContext();
        List<Curriculum> plolist = po.getPLODetail(cid);
        List<Curriculum> polist = po.getPODetail(cid);
        List<Curriculum> poplolist = po.getPOPLODetail(cid);

        req.setAttribute("plolist", plolist);
        req.setAttribute("polist", polist);
        req.setAttribute("poplolist", poplolist);

        MappingDBContext map = new MappingDBContext();
        List<Mapping> mapping = map.getMapping(cid);
        req.setAttribute("mapping", mapping);

        req.getRequestDispatcher("/view/po/viewpo.jsp").forward(req, resp);
    }

}
