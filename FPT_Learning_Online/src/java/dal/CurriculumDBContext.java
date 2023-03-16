/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Curriculum;
import model.PLO;

/**
 *
 * @author asus
 */
public class CurriculumDBContext extends DBContext<Curriculum> {

    public List<Curriculum> getAllCurriculum() {
        List<Curriculum> list = new ArrayList<>();
        String query = "SELECT * FROM flm_g3.curriculum;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                list.add(new Curriculum(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7))

                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void editCurriculum(Curriculum c) {
        String query = "UPDATE curriculum SET curriculumCode = ?, nameEn = ?, decription = ?, decisionNo = ?, totalCredit = ?\n"
                + "WHERE curriculumId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, c.getCurriculumCode());
            st.setString(2, c.getNameEn());
            st.setString(3, c.getDecription());
            st.setString(4, c.getDecisionNo());
            st.setInt(5, c.getTotalCredit());
            st.setInt(6, c.getCurriculumId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Curriculum getCurriculumByID(int id) {

        String query = "SELECT `curriculum`.`curriculumId`,\n"
                + "    `curriculum`.`curriculumCode`,\n"
                + "    `curriculum`.`nameEn`,\n"
                + "    `curriculum`.`decription`,\n"
                + "    `curriculum`.`decisionNo`,\n"
                + "    `curriculum`.`totalCredit`\n"
                + "FROM `flm`.`curriculum`"
                + "WHERE `curriculum`.`curriculumId` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurriculumId(rs.getInt(1));
                c.setCurriculumCode(rs.getString(2));
                c.setNameEn(rs.getString(3));
                c.setDecription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setTotalCredit(rs.getInt(6));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Curriculum> searchByCode(String txtSearch) {

        List<Curriculum> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM flm_g3.curriculum\n"
                    + " where curriculumCode like '%" + txtSearch + "%' " + " or nameEn like '%" + txtSearch + "%' ";
            PreparedStatement st = connection.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Curriculum(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7))

                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }


    //curriculum detail
    public List<Curriculum> searchById(String txtSearch) {
        List<Curriculum> list = new ArrayList<>();       
        try {
             String query = "select * from Curriculum\n"             
                + " where curriculumId=?";
            PreparedStatement st = connection.prepareStatement(query);
           st.setString(1, txtSearch);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Curriculum(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6),rs.getInt(7))

                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    //get allplo
    public List<PLO> getPLO(String txt) {
        List<PLO> list = new ArrayList<>();       
        try {
             String query = "SELECT * FROM plo where curriculumId=?";
            PreparedStatement st = connection.prepareStatement(query);
           st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new PLO(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    


    public void insertCurriculum(String curriculumCode, String nameEn, String description, String decisionNo, int totalCredit) {
        String query = "INSERT INTO `flm_g3`.`curriculum`\n"
                + "(\n"
                + "`curriculumCode`,\n"
                + "`nameEn`,\n"
                + "`decription`,\n"
                + "`decisionNo`,\n"
                + "`totalCredit`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {

            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, curriculumCode);
            st.setString(2, nameEn);
            st.setString(3, description);
            st.setString(4, decisionNo);
            st.setInt(5, totalCredit);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Curriculum getCurriculumByID(String CurriculumID) {
        String query = "select * from flm_g3.Curriculum\n"
                + "where curriculumId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, CurriculumID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Curriculum(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public void editCurriculum(String code, String name, String description,
            String descriptionno, String credit) {
        String query = "  UPDATE Curriculum\n"
                + "  set curriculumCode =?,\n"
                + "  nameEn=?,\n"
                + "      decription=?,\n"
                + "      decisionNo=?,\n"
                + "      Description=?,\n"
                + "      totalCredit=?,\n"
                + "	  where curriculumId=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setString(4, descriptionno);
            ps.setString(5, credit);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Curriculum> curriculums(){
        try {
            String sql = "SELECT curriculumId,curriculumCode FROM curriculum";
            PreparedStatement stm = connection.prepareStatement(sql);
            ArrayList<Curriculum> curriculums = new ArrayList<>();
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Curriculum curriculum = new Curriculum();
                curriculum.setCurriculumId(rs.getInt("curriculumId"));
                curriculum.setCurriculumCode(rs.getString("curriculumCode"));
                curriculums.add(curriculum);
            }
            return curriculums;
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String curriculumCode(int curriculumId){
        try {
            String sql = "SELECT curriculumCode FROM curriculum where curriculumId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, curriculumId);
            ResultSet rs = stm.executeQuery();
            String curriculumCode = "";
            while(rs.next()){
                curriculumCode = rs.getString("curriculumCode");
            }
            return curriculumCode;
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
    @Override
    public void insert(Curriculum model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Curriculum model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Curriculum model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Curriculum getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Curriculum get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Curriculum> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        CurriculumDBContext d = new CurriculumDBContext();
        d.insertCurriculum("sdf", "sdf", "sdf", "1095/QÐ-ÐHFPT", 12);
    }
}
