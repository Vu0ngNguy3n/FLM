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
public class MappingDBContext extends DBContext<Mapping> {

    public Mapping GetMappingByPO(int pid) {
        try {
            String sql = "SELECT * FROM flm_g3.mapping where poid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            Mapping p = new Mapping();
            while (rs.next()) {
                p.setPoid(rs.getInt("poId"));
                p.setPloid(rs.getInt("ploId"));
                p.setCurriculumid(rs.getInt("curriculumId"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Mapping> getAllMappings() {
        List<Mapping> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_g3.mapping";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Mapping(rs.getInt("ploId"), rs.getInt("poId"), rs.getInt("curriculumId")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Mapping> getMapping(int cuid) {
        ArrayList<Mapping> mapping = new ArrayList<>();
        try {
            String sql = "SELECT plo.ploName,po.poName,plo.ploId,po.poId\n"
                    + "FROM mapping\n"
                    + "JOIN po ON mapping.poId = po.poId\n"
                    + "JOIN plo ON mapping.ploId = plo.ploId\n"
                    + "JOIN curriculum ON mapping.curriculumId = curriculum.curriculumId\n"
                    + "WHERE PLO.curriculumId = ?\n"
                    + "Order by PO.poName";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cuid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Mapping m = new Mapping();
                PO po = new PO();
                PLO plo = new PLO();
                Curriculum c = new Curriculum();
                po.setPoId(rs.getInt("poId"));
                po.setPoName(rs.getString("poName"));
                plo.setPloid(rs.getInt("ploId"));
                plo.setPloname(rs.getString("ploName"));
                m.setPo(po);
                m.setPlo(plo);
                mapping.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MappingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mapping;
    }

    public static void main(String[] args) {
        MappingDBContext d = new MappingDBContext();
        System.out.println(d.getMapping(3));
    }

    @Override
    public void insert(Mapping model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Mapping model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Mapping model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Mapping getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Mapping get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Mapping> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
