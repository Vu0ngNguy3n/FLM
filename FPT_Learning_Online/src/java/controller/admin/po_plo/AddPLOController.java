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

/**
 *
 * @author l
 */
public class AddPLOController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ploId = Integer.parseInt(req.getParameter("ploid"));
        String ploName = req.getParameter("ploName");
        String ploDecription = req.getParameter("ploDecription");
        int cuid = Integer.parseInt(req.getParameter("cuid"));
        PoDBContext po = new PoDBContext();
        po.InsertPlo(ploId, ploName, ploDecription, cuid);
        req.setAttribute("plo", ploId);
        resp.sendRedirect(req.getContextPath() + "/FLM/plolist");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        // 
        PoDBContext po = new PoDBContext();
        List<Integer> poIdList = po.getPLOLargestID();
        int largestPloId = poIdList.get(0);
        req.setAttribute("largestPloId", largestPloId);
        
        req.getRequestDispatcher("/view/admin/POPLO/PLOAdd.jsp").forward(req, resp);
    }

}
