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
import model.Curriculum;
import model.PO;

/**
 *
 * @author l
 */
public class AddPOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int poId = Integer.parseInt(req.getParameter("poid"));
        String poName = req.getParameter("poName");
        String poDecription = req.getParameter("poDecription");
        String code = req.getParameter("code");

        PoDBContext po = new PoDBContext();
        po.InsertPo(poId, poName, poDecription, code);
        req.setAttribute("po", poId);
        resp.sendRedirect(req.getContextPath() + "/FLM/polist");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String raw_cid = req.getParameter("cid");
        PoDBContext po = new PoDBContext();
        List<Curriculum> code = po.getCurriCode();
        req.setAttribute("code", code);
// mới 
        List<Integer> poIdList = po.getPOLargestID();
        int largestPoId = poIdList.get(0);
        req.setAttribute("largestPoId", largestPoId);

        int cid;
        try {
            cid = Integer.parseInt(raw_cid);
            po.getPODetail(cid);
            req.setAttribute("po", cid);
        } catch (Exception e) {
            System.out.println(e);
        }
        req.getRequestDispatcher("/view/admin/POPLO/POAdd.jsp").forward(req, resp);
    }

}
