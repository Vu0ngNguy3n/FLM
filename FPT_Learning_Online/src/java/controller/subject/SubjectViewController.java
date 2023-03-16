/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.subject;

import dal.SubjectDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Subject;

/**
 *
 * @author HP
 */
public class SubjectViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        SubjectDBContext subjectDB = new SubjectDBContext();
        if (status == 0) {
            String subjectCode = request.getParameter("subjectCode");
            Subject subject = subjectDB.getSubject(subjectCode);
            request.setAttribute("subject", subject);
        }
        ArrayList<Subject> subjects = subjectDB.subjectSelect();
        request.setAttribute("subjects", subjects);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../view/subject/subjectView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        String subjectCode = request.getParameter("subjectCode");
        String subjectName = request.getParameter("subjectName");
        int semester = Integer.parseInt(request.getParameter("semester"));
        int noCredit = Integer.parseInt(request.getParameter("noCredit"));
        SubjectDBContext subjectDB = new SubjectDBContext();
        if (status == 1) {
                subjectDB.addSubject(subjectCode, subjectName, semester, noCredit);
                ArrayList<Subject> subjects = subjectDB.subjects("", 0);
                int totalPage = subjectDB.totalSubject("");
                request.setAttribute("subjectCode1", subjectCode);
                request.setAttribute("subjects", subjects);
                request.setAttribute("pages", totalPage);
                request.setAttribute("add", true);
        } else if (status == 0) {
            subjectDB.updateSubject(subjectName, semester, noCredit, subjectCode);
            ArrayList<Subject> subjects = subjectDB.subjects("", 0);
            int totalPage = subjectDB.totalSubject("");
            request.setAttribute("subjectCode1", subjectCode);
            request.setAttribute("subjects", subjects);
            request.setAttribute("pages", totalPage);
            request.setAttribute("update", true);
        }
        request.getRequestDispatcher("../view/subject/subjectList.jsp").forward(request, response);
    }

}
