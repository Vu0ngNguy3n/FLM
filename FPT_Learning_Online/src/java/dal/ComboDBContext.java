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
import model.Combo;
import model.Subject;

/**
 *
 * @author HP
 */
public class ComboDBContext extends DBContext<Combo> {

    public ArrayList<Combo> getCombo(int curriculumId) {
        try {
            String sql = "SELECT comboId, comboNameVn, comboNameEn, note, tag\n"
                    + "FROM Combo \n"
                    + "WHERE curriculumId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            ArrayList<Combo> combos = new ArrayList<>();
            stm.setInt(1, curriculumId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Combo combo = new Combo();
                combo.setComboid(rs.getInt("comboId"));
                combo.setComboNameVn(rs.getString("comboNameVn"));
                combo.setComboNameEn(rs.getString("comboNameEn"));
                combo.setNote(rs.getString("note"));
                combo.setTag(rs.getString("tag"));
                combos.add(combo);
            }
            return combos;
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Combo getComboDetail(int comboid) {
        try {
            String sql = "SELECT c.comboId, c.comboNameVn, c.comboNameEn, c.note, c.tag,c.curriculumId\n"
                    + ",s.subjectCode, s.subjectNameEn, s.subjectNameVn, s.semester, s.noCredit\n"
                    + "FROM Combo as c\n"
                    + "INNER JOIN Combo_Subject as cs ON c.comboId = cs.comboId\n"
                    + "INNER JOIN Subject as s ON s.subjectCode = cs.subjectCode\n"
                    + "WHERE c.comboId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, comboid);
            ResultSet rs = stm.executeQuery();
            Combo combo = null;
            Subject subject = new Subject();
            while (rs.next()) {
                if (combo == null) {
                    combo = new Combo();
                    combo.setComboid(rs.getInt("comboId"));
                    combo.setComboNameVn(rs.getString("comboNameVn"));
                    combo.setComboNameEn(rs.getString("comboNameEn"));
                    combo.setNote(rs.getString("note"));
                    combo.setTag(rs.getString("tag"));
                    combo.setCurriculumId(rs.getInt("curriculumId"));
                }
                subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectNameVn(rs.getString("subjectNameVn"));
                subject.setSubjectNameEn(rs.getString("subjectNameEn"));
                subject.setSemester(rs.getString("semester"));
                subject.setNoCredit(rs.getInt("noCredit"));
                combo.getSubjects().add(subject);

            }
            return combo;
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Combo> combos(String combo) {
        try {
            String sql = "SELECT c.comboId,c.comboNameVn,c.comboNameEn,c.note,c.curriculumId, s.subjectCode,s.subjectNameVn FROM combo as c\n"
                    + "LEFT JOIN combo_subject as cs ON c.comboId = cs.comboId\n"
                    + "LEFT JOIN subject as s ON cs.subjectCode = s.subjectCode\n"
                    + "WHERE c.comboNameVn LIKE '%" + combo + "%'";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            ArrayList<Combo> combos = new ArrayList<>();
            Combo combo1 = null;
            Subject subject = null;
            while (rs.next()) {
                if (combo1 == null) {
                    combo1 = new Combo();
                }
                if (combo1.getComboid() != rs.getInt("comboId") && combo1.getComboid() != 0) {
                    combos.add(combo1);
                    combo1 = new Combo();
                }

                combo1.setComboid(rs.getInt("comboId"));
                combo1.setComboNameVn(rs.getString("comboNameVn"));
                combo1.setComboNameEn(rs.getString("comboNameEn"));
                combo1.setNote(rs.getString("note"));
                combo1.setCurriculumId(rs.getInt("curriculumId"));

                subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectNameVn(rs.getString("subjectNameVn"));
                combo1.getSubjects().add(subject);

            }
            combos.add(combo1);
            return combos;
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int totalPage(String combo) {
        try {
            String sql = "SELECT c.comboId FROM combo as c\n"
                    + "LEFT JOIN combo_subject as cs ON c.comboId = cs.comboId\n"
                    + "LEFT JOIN subject as s ON cs.subjectCode = s.subjectCode\n"
                    + "WHERE c.comboNameVn LIKE '%"+combo+"%'"
                    + "group by c.comboId";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int totalPage = 0;
            while (rs.next()) {
                totalPage++;
            }
            return totalPage ;
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void insertCombo(String comboName, String note, int curriculumId) {
        try {
            String sql = "INSERT INTO `flm`.`combo`\n"
                    + "(\n"
                    + "`comboNameVn`,\n"
                    + "`note`,\n"
                    + "`curriculumId`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, comboName);
            stm.setString(2, note);
            stm.setInt(3, curriculumId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int getNewComboId() {
        try {
            String sql = "SELECT comboId FROM combo\n"
                    + "ORDER BY comboId DESC LIMIT 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int comboId = 0;
            while (rs.next()) {
                comboId = rs.getInt("comboId");
            }
            return comboId;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void insertComboSubject(String subjectCode) {
        try {
            String sql = "INSERT INTO `flm`.`combo_subject`\n"
                    + "(`comboId`,\n"
                    + "`subjectCode`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            ComboDBContext subjectDB = new ComboDBContext();
            int comboId = subjectDB.getNewComboId();
            stm.setInt(1, comboId);
            stm.setString(2, subjectCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCombo(String comboName, String note, int curriculumId, int comboId) {
        try {
            String sql = "UPDATE `flm`.`combo`\n"
                    + "SET\n"
                    + "`comboNameVn` = ?,\n"
                    + "`note` = ?,\n"
                    + "`curriculumId` = ?\n"
                    + "WHERE `comboId` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, comboName);
            stm.setString(2, note);
            stm.setInt(3, curriculumId);
            stm.setInt(4, comboId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeComboSubject(int comboId) {
        try {
            String sql = "DELETE FROM `flm`.`combo_subject`\n"
                    + "WHERE comboId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, comboId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ComboDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateComboSubject(int comboId, String subjectCode) {
        try {
            String sql = "INSERT INTO `flm`.`combo_subject`\n"
                    + "(`comboId`,\n"
                    + "`subjectCode`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, comboId);
            stm.setString(2, subjectCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ComboDBContext c = new ComboDBContext();
        Combo com = c.getComboDetail(3);
        System.out.println(com.getComboNameVn()+" " + com.getComboid());
    }

    @Override
    public void insert(Combo model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Combo model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Combo model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Combo getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Combo get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Combo> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
