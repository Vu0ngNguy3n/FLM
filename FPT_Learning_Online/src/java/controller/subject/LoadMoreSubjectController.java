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
import model.preRequisite;

/**
 *
 * @author HP
 */
public class LoadMoreSubjectController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SubjectDBContext subjectDB = new SubjectDBContext();
        String subjectCode = "";
        PrintWriter out = response.getWriter();
        if (request.getParameter("subjectCode") != null) {
            subjectCode = request.getParameter("subjectCode");
        }
        int page = Integer.parseInt(request.getParameter("num"));
        ArrayList<Subject> subjects = subjectDB.subjects(subjectCode, page);
        int index = page * 10;
        for (Subject subject : subjects) {
            index++;
            out.println("<tr class=\"numrow\">\n"
                    + "                            <th>" + index + "</th>\n"
                    + "                            <th>" + subject.getSubjectCode() + "</th>\n"
                    + "                            <td><p>" + subject.getSubjectNameVn() + "</p></td>\n"
                    + "                            <td>" + subject.getSemester() + "</td>\n"
                    + "                            <td>" + subject.getNoCredit() + "</td>\n"
                    + "                            <td>\n"
                    + "                                <ul style=\"list-style-type: none\">");

            if (subject.getPreRequisites() != null) {
                ArrayList<preRequisite> pres = subject.getPreRequisites();
                for (preRequisite pre : pres) {
                    out.println("<li style=\"font-size: 16px\">\n"
                            + "                                            " + pre.getPre() + "\n"
                            + "                                        </li>");
                }

            }

            out.println("</ul>\n"
                    + "                            </td>\n"
                    + "                            <td>\n"
                    + "<button class=\"add btn btn-outline-warning   mb-2 \" style=\"color: white; background-color: orange;\" >\n"
                    + "                                        <i class=\"fa-solid fa-plus mr-1\"></i><a href=\"" + request.getContextPath() + "/FLM/subjectview?status=0"
                    + "\" style=\"text-decoration: none; color: white\">Edit</a>\n"
                    + "                                    </button>"
                    + "                            </td>\n"
                    + "\n"
                    + "                        </tr>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
