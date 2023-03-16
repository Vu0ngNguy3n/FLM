/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.learningPath;
import model.preRequisite;

/**
 *
 * @author bongt
 */
public class PrerequisiteDBContext extends DBContext<Object> {

    public ArrayList<learningPath> getAllSubject(String txt) {
        ArrayList<learningPath> list = new ArrayList();
        String querry = "select sy.syllabusId,su.subjectCode,su.subjectNameVn,concat(sy.decisionNo,' dated ',DATE_FORMAT(d.approvedDate,'%d/%m/%Y')),preRequisite\n"
                + "from  Subject su   join Syllabus sy on su.subjectCode=sy.subjectCode join Decision d on sy.decisionNo=d.decisionNo\n"
                + "where su.subjectCode  like ? order by syllabusId";
        try {
            PreparedStatement st = connection.prepareStatement(querry);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ArrayList<preRequisite> list2 = new ArrayList<>();
                String pre = "";
                String querry2 = "select subjectCode\n"
                        + "from syllabus\n"
                        + "where preRequisite like ? ";
                try {
                    PreparedStatement pt = connection.prepareStatement(querry2);
                    pt.setString(1, "%" + rs.getString(2) + "%");
                    ResultSet rs2 = pt.executeQuery();
                    while (rs2.next()) {
                        pre += rs2.getString(1) + ", ";
                    }
                    String pre2 = pre.substring(0, pre.length() - 2);
                    list2.add(new preRequisite(txt, pre2));
                } catch (Exception e) {
                    System.out.println("Loi lay preRequisite pre" + e.getMessage());
                }
                list.add(new learningPath(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), list2));
            }
        } catch (Exception e) {
            System.out.println("loi lay learning path" + e.getMessage());
        }
        return list;
    }

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object getStringId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Object> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
