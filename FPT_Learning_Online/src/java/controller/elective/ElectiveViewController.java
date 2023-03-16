package controller.elective;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.CurriculumDBContext;
import dal.ElectiveDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Curriculum;
import model.Elective;
import model.Subject;

/**
 *
 * @author HP
 */
public class ElectiveViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 0) {
            ElectiveDBContext electiveDb = new ElectiveDBContext();
            CurriculumDBContext curriculumDb = new CurriculumDBContext();
            int electiveId = Integer.parseInt(request.getParameter("electiveId"));
            int curriculumId = electiveDb.getCurriculumId(electiveId);
            Elective elective = electiveDb.getElectiveSubject(electiveId);

            request.setAttribute("curriculumId", curriculumId);
            request.setAttribute("elective", elective);
        }

        SubjectDBContext subjectDB = new SubjectDBContext();
        CurriculumDBContext curriculumDB = new CurriculumDBContext();
        ArrayList<Subject> subjects = subjectDB.subjectSelect();
        ArrayList<Curriculum> curriculums = curriculumDB.curriculums();

        request.setAttribute("curriculums", curriculums);
        request.setAttribute("subjects", subjects);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../view/elective/electiveView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String electiveName = request.getParameter("electiveName");
        String note = request.getParameter("note");
        int curriculum = Integer.parseInt(request.getParameter("curriculum"));
        String[] subjects = request.getParameterValues("subjects");
        int status = Integer.parseInt(request.getParameter("status"));
        ElectiveDBContext electiveDB = new ElectiveDBContext();
        if (status == 1) {
            electiveDB.addNewElective(electiveName, note, curriculum);
            for (String subject : subjects) {
                electiveDB.addElectiveSubject(subject);
            }
            request.setAttribute("add", true);
        } else if (status == 0) {
            int electiveId = Integer.parseInt(request.getParameter("electiveId"));
            electiveDB.updateElective(electiveId, electiveName, note, curriculum);
            electiveDB.removeElectiveSubject(electiveId);
            for (String subject : subjects) {
                electiveDB.updateElectiveSubject(electiveId, subject);
            }
            request.setAttribute("update", true);
        }
        request.setAttribute("electiveName", electiveName);
        request.getRequestDispatcher("/FLM/electiveList").forward(request, response);
    }

}
