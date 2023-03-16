/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.combo;

import dal.ComboDBContext;
import dal.CurriculumDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Combo;
import model.Curriculum;
import model.Subject;

/**
 *
 * @author HP
 */
public class ComboChangeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 0) {
            ComboDBContext comboDB = new ComboDBContext();
            CurriculumDBContext curriculumDB = new CurriculumDBContext();
            int comboId = Integer.parseInt(request.getParameter("comboId"));
            Combo combo = comboDB.getComboDetail(comboId);
            Curriculum curriculum = curriculumDB.getCurriculumByID(combo.getCurriculumId());
//            String curriculumCode = curriculum.getCurriculumCode();
            request.setAttribute("combo", combo);
//            request.setAttribute("curriculumCode", curriculumCode);
        }
        SubjectDBContext subjectDB = new SubjectDBContext();
        CurriculumDBContext curriculumDB = new CurriculumDBContext();
        ArrayList<Subject> subjects = subjectDB.subjectSelect();
        ArrayList<Curriculum> curriculums = curriculumDB.curriculums();

        request.setAttribute("curriculums", curriculums);
        request.setAttribute("subjects", subjects);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../view/combo/comboView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String comboName = request.getParameter("comboName");
        String note = request.getParameter("note");
        int curriculum = Integer.parseInt(request.getParameter("curriculum"));
        String[] subjects = request.getParameterValues("subjects");
        int status = Integer.parseInt(request.getParameter("status"));
        ComboDBContext comboDB = new ComboDBContext();
        if (status == 1) {
            comboDB.insertCombo(comboName, note, curriculum);
            for (String subject : subjects) {
                comboDB.insertComboSubject(subject);
            }
            request.setAttribute("add", true);
            request.setAttribute("comboName", comboName);
        } else if (status == 0) {
            int comboId = Integer.parseInt(request.getParameter("comboId"));
            comboDB.updateCombo(comboName, note, curriculum, comboId);
            comboDB.removeComboSubject(comboId);
            for (String subject : subjects) {
                comboDB.updateComboSubject(comboId, subject);
            }
            request.setAttribute("update", true);
            request.setAttribute("comboName", comboName);

        }
        request.getRequestDispatcher("/FLM/comboview").forward(request, response);
    }

}
