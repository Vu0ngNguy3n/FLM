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
public class LearningPathDBContext extends DBContext<Object> {

    public ArrayList<learningPath> getAllSubject(String txt) {
        ArrayList<learningPath> list = new ArrayList();
        String querry = "select sy.syllabusId,su.subjectCode,su.subjectNameVn,  concat(sy.decisionNo,' dated ',DATE_FORMAT(d.approvedDate,'%d/%m/%Y')) as decissionNo,sy.preRequisite\n"
                + "from  Subject su   join Syllabus sy on su.subjectCode=sy.subjectCode join Decision d on sy.decisionNo=d.decisionNo \n"
                + "where su.subjectCode like ? order by syllabusId";
        try {
            PreparedStatement st = connection.prepareStatement(querry);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ArrayList<preRequisite> list2 = new ArrayList<>();
//                String subjectNeed = selectAllNeeded(rs.getString(2));
                String subjectNeed = rs.getString(2);
                String querry2 = "select preRequisite\n"
                        + "from syllabus\n"
                        + "where subjectCode= ? ";
                try {
                    PreparedStatement pt = connection.prepareStatement(querry2);
                    pt.setString(1, rs.getString(2));
                    ResultSet rs2 = pt.executeQuery();
                    while (rs2.next()) {
                        list2.add(new preRequisite(subjectNeed, rs2.getString(1)));
                    }
                } catch (Exception e) {
                    System.out.println("Loi lay preRequisite lpath" + e.getMessage());
                }
                list.add(new learningPath(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), list2));
            }
        } catch (Exception e) {
            System.out.println("loi lay learning path " + e.getMessage());
        }
        return list;
    }

    public String selectAllNeeded(String txt) {
        String str = "";
        String str3;
        while (true) {
            int check = 0;
            String[] arr = selectNeeded(txt).split(",");
            for (int i = 0; i < arr.length; i++) {
                if (!arr[i].trim().isEmpty()) {
                    check = 1;
                }
            }
            if (check == 0) {
                break;
            } else {
                for (int i = 0; i < arr.length; i++) {
                    str3 = selectAllNeeded(arr[i]);
                    if (!str3.isEmpty()) {
                        str += str3 + ", ";
                        txt = str3;
                    }
                }
            }
        };
        return str;
    }

    public String selectNeeded(String txt) {
        String querry = "select preRequisite\n"
                + "from Subject\n"
                + "where subjectCode like ? ";
        String str = "";
        try {
            PreparedStatement st = connection.prepareStatement(querry);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                str = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("loi selectNeeded() " + e.getMessage());
        }
        return str;
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
