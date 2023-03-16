/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Feedback;

/**
 *
 * @author Admin
 */
public class FeedbackDAO extends DBContext<Feedback> {

    @Override
    public void insert(Feedback model) {
        try {
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([category]\n"
                    + "           ,[content]\n"
                    + "           ,[createDate]\n"
                    + "           ,[isSeen]\n"
                    + "           ,[userName])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, model.getCategory());
            st.setString(2, model.getContent());
            st.setDate(3, model.getCreatDate());
            st.setBoolean(4, model.isIsSeen());
            st.setString(5, model.getUserName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("FeedbackDAO + insert()" + e);
        }
    }

    @Override
    public void update(Feedback model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Feedback model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Feedback getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Feedback get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Feedback> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
