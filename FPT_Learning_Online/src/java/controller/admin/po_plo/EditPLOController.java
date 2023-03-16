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
import model.PLO;
import model.PO;

/**
 *
 * @author l
 */
public class EditPLOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_id = req.getParameter("ploid1");
        String ploname1 = req.getParameter("ploname1");
        String plodescription1 = req.getParameter("plodescription1");
        String raw_curriculumid1 = req.getParameter("curriculumid1");

        int id, curriculumid;
        PoDBContext po = new PoDBContext();
        try {
            id = Integer.parseInt(raw_id);
            curriculumid = Integer.parseInt(raw_curriculumid1);
            po.UpdatePlo(ploname1, plodescription1, curriculumid, id);
        } catch (Exception e) {
            System.out.println(e);
        }
        resp.sendRedirect(req.getContextPath() + "/FLM/plolist");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_id = req.getParameter("ploid1");
        int id;
        PoDBContext dao = new PoDBContext();
        try {
            id = Integer.parseInt(raw_id);
            PLO cur = dao.getPlobyID(id);
            req.setAttribute("cur", cur);
        } catch (Exception e) {
            System.out.println(e);
        }
        req.getRequestDispatcher("/view/admin/POPLO/PLOEdit.jsp").forward(req, resp);
    }

}
