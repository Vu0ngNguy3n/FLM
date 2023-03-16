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

import model.Syllabus;

import model.CLO;
import model.Material;
import model.Question;
import model.Session;
import model.Assessments;
import model.SessionList;
import model.SyllabusDetail;

/**
 *
 * @author asus
 */
public class SyllabusDBContext extends DBContext<Object> {

    public List<Syllabus> getAllSyllabus() {
        List<Syllabus> list = new ArrayList<>();
        String query = "SELECT * FROM flm_g3.syllabus; ";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Syllabus(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getString(3), rs.getBoolean(10), rs.getBoolean(13), rs.getString(15))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Syllabus getSyllabusByID(int syllabusId) {

        try {
            String sql = "SELECT *, DATE_FORMAT(approvedDate,\"%d-%m-%Y\")  FROM flm_g3.syllabus "
                    + "Where syllabusId = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Syllabus c = new Syllabus();
                c.setSyllabusId(rs.getInt(1));
                c.setSubjectCode(rs.getString(2));
                c.setSyllabusNameEn(rs.getString(4));
                c.setSyllabusNameVn(rs.getString(3));
                c.setIsActive(rs.getBoolean(10));
                c.setIsApproved(rs.getBoolean(13));
                c.setDecisionNo(rs.getString(15));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editSyllabus(Syllabus c) {
        String query = "UPDATE syllabus SET subjectCode = ?, syllabusNameEn = ?,syllabusNameVn= ?, isApproved = ?, isActive = ?, decisionNo = ? \n"
                + "WHERE syllabusId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, c.getSubjectCode());
            st.setString(2, c.getSyllabusNameEn());
            st.setString(3, c.getSyllabusNameVn());
            st.setBoolean(4, c.isIsActive());
            st.setBoolean(5, c.isIsApproved());
            st.setString(6, c.getDecisionNo());
            st.setInt(7, c.getSyllabusId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertSyllabus(String subjectCode, String syllabusNameVn, String syllabusNameEn, boolean isApproved, boolean isActive, String decisionNo) {
        String query = "INSERT INTO `flm_g3`.`syllabus`\n"
                + "(\n"
                + "`subjectCode`,\n"
                + "`syllabusNameVn`,\n"
                + "`syllabusNameEn`,\n"
                + "`isApproved`,\n"
                + "`isActive`,\n"
                + "`decisionNo`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, subjectCode);
            st.setString(2, syllabusNameEn);
            st.setString(3, syllabusNameVn);
            st.setBoolean(4, isApproved);
            st.setBoolean(5, isActive);
            st.setString(6, decisionNo);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Syllabus> searchByCodeSyl(String txtSearch) {
        List<Syllabus> list = new ArrayList<>();
        String query = "SELECT a.syllabusId,a.subjectCode,a.syllabusNameEn,a.syllabusNameVn,a.isActive,a.isApproved,concat(a.decisionNo,' dated ',DATE_FORMAT(d.approvedDate,'%d/%m/%Y'))\n"
                + "\n"
                + "FROM Syllabus a\n"
                + "\n"
                + "join Decision d on a.decisionNo=d.decisionNo \n"
                + "where a.subjectCode like '%" + txtSearch + "%' " + " or a.syllabusNameEn like '%" + txtSearch + "%'  order by syllabusId";
        try {
            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Syllabus(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getBoolean(6), rs.getString(7))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    ///phần code của syllabus detail view
    public SyllabusDetail getSyllabusDetail(String syid) {
        SyllabusDetail list = new SyllabusDetail();
        String query = "select sy.syllabusId,sy.syllabusNameEn,sy.subjectCode,sy.noCredit,sy.degreeLevel,sy.timeAllocation,sy.preRequisite,sy.description,sy.studentTask,sy.tool,sy.scoringScale,sy.decisionNo,sy.isApproved\n"
                + ",sy.note,sy.minAvgMarkToPass,sy.isActive,DATE_FORMAT(d.approvedDate,'%d/%m/%Y') as approvedDate\n"
                + "from syllabus sy join flm_g3.decision d on sy.decisionNo=d.decisionNo\n"
                + "where sy.syllabusId=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, syid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list = new SyllabusDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getBoolean(13),
                        rs.getString(14), rs.getInt(15), rs.getBoolean(16), rs.getString(17));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //lay subjectcode
    public String getSubjectcode(String txt) {
        String s = "";
        String query = "select subjectCode\n"
                + "from syllabus  \n"
                + "where syllabusId =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return s;
    }

    //lay material
    public List<Material> getMaterial(String subcode) {
        List<Material> list = new ArrayList<>();
        String query = "select materialDescription,author,publisher,DATE_FORMAT(publishedDate,'%Y'),edition,isbn,isMainMaterial,isHardCopy,isOnline,note\n"
                + "from material  \n"
                + "where subjectCode =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, subcode);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Material(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7), rs.getBoolean(8), rs.getBoolean(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get clo
    public List<CLO> getClo(String txt) {
        List<CLO> list = new ArrayList<>();
        String query = "SELECT loid,cloName,cloDetails \n"
                + "FROM lo\n"
                + "where syllabusid=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new CLO(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay clo:" + e.getMessage());
        }
        return list;
    }

    //get session
    public List<SessionList> getAllSessionList(String txt) {
        List<SessionList> list = new ArrayList<>();
        String query = "SELECT sy.syllabusId,sy.syllabusNameVn,sy.subjectCode,count(s.sessionNo) as amount\n"
                + "FROM session s right join syllabus sy on s.syllabusId=sy.syllabusId \n"
                + "where sy.syllabusNameEn or sy.syllabusNameVn like ? or sy.subjectCode like  ?\n"
                + "group by s.syllabusId,sy.syllabusNameVn,sy.subjectCode";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + txt + "%");
            st.setString(2, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new SessionList(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay sessionlist:" + e.getMessage());
        }
        return list;
    }

    public List<Session> getSession(String txt) {
        List<Session> list = new ArrayList<>();
        String query = "SELECT  s.sessionid,s.sessionNo,s.topic,s.learningTeachingType,group_concat(lo.cloName) as clo,s.itu,s.studentTasks,s.sDownload,s.studentTasks,s.urls                               \n"
                + "FROM session s left join lo_session ls on s.sessionId=ls.sessionid left join lo  on ls.loid=lo.loId\n"
                + "where s.syllabusId=?\n"
                + "group by s.sessionid,s.sessionNo,s.topic,s.learningTeachingType,s.itu,s.studentTasks,s.sDownload,s.studentTasks,s.urls";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Session(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay session:" + e.getMessage());
        }
        return list;
    }

    public List<Session> getSessionByID(String txt) {
        List<Session> list = new ArrayList<>();
        String query = "SELECT  s.sessionid,s.sessionNo,s.topic,s.learningTeachingType,group_concat(lo.cloName) as clo,s.itu,s.studentTasks,s.sDownload,s.studentTasks,s.urls                               \n"
                + "FROM session s left join lo_session ls on s.sessionId=ls.sessionid left join lo  on ls.loid=lo.loId\n"
                + "where s.sessionid=?\n"
                + "group by s.sessionid,s.sessionNo,s.topic,s.learningTeachingType,s.itu,s.studentTasks,s.sDownload,s.studentTasks,s.urls";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Session(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay session:" + e.getMessage());
        }
        return list;
    }

    public List<Session> getCLOSession(String txt) {
        
        List<Session> list = new ArrayList<>();
        String query = "with t as(select * from lo_session where sessionid=?) \n"
                + "select t.sessionid,lo.loId,lo.cloName\n"
                + "from t right join lo on t.loid=lo.loId";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Session(rs.getInt(1), rs.getInt(2), "",  "",rs.getString(3), "", "", "", "",""));
                
            }
        } catch (SQLException e) {
            System.out.println("loi lay CLO_session:" + e.getMessage());
        }
        return list;
    }

    public List<Session> getCloList(String sylid) {
        List<Session> list = new ArrayList<>();
        String query = "select cloName,loId from lo where syllabusId=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, sylid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Session(0,rs.getInt(2), "", "", rs.getString(1), "", "", "", "k", ""));
            }
        } catch (SQLException e) {
            System.out.println("loi lay clolist add:" + e.getMessage());
        }
        return list;
    }

    public void updateSession(String a, String b, String c, String d, String e, String f, String g, String h, String j, String k[]) {

        String query = "UPDATE session\n"
                + "SET  sessionNo=?, topic=?, learningTeachingType=?, itu=?, studentMaterials=?, sDownload=?, studentTasks=?, urls=?\n"
                + "WHERE  sessionId=?";
        String query2 = "INSERT INTO lo_session (loid, sessionid) VALUES \n"
                + "(?,?);\n";
        String query3 = "Delete from lo_session\n"
                + "where lo_session.sessionid=?;";

        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setString(1, a);
            st.setString(2, b);
            st.setString(3, c);
            st.setString(4, d);
            st.setString(5, e);
            st.setString(6, f);
            st.setString(7, g);
            st.setString(8, h);
            st.setString(9, j);
            st.executeUpdate();
            try {
                PreparedStatement st1 = connection.prepareStatement(query3);
                st1.setString(1, j);
                st1.executeUpdate();
                try {
                    for (String item : k) {
                        PreparedStatement st2 = connection.prepareStatement(query2);
                        st2.setString(1, item);
                        st2.setString(2, j);

                        st2.executeUpdate();
                    }
                } catch (Exception e4) {
                    System.out.println("loi insert lo_session :" + e4.getMessage());
                }
            } catch (Exception e2) {
                System.out.println("loi delete lo_session" + e2.getMessage());
            }
        } catch (SQLException e3) {
            System.out.println("loi lay update session:" + e3.getMessage());
        }

    }

    public int getLastestSessionId() {
        int str=0 ;
        String query = "select sessionId from session\n"
                + "order by sessionId desc\n"
                + "limit 1";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                str = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getlastesessionid" + e.getMessage());
        }
        return str;
    }

