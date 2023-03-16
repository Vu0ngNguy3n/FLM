/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Elective;
import model.Subject;

/**
 *
 * @author HP
 */
public class ElectiveDBContext extends DBContext<Elective> {

    public ArrayList<Elective> getElectives(int curriculumId) {
        try {
            String sql = "SELECT electiveId, electiveNameVn, electiveNameEn, note, tag FROM elective \n"
                    + "WHERE curriculumId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, curriculumId);
            ArrayList<Elective> electives = new ArrayList<>();
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Elective elective = new Elective();
                elective.setElectiveId(rs.getInt("electiveId"));
                elective.setElectiveNameVn(rs.getString("electiveNameVn"));
                elective.setElecctiveNameEn(rs.getString("electiveNameEn"));
                elective.setNote(rs.getString("note"));
                elective.setTag(rs.getString("tag"));
                electives.add(elective);
            }
            return electives;
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Elective getElectiveDetail(int electiveId) {
        try {
            String sql = "Select electiveId, electiveNameVn, electiveNameEn, note, tag from elective \n"
                    + "WHERE electiveId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, electiveId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Elective elective = new Elective();
                elective.setElectiveId(rs.getInt("electiveId"));
                elective.setElectiveNameVn(rs.getString("electiveNameVn"));
                elective.setElecctiveNameEn(rs.getString("electiveNameVn"));
                elective.setNote(rs.getString("note"));
                elective.setTag(rs.getString("tag"));
                return elective;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getCurriculumId(int electiveId) {
        try {
            String sql = "select curriculumId from elective\n"
                    + "where electiveId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, electiveId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int curriculumId = rs.getInt("curriculumId");
                return curriculumId;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Elective getElectiveSubject(int electiveId) {
        try {
            String sql = "Select e.electiveId, e.electiveNameVn, e.electiveNameEn, e.note, e.tag,\n"
                    + "	s.subjectCode, s.subjectNameVn, s.subjectNameEn\n"
                    + " from elective as e\n"
                    + "	INNER JOIN elective_subject as es ON e.electiveId = es.electiveId\n"
                    + "    INNER JOIN subject as s ON es.subjectCode = s.subjectCode\n"
                    + "    WHERE e.electiveId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, electiveId);
            ResultSet rs = stm.executeQuery();
            Elective elective = null;
            Subject subject = new Subject();
            while (rs.next()) {
                if (elective == null) {
                    elective = new Elective();
                    elective.setElectiveId(rs.getInt("electiveId"));
                    elective.setElectiveNameVn(rs.getString("electiveNameVn"));
                    elective.setElecctiveNameEn(rs.getString("electiveNameEn"));
                    elective.setNote(rs.getString("note"));
                    elective.setTag(rs.getString("tag"));
                }
                subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectNameVn(rs.getString("subjectNameVn"));
                subject.setSubjectNameEn(rs.getString("subjectNameEn"));
                elective.getSubjects().add(subject);
            }
            return elective;
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Elective> electives(String search) {
        try {
            String sql = "Select e.electiveId, e.electiveNameVn, e.electiveNameEn, e.note, e.tag,e.curriculumId,\n"
                    + "                    s.subjectCode, s.subjectNameVn, s.subjectNameEn\n"
                    + "                    from elective as e\n"
                    + "                    INNER JOIN elective_subject as es ON e.electiveId = es.electiveId\n"
                    + "                    INNER JOIN subject as s ON es.subjectCode = s.subjectCode\n"
                    + "                    WHERE e.electiveNameVn LIKE '%" + search + "%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            ArrayList<Elective> electives = new ArrayList<>();
            Elective elective = null;
            Subject subject = null;
            while (rs.next()) {
                if (elective == null) {
                    elective = new Elective();
                }
                if (elective.getElectiveId() != rs.getInt("electiveId") && elective.getElectiveId() != 0) {
                    electives.add(elective);
                    elective = new Elective();
                }
                elective.setElectiveId(rs.getInt("electiveId"));
                elective.setElectiveNameVn(rs.getString("electiveNameVn"));
                elective.setElecctiveNameEn(rs.getString("electiveNameEn"));
                elective.setNote(rs.getString("note"));
                elective.setTag(rs.getString("tag"));
                elective.setCurriculumID(rs.getInt("curriculumId"));

                subject = new Subject();
                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectNameVn(rs.getString("subjectNameVn"));
                subject.setSubjectNameEn(rs.getString("subjectNameEn"));
                elective.getSubjects().add(subject);
            }
            electives.add(elective);
            return electives;
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addNewElective(String electiveName, String note, int curriculumId) {
        try {
            String sql = "INSERT INTO `flm`.`elective`\n"
                    + "(`electiveNameVn`,\n"
                    + "`electiveNameEn`,\n"
                    + "`note`,\n"
                    + "`curriculumId`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, electiveName);
            stm.setString(2, electiveName);
            stm.setString(3, note);
            stm.setInt(4, curriculumId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNewElectiveId() {
        try {
            String sql = "SELECT electiveId FROM elective \n"
                    + "ORDER BY electiveId DESC LIMIT 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int electiveId = rs.getInt("electiveId");
                return electiveId;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void addElectiveSubject(String subjectCode) {
        try {
            String sql = "INSERT INTO `flm`.`elective_subject`\n"
                    + "(`electiveId`,\n"
                    + "`subjectCode`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            ElectiveDBContext electiveDb = new ElectiveDBContext();
            int electiveId = electiveDb.getNewElectiveId();
            stm.setInt(1, electiveId);
            stm.setString(2, subjectCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateElective(int electiveId, String electiveName, String note, int curriculumId) {
        try {
            String sql = "UPDATE `flm`.`elective`\n"
                    + "SET\n"
                    + "`electiveNameVn` = ?,\n"
                    + "`electiveNameEn` = ?,\n"
                    + "`note` = ?,\n"
                    + "`curriculumId` = ?\n"
                    + "WHERE `electiveId` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, electiveName);
            stm.setString(2, electiveName);
            stm.setString(3, note);
            stm.setInt(4, curriculumId);
            stm.setInt(5, electiveId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void removeElectiveSubject(int electiveId) {
        try {
            String sql = "DELETE FROM `flm`.`elective_subject`\n"
                    + "WHERE electiveId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, electiveId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateElectiveSubject(int electiveId, String subjectCode) {
        try {
            String sql = "INSERT INTO `flm`.`elective_subject`\n"
                    + "(`electiveId`,\n"
                    + "`subjectCode`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";
            PreparedStatement stm  = connection.prepareStatement(sql);
            stm.setInt(1, electiveId);
            stm.setString(2, subjectCode);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ElectiveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public static void main(String[] args) {
        ElectiveDBContext e = new ElectiveDBContext();
//        ArrayList<Elective> es = e.getElectives(2);
//        for (Elective e1 : es) {
//            System.out.println(e1.getElectiveNameVn());
//        }
//        Elective el = e.getElectiveDetail(1);
//        System.out.println(el.getElecctiveNameEn());
//        Elective e1 = e.getElectiveSubject(1);
//        System.out.println(e1.getElectiveNameVn());
//        for (Subject subject : e1.getSubjects()) {
//            System.out.println(subject.getSubjectNameVn());
//        }
//        ArrayList<Elective> el = e.electives(" ");
//        for (Elective elective : el) {
//            System.out.println(elective.getCurriculumID());
//        }
//        System.out.println(el.size());
        int c = e.getCurriculumId(1);
        System.out.println(e.getNewElectiveId());

    }

    @Override
    public void insert(Elective model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Elective model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Elective model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Elective getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Elective get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Elective> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
