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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Curriculum;
import model.PO;

/**
 *
 * @author l
 */
public class EditPOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_id = req.getParameter("poid1");
        String poname1 = req.getParameter("poname1");
        String podescription1 = req.getParameter("podescription1");
        String curriculumcode = req.getParameter("curriculumid1");
        int id;
        PoDBContext po = new PoDBContext();
        try {
            id = Integer.parseInt(raw_id);
            po.updatePO(id, curriculumcode, poname1, podescription1);
        } catch (Exception e) {
            System.out.println(e);
        }
        resp.sendRedirect(req.getContextPath() + "/FLM/polist");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_id = req.getParameter("poid1");
        int id;
        PoDBContext dao = new PoDBContext();
        // lấy name curriculumn
        List<Curriculum> code = dao.getCurriCode();
        req.setAttribute("code", code);
        
        try {
            id = Integer.parseInt(raw_id);
            PO cur = dao.getPobyID(id);
            req.setAttribute("cur", cur);
        } catch (Exception e) {
            System.out.println(e);
        }
        req.getRequestDispatcher("/view/admin/POPLO/POEdit.jsp").forward(req, resp);
    }

}
