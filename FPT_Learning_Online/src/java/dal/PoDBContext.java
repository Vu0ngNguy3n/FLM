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
import model.Mapping;
import model.PLO;
import model.PO;

/**
 *
 * @author l
 */
public class PoDBContext extends DBContext<PO> {

    public List<Curriculum> getCurriCode() {
        List<Curriculum> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_g3.curriculum;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Curriculum(
                        rs.getString("curriculumCode")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public PLO getPlobyID(int pid) {
        try {
            String sql = "SELECT `plo`.`ploId`,\n"
                    + "`plo`.`ploName`,\n"
                    + "  `plo`.`ploDecription`,\n"
                    + "  `plo`.`curriculumId`\n"
                    + "FROM `flm_g3`.`plo`\n"
                    + "where `plo`.`ploId` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            PLO p = new PLO();
            while (rs.next()) {
                p.setPloid(rs.getInt("ploId"));
                p.setPloname(rs.getString("ploName"));
                p.setPlodescription(rs.getString("ploDecription"));
                p.setCurriculumId(rs.getInt("curriculumId"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public PO getPobyID(int pid) {
        try {
            String sql = "SELECT po.poId,po.poName,poDecription,curriculum.curriculumCode\n"
                    + "FROM po\n"
                    + "Inner join curriculum On curriculum.curriculumId = po.curriculumId\n"
                    + "where `po`.`poId` = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            PO p = new PO();
            while (rs.next()) {
                PO po = new PO();
                po.setPoId(rs.getInt("poId"));
                po.setPoName(rs.getString("poName"));
                po.setPoDecription(rs.getString("poDecription"));

                Curriculum c = new Curriculum();
                c.setCurriculumCode(rs.getString("curriculumCode"));
                po.setCurriculum(c);
                p = po;
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(PoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Integer> getPOLargestID() {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT MAX(poid) FROM flm_g3.po";
        try (
                 PreparedStatement ps = connection.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            if (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Integer> getPLOLargestID() {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT MAX(ploId) FROM flm_g3.plo";
        try (
                 PreparedStatement ps = connection.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            if (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        PoDBContext d = new PoDBContext();
        System.out.println(d.get(3));
    }

    public ArrayList<Curriculum> getPOPLODetail(int cid) {
        ArrayList<Curriculum> curriculumPOList = new ArrayList<>();
        try {
            String sql = "SELECT curriculum.curriculumid,curriculum.curriculumCode, curriculum.nameEn,\n"
                    + "po.poId,po.poName,po.poDecription,\n"
                    + "plo.ploId,plo.ploName,plo.ploDecription\n"
                    + "FROM curriculum\n"
                    + "LEFT JOIN po ON po.curriculumId = curriculum.curriculumId\n"
                    + "Left join plo on plo.curriculumId = curriculum.curriculumId\n"
                    + "where curriculum.curriculumId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurriculumId(rs.getInt("curriculumid"));
                c.setCurriculumCode(rs.getString("curriculumCode"));
                c.setNameEn(rs.getString("nameEn"));

                PO po = new PO();
                po.setPoId(rs.getInt("poId"));
                po.setPoName(rs.getString("poName"));
                po.setPoDecription(rs.getString("poDecription"));
                c.setPo(po);

                PLO plo = new PLO();
                plo.setPloid(rs.getInt("ploId"));
                plo.setPloname(rs.getString("ploName"));
                plo.setPlodescription(rs.getString("ploDecription"));
                c.setPlo(plo);

                curriculumPOList.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return curriculumPOList;
    }

    public ArrayList<Curriculum> getPODetail(int cid) {
        ArrayList<Curriculum> curriculumPOList = new ArrayList<>();
        try {
            String sql = "SELECT curriculum.curriculumid,curriculum.curriculumCode, curriculum.nameEn,\n"
                    + "po.poId,po.poName,po.poDecription\n"
                    + "FROM `flm_g3`.`curriculum`\n"
                    + "LEFT JOIN PO ON po.curriculumId = curriculum.curriculumId\n"
                    + "where curriculum.curriculumId = ?;;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurriculumId(rs.getInt("curriculumid"));
                c.setCurriculumCode(rs.getString("curriculumCode"));
                c.setNameEn(rs.getString("nameEn"));

                PO po = new PO();
                po.setPoId(rs.getInt("poId"));
                po.setPoName(rs.getString("poName"));
                po.setPoDecription(rs.getString("poDecription"));
                c.setPo(po);

                curriculumPOList.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return curriculumPOList;
    }

    public ArrayList<Curriculum> getPLODetail(int cid) {
        ArrayList<Curriculum> curriculumPLOList = new ArrayList<>();
        try {
            String sql = "SELECT curriculum.curriculumCode, curriculum.nameEn,\n"
                    + "plo.ploid, plo.ploName, plo.ploDecription\n"
                    + "FROM `flm_g3`.`curriculum`\n"
                    + "LEFT JOIN plo ON plo.curriculumId = curriculum.curriculumId\n"
                    + "where curriculum.curriculumId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurriculumCode(rs.getString("curriculumCode"));
                c.setNameEn(rs.getString("nameEn"));

                PLO plo = new PLO();
                plo.setPloid(rs.getInt("ploid"));
                plo.setPloname(rs.getString("ploName"));
                plo.setPlodescription(rs.getString("ploDecription"));
                c.setPlo(plo);

                curriculumPLOList.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return curriculumPLOList;
    }

    public ArrayList<Curriculum> getPLO(int cid) {
        ArrayList<Curriculum> curriculumPLOList = new ArrayList<>();
        try {
            String sql = "SELECT curriculum.curriculumCode, curriculum.nameEn,\n"
                    + "plo.ploid, plo.ploName, plo.ploDecription\n"
                    + "FROM `flm_g3`.`curriculum`\n"
                    + "LEFT JOIN plo ON plo.curriculumId = curriculum.curriculumId\n"
                    + "where curriculum.curriculumId = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurriculumCode(rs.getString("curriculumCode"));
                c.setNameEn(rs.getString("nameEn"));

                PLO plo = new PLO();
                plo.setPloid(rs.getInt("ploid"));
                plo.setPloname(rs.getString("ploName"));
                plo.setPlodescription(rs.getString("ploDecription"));
                c.setPlo(plo);

                curriculumPLOList.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return curriculumPLOList;
    }

    public List<PLO> searchPLO(String ploid) {
        List<PLO> listplo = new ArrayList<>();
        String sql = "select * from PLO where curriculumId like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + ploid + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listplo.add(new PLO(rs.getInt("ploId"), rs.getString("ploName"), rs.getString("ploDecription"), rs.getInt("curriculumId")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listplo;
    }

    public ArrayList<PO> SearchPObyCode(String poid) {
        ArrayList<PO> poa = new ArrayList<>();
        try {
            String sql = "select po.poId,po.poName,poDecription,curriculum.curriculumCode\n"
                    + "from po\n"
                    + "Inner join curriculum On curriculum.curriculumId = po.curriculumId\n"
                    + "where curriculum.curriculumCode like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + poid + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PO po = new PO();
                po.setPoId(rs.getInt("poId"));
                po.setPoName(rs.getString("poName"));
                po.setPoDecription(rs.getString("poDecription"));

                Curriculum c = new Curriculum();
                c.setCurriculumCode(rs.getString("curriculumCode"));
                po.setCurriculum(c);
                poa.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return poa;
    }

    public List<PO> searchAll(String poid) {
        List<PO> list = new ArrayList<>();
        String sql = "select * from PO where curriculumId like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + poid + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new PO(rs.getInt("poId"), rs.getString("poName"), rs.getString("poDecription"), rs.getInt("curriculumId")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void InsertPo(int poId, String poName, String poDecription, String curriculumCode) {
        try {
            String sql = "INSERT INTO po (poId, curriculumId, poName, poDecription) VALUES (?, (SELECT curriculumId FROM curriculum WHERE curriculumCode = ?), ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, poId);
            st.setString(2, curriculumCode);
            st.setString(3, poName);
            st.setString(4, poDecription);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void InsertPlo(int ploid, String ploname, String plodescription, int curriculumId) {
        try {
            String sql = "INSERT INTO `flm_g3`.`plo` (`ploId`,`ploName`,`ploDecription`,`curriculumId`)\n"
                    + " VALUES (?,?,?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ploid);
            st.setString(2, ploname);
            st.setString(3, plodescription);
            st.setInt(4, curriculumId);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePO(int poId, String curriculumCode, String poName, String poDescription) {
        try {
            String sql = "UPDATE po "
                    + "SET po.curriculumId = (SELECT curriculumId FROM curriculum WHERE curriculum.curriculumCode = ?), "
                    + "po.poName = ?, "
                    + "po.poDecription = ? "
                    + "WHERE po.poId = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, curriculumCode);
            stmt.setString(2, poName);
            stmt.setString(3, poDescription);
            stmt.setInt(4, poId);
            stmt.executeUpdate();
            System.out.println("PO updated successfully.");
        } catch (SQLException e) {
            System.out.println("Error updating PO: " + e.getMessage());
        }
    }

    public void UpdatePlo(String ploName, String ploDecription, int curriculumId, int ploId) {
        try {
            String sql = "UPDATE `flm_g3`.`plo`\n"
                    + "SET\n"
                    + "`ploName` = ?,\n"
                    + "`ploDecription` =?,\n"
                    + "`curriculumId` = ?\n"
                    + "WHERE `poId` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ploName);
            stm.setString(2, ploDecription);
            stm.setInt(3, curriculumId);
            stm.setInt(4, ploId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insert(PO model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(PO model) {

    }

    @Override
    public void delete(PO model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public PO getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public PO get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<PO> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
