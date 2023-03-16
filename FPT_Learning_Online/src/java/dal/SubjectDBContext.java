/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;
import model.preRequisite;

/**
 *
 * @author HP
 */
public class SubjectDBContext extends DBContext<Subject> {

    public ArrayList<Subject> subjects(String subjectCode, int index) {
        try {
            ArrayList<Subject> subjects = new ArrayList<>();
            String sql = "SELECT sub.subjectCode, sub.subjectNameVn, sub.subjectNameEn, sub.semester, sub.noCredit,syl.preRequisite FROM subject as sub\n"
                    + "LEFT JOIN syllabus as syl ON sub.subjectCode = syl.subjectCode\n"
                    + "WHERE sub.subjectCode LIKE '%" + subjectCode + "%' "
                    + " LIMIT ?,10";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, index * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectCode(rs.getString("subjectCode"));
                s.setSubjectNameVn(rs.getString("subjectNameVn"));
                s.setSubjectNameEn(rs.getString("subjectNameEn"));
                s.setSemester(rs.getString("semester"));
                s.setNoCredit(rs.getInt("noCredit"));

                String pre = rs.getString("preRequisite");
                if (pre != null) {
                    ArrayList<preRequisite> pres = new ArrayList<>();
                    String[] preRequire = pre.split(",");
                    for (String string : preRequire) {
                        pres.add(new preRequisite(rs.getString("subjectCode"), string.trim()));
                    }
                    s.setPreRequisites(pres);
                }

                subjects.add(s);
            }
            return subjects;

        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isExistSubjectCode(String subjectCode) {
        try {
            String sql = "Select COUNT(subjectCode) as number from subject \n"
                    + "WHERE subjectCode = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subjectCode);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                if(rs.getInt("number") != 0 ){
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int totalSubject(String subjectCode) {
        try {
            String sql = "SELECT COUNT(*) as number FROM subject\n"
                    + "WHERE subjectCode LIKE '%" + subjectCode + "%' ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int totalRecord = 0;
            while (rs.next()) {
                totalRecord = Integer.parseInt(rs.getString("number"));
            }
            return totalRecord;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Subject> subjectSelect() {
        try {
            String sql = "SELECT subjectCode FROM subject";
            PreparedStatement stm = connection.prepareStatement(sql);
            ArrayList<Subject> subjects = new ArrayList<>();
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectCode(rs.getString("subjectCode"));
                subjects.add(s);
            }
            return subjects;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addSubject(String subjectCode, String subjectName, int semester, int noCredit) {
        try {
            String sql = "INSERT INTO `flm`.`subject`\n"
                    + "(`subjectCode`,\n"
                    + "`subjectNameVn`,\n"
                    + "`semester`,\n"
                    + "`noCredit`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subjectCode);
            stm.setString(2, subjectName);
            stm.setInt(3, semester);
            stm.setInt(4, noCredit);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Subject getSubject(String subjectCode) {
        try {
            String sql = "SELECT subjectCode,subjectNameVn,semester,noCredit FROM flm.subject\n"
                    + "WHERE subjectCode = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            Subject subject = new Subject();
            stm.setString(1, subjectCode);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                subject.setSubjectCode(subjectCode);
                subject.setSubjectNameVn(rs.getString("subjectNameVn"));
                subject.setSemester(rs.getString("semester"));
                subject.setNoCredit(rs.getInt("noCredit"));
            }
            return subject;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateSubject(String subjectNameVn, int semester, int noCredit, String subjectCode) {
        try {
            String sql = "UPDATE `flm`.`subject`\n"
                    + "SET\n"
                    + "`subjectNameVn` = ?,\n"
                    + "`semester` = ?,\n"
                    + "`noCredit` = ?\n"
                    + "WHERE `subjectCode` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subjectNameVn);
            stm.setInt(2, semester);
            stm.setInt(3, noCredit);
            stm.setString(4, subjectCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        SubjectDBContext s = new SubjectDBContext();
    }

    @Override
    public void insert(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
