/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext<Account>{

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [phone] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[gmail] = ?\n"
                    + "      ,[fullName] = ?\n"
                    + "      ,[birthday] = ?\n"
                    + " WHERE userName = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setLong(1, model.getPhone());
            st.setString(2, model.getAddress());
            st.setBoolean(3, model.isGender());
            st.setString(4, model.getGmail());
            st.setString(5, model.getFullname());
            st.setDate(6, model.getDob());
            st.setString(7, model.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("AccountDAO - update()" +e);
        }
    }
    
    public void changeAvatar(Account a){
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [avatar] = ?\n"
                    + " WHERE userName = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getAvatar());
            st.setString(2, a.getUsername());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("AccountDAO - changeAvatar()" +e);
        }
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
