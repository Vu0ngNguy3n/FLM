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
import java.util.Collections;
import java.util.Comparator;
import model.Combo;
import model.Subject;

/**
 *
 * @author HP
 */
public class SubjectListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subjectCode = "";
        if (request.getParameter("add") != null) {
            request.setAttribute("add", true);
            request.removeAttribute("subjectCode");
        }
        if (request.getParameter("update") != null) {
            request.setAttribute("update", true);
            request.removeAttribute("subjectCode");
        }
        if (request.getParameter("subjectCode") != null) {
            subjectCode = request.getParameter("subjectCode");
        }
        boolean sort = true;
        if (request.getParameter("sort") != null) {
            sort = Boolean.parseBoolean(request.getParameter("sort"));
        }

        SubjectDBContext subjectDB = new SubjectDBContext();
        ArrayList<Subject> subjects = subjectDB.subjects(subjectCode, 0);
        if (sort == false) {
            if (request.getParameter("by").equals("name")) {
                Collections.sort(subjects, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject sub1, Subject sub2) {
                        if (sub1.getSubjectNameVn().compareTo(sub2.getSubjectNameVn()) > 0) {
                            return 1;
                        } else {
                            if (sub1.getSubjectNameVn().compareTo(sub2.getSubjectNameVn()) < 0) {
                                return -1;
                            } else {
                                return 0;
                            }
                        }
                    }
                });
            } else if (request.getParameter("by").equals("code")) {
                Collections.sort(subjects, new Comparator<Subject>() {
                    @Override
                    public int compare(Subject sub1, Subject sub2) {
                        if (sub1.getSubjectCode().compareTo(sub2.getSubjectCode()) > 0) {
                            return 1;
                        } else {
                            if (sub1.getSubjectCode().compareTo(sub2.getSubjectCode()) < 0) {
                                return -1;
                            } else {
                                return 0;
                            }
                        }
                    }
                });
                
            }

        }
        int totalPage = subjectDB.totalSubject(subjectCode);
        request.setAttribute("sort", sort);
        request.setAttribute("subjectCode", subjectCode);
        request.setAttribute("pages", totalPage);
        request.setAttribute("subjects", subjects);
        request.setAttribute("isNull", subjects.size());
        request.getRequestDispatcher("../view/subject/subjectList.jsp").forward(request, response);

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