    public void addNewSession(String a, String b, String c, String d, String e, String f, String g, String h, String j, String k[]) {

         
        String query = "INSERT INTO session(\n"
                + "`sessionNo`,\n"
                + "`topic`,\n"
                + "`learningTeachingType`,\n"
                + "`itu`,\n"
                + "`studentMaterials`,\n"
                + "`sDownload`,\n"
                + "`studentTasks`,\n"
                + "`urls`,\n"
                + "`syllabusId`)\n"
                + "VALUES\n"
                + "( ?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, a);
            st.setString(2, b);
            st.setString(3, c);
            st.setString(4, d);
            st.setString(5, e);
            st.setString(6, f);
            st.setString(7, g);
            st.setString(8, h);
            st.setString(9, j);
            st.executeUpdate();

        } catch (SQLException e3) {
            System.out.println("loi add session:" + e3.getMessage());
        }
        int sessionid = getLastestSessionId();
        addCLOsession(k, sessionid);
    }

    public void addCLOsession(String k[], int sessionid) {
        
        String query2 = "INSERT INTO lo_session (loid, sessionid) VALUES \n"
                + "(?,?);\n";
        try {
            for (String item : k) {
                PreparedStatement st2 = connection.prepareStatement(query2);
                st2.setString(1, item);
                st2.setInt(2, sessionid);
                st2.executeUpdate();
            }
        } catch (Exception e2) {
            System.out.println("loi add lo_session" + e2.getMessage());
        }
    }

    public void deleteSession(String a) {
        String query="DELETE FROM question where sessionId=?;DELETE FROM session WHERE sessionId=?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, a);
            st.setString(2, a);
            st.executeUpdate();
        } catch (SQLException e3) {
            System.out.println("loi delete session:" + e3.getMessage());
        }
    }
    public void deleteCloSession(String a) {
        
        String query = "DELETE FROM lo_session WHERE sessionId= ?;";
        try {
            
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, a);
            st.executeUpdate();
        } catch (SQLException e3) {
            System.out.println("loi delete lo_session:" + e3.getMessage());
        }
        deleteSession(a);
    }
    

    //get question
    public List<Question> getQuestion(String txt) {
        List<Question> list = new ArrayList<>();
        String query = " select sessionid,name,detail\n"
                + "from question\n"
                + "where syllabusId=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay question:" + e.getMessage());
        }
        return list;
    }

    //get assessment
    public List<Assessments> getAssessmentses(String txt) {
        List<Assessments> list = new ArrayList<>();
        String query = "SELECT category,type,part,weight,completionCriteria,duration,clo,questionType,noQuestion,\n"
                + "knowledgeSkill,gradingGuide,note\n"
                + "FROM assessment\n"
                + "where syllabusId=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Assessments(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12)));
            }
        } catch (SQLException e) {
            System.out.println("loi lay assessment" + e.getMessage());
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

    public static void main(String[] args) {
        SyllabusDBContext d = new SyllabusDBContext();
        d.insertSyllabus("CEA201", "sdf", "sdf", true, true, "1189/QÐ-ÐHFPT");

    }

}
