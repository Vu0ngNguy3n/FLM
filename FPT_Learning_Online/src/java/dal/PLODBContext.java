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
import model.PO;

/**
 *
 * @author l
 */
public class PLODBContext extends DBContext<PLO> {
    
//    public Curriculum getPOPLODetail(int cid) {
//        
//        try {
//            String sql = "SELECT curriculum.curriculumCode, curriculum.nameEn,\n"
//                    + "plo.ploid, plo.ploName, plo.ploDecription,\n"
//                    + "po.poId,po.poName,po.poDecription\n"
//                    + "FROM curriculum\n"
//                    + "INNER JOIN plo ON plo.curriculumId = curriculum.curriculumId\n"
//                    + "LEFT JOIN PO ON po.curriculumId = curriculum.curriculumId\n"
//                    + "where curriculum.curriculumId = ?;";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, cid);
//            ResultSet rs = stm.executeQuery();
//            Curriculum curriculum = null;
//            while (rs.next()) {
//                if (curriculum == null) {
//                    Curriculum c = new Curriculum();
//                    c.setCurriculumCode(rs.getString("curriculumCode"));
//                    c.setNameEn(rs.getString("nameEn"));
//                }
//                PLO plo = new PLO();
//                plo.setPloid(rs.getInt("ploid"));
//                plo.setPloname(rs.getString("ploName"));
//                plo.setPlodescription(rs.getString("ploDecription"));
//                curriculum.getPlo().add(plo);
//                PO po = new PO();
//                if (rs.getInt("poId") != 0) {
//                    po.setPoId(rs.getInt("poId"));
//                    po.setPoName(rs.getString("poName"));
//                    po.setPoDecription(rs.getString("poDecription"));
//                    curriculum.getPo().add(po);
//                }
//                
//            }
//            return curriculum;
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(CurriculumDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
    
//    public static void main(String[] args) {
//        PLODBContext pro = new PLODBContext();
//        System.out.println("" + pro.getPOPLODetail(2));
//    }
//    
    @Override
    public void insert(PLO model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void update(PLO model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void delete(PLO model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public PLO getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public PLO get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public ArrayList<PLO> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
