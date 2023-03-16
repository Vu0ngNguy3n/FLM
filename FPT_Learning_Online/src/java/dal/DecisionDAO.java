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
import model.Decision;

/**
 *
 * @author phanh
 */
public class DecisionDAO extends DBContext<Decision> {

    public Decision getDecisionByDecisionID(int id) {
        try {
            String sql = "SELECT `decision`.`decisionId`,\n"
                    + "    `decision`.`decisionNo`,\n"
                    + "    `decision`.`decisionName`,\n"
                    + "    `decision`.`approvedDate`,\n"
                    + "    `decision`.`note`,\n"
                    + "    `decision`.`createDate`,\n"
                    + "    `decision`.`fileName`,\n"
                    + "    `decision`.`isActive`,\n"
                    + "    `decision`.`isApprove`\n"
                    + "FROM `flm`.`decision`"
                    + "WHERE `decision`.`decisionId` = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Decision decision = new Decision(rs.getInt("decisionId"), rs.getString("decisionNo"), rs.getString("decisionName"), rs.getDate("approvedDate"),
                        rs.getString("note"), rs.getDate("createDate"), rs.getString("fileName"), rs.getBoolean("isActive"), rs.getBoolean("isApprove"));
                return decision;
            }
        } catch (SQLException e) {
            System.out.println("decisionDAO, getDecisionByDecisionID" + e);
        }
        return null;
    }

    public List<Decision> getDecisionByKey(String key) {
        List<Decision> list = new ArrayList<>();

        try {
            String sql = "SELECT `decision`.`decisionId`,\n"
                    + "    `decision`.`decisionNo`,\n"
                    + "    `decision`.`decisionName`,\n"
                    + "    `decision`.`approvedDate`,\n"
                    + "    `decision`.`note`,\n"
                    + "    `decision`.`createDate`,\n"
                    + "    `decision`.`fileName`,\n"
                    + "    `decision`.`isActive`,\n"
                    + "    `decision`.`isApprove`\n"
                    + "FROM `flm`.`decision`\n"
                    + "WHERE `decision`.`decisionNo` like ? or `decision`.`decisionName` like ? ;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            st.setString(2, "%" + key + "%");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Decision decision = new Decision(rs.getInt("decisionId"), rs.getString("decisionNo"), rs.getString("decisionName"), rs.getDate("approvedDate"),
                        rs.getString("note"), rs.getDate("createDate"), rs.getString("fileName"), rs.getBoolean("isActive"), rs.getBoolean("isApprove"));
                list.add(decision);
            }
        } catch (SQLException e) {
            System.out.println("decisionDAO, getDecisionByKey(): " + e);
        }
        return list;
    }

    public List<Decision> getAll() {
        List<Decision> list = new ArrayList<>();
        
        try {
            String sql = "SELECT `decision`.`decisionId`,\n"
                    + "    `decision`.`decisionNo`,\n"
                    + "    `decision`.`decisionName`,\n"
                    + "    `decision`.`approvedDate`,\n"
                    + "    `decision`.`note`,\n"
                    + "    `decision`.`createDate`,\n"
                    + "    `decision`.`fileName`,\n"
                    + "    `decision`.`isActive`,\n"
                    + "    `decision`.`isApprove`\n"
                    + "FROM `flm`.`decision`;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Decision decision = new Decision(rs.getInt("decisionId"), rs.getString("decisionNo"), rs.getString("decisionName"), rs.getDate("approvedDate"),
                        rs.getString("note"), rs.getDate("createDate"), rs.getString("fileName"), rs.getBoolean("isActive"), rs.getBoolean("isApprove"));
                list.add(decision);
            }
        } catch (SQLException e) {
            System.out.println("decisionDAO, getDecisionByDecisionID" + e);
        }
        return list;
    }

    public int updateDecision(Decision d) {

        try {
            String sql = "UPDATE `flm`.`decision`\n"
                    + "SET\n"
                    + "`decisionNo` = ?,\n"
                    + "`decisionName` = ?,\n"
                    + "`note` = ?,\n"
                    + "`fileName` = ?,\n"
                    + "`isActive` = ?,\n"
                    + "`isApprove` = ?\n"
                    + "WHERE `decisionId` = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getDecisionNo());
            st.setString(2, d.getDecisionName());
            st.setString(3, d.getNote());
            st.setString(4, d.getFileName());
            st.setBoolean(5, d.isIsActive());
            st.setBoolean(6, d.isIsApproved());
            st.setInt(7, d.getDecisionID());
            return st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("decisionDAO, updateDecision" + e);
        }
        return -1;
    }

    public int add(Decision d) {

        try {
            String sql = "INSERT INTO `flm`.`decision`(`decisionNo`,`decisionName`,`approvedDate`,`note`,`createDate`,`fileName`,`isActive`,`isApprove`)\n"
                    + "VALUES	(?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getDecisionNo());
            st.setString(2, d.getDecisionName());
            st.setDate(3, d.getApprovedDate());
            st.setString(4, d.getNote());
            st.setDate(5, d.getCreateDate());
            st.setString(6, d.getFileName());
            st.setBoolean(7, d.isIsActive());
            st.setBoolean(8, d.isIsApproved());

            return st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("decisionDAO, add" + e);
        }
        return -1;
    }

    public List<Decision> getListByPage(List<Decision> list, int start, int end) {
        List<Decision> result = new ArrayList<>();

        for (int i = start; i < end; i++) {
            result.add(list.get(i));
        }
        return result;
    }
    
    public boolean checkExist(String decisionNo, String oldDecisionNo) {
        try {
            String sql = "SELECT `decision`.`decisionId`,\n"
                    + "    `decision`.`decisionNo`,\n"
                    + "    `decision`.`decisionName`,\n"
                    + "    `decision`.`approvedDate`,\n"
                    + "    `decision`.`note`,\n"
                    + "    `decision`.`createDate`,\n"
                    + "    `decision`.`fileName`,\n"
                    + "    `decision`.`isActive`,\n"
                    + "    `decision`.`isApprove`\n"
                    + "FROM `flm`.`decision`\n"
                    + "WHERE `decision`.`decisionNo` = ? and `decision`.`decisionNo` not in (?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,  decisionNo);
            st.setString(2, oldDecisionNo);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("decisionDAO, checkExist(): " + e);
        }
        return false;
    }

    @Override
    public void insert(Decision model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Decision model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Decision model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Decision getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Decision get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Decision> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
