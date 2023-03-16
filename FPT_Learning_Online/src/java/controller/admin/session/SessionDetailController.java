/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.session;

import dal.SyllabusDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Session;

/**
 *
 * @author bongt
 */
@WebServlet(name = "SessionDetailController", urlPatterns = {"/FLM/sessiondetail"})
public class SessionDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String syllabusid = request.getParameter("syllabusid");
        SyllabusDBContext db= new SyllabusDBContext();
        if (request.getParameter("add") !=null) {
            List<Session> closession = db.getCloList(syllabusid);
            request.setAttribute("closession", closession);
            request.setAttribute("syllabusid", syllabusid);
            request.getRequestDispatcher("/view/admin/Session/SessionAdd.jsp").forward(request, response);
        } else if (request.getParameter("edit")!= null) {
            
            String sessionid = request.getParameter("sessionid");
            List<Session> sesiondetail = db.getSessionByID(sessionid);
            List<Session> closession = db.getCLOSession(sessionid);
            request.setAttribute("s", sesiondetail.get(0));
            request.setAttribute("closession", closession);
            request.setAttribute("sessionid", sessionid);
            request.setAttribute("syllabusid", syllabusid);
            request.getRequestDispatcher("/view/admin/Session/SessionDetail.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String syllabusid = request.getParameter("syllabusid");
        System.out.println("");
        SyllabusDBContext db = new SyllabusDBContext();
        if (request.getParameter("delete") != null) {
            String sessionid = request.getParameter("sessionid");
            db.deleteCloSession(sessionid);
            List<Session> sesionlistdetail = db.getSession(syllabusid);
            request.setAttribute("edit", db);
            request.setAttribute("sesionlistdetail", sesionlistdetail);
            request.setAttribute("syllabusid", syllabusid);
            request.getRequestDispatcher("/view/admin/Session/SessionListDetail.jsp").forward(request, response);
        } else if (request.getParameter("edit") != null) {
            String sessionid = request.getParameter("sessionid");
            String sessionno = request.getParameter("sessionno");
            String topic = request.getParameter("topic");
            String type = request.getParameter("type");
            String clo[] = request.getParameterValues("cloid");
            String itu = request.getParameter("itu");
            String material = request.getParameter("material");
            String down = request.getParameter("down");
            String task = request.getParameter("task");
            String url = request.getParameter("url");
            db.updateSession(sessionno, topic, type, itu, material, down, task, url,sessionid , clo);
            List<Session> sesionlistdetail = db.getSession(syllabusid);
            request.setAttribute("sesionlistdetail", sesionlistdetail);
            request.setAttribute("syllabusid", syllabusid);
            request.getRequestDispatcher("/view/admin/Session/SessionListDetail.jsp").forward(request, response);
        } else if (request.getParameter("add") != null) {
            String sessionid = request.getParameter("sessionid");
            String sessionno = request.getParameter("sessionno");
            String topic = request.getParameter("topic");
            String type = request.getParameter("type");
            String clo[] = request.getParameterValues("cloid");
            String itu = request.getParameter("itu");
            String material = request.getParameter("material");
            String down = request.getParameter("down");
            String task = request.getParameter("task");
            String url = request.getParameter("url");
            db.addNewSession(sessionno, topic, type, itu, material, down, task, url, syllabusid, clo);
            List<Session> sesionlistdetail = db.getSession(syllabusid);
            request.setAttribute("sesionlistdetail", sesionlistdetail);
            request.setAttribute("syllabusid", syllabusid);
            request.getRequestDispatcher("/view/admin/Session/SessionListDetail.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
