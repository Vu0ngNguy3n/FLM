/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class SyllabusDetail {

    private int syllabusid;
    private String syllabusname;
    private String subjectcode;
    private int nocredit;
    private String degreelevel;
    private String timeallocation;
    private String prerequisite;
    private String description;
    private String studenttask;
    private String tool;
    private String scoringscle;
    private String decisionNo;
    private boolean isapproved;
    private String note;
    private int minavg;
    private boolean isactive;
    private String approvedate;

    public SyllabusDetail() {
    }

    public SyllabusDetail(int syllabusid, String syllabusname, String subjectcode, int nocredit, String degreelevel, String timeallocation,
            String prerequisite, String description, String studenttask, String tool, String scoringscle, String decisionNo, boolean isapproved, 
            String note, int minavg, boolean isactive, String approvedate) {
        this.syllabusid = syllabusid;
        this.syllabusname = syllabusname;
        this.subjectcode = subjectcode;
        this.nocredit = nocredit;
        this.degreelevel = degreelevel;
        this.timeallocation = timeallocation;
        this.prerequisite = prerequisite;
        this.description = description;
        this.studenttask = studenttask;
        this.tool = tool;
        this.scoringscle = scoringscle;
        this.decisionNo = decisionNo;
        this.isapproved = isapproved;
        this.note = note;
        this.minavg = minavg;
        this.isactive = isactive;
        this.approvedate = approvedate;
    }

    public int getSyllabusid() {
        return syllabusid;
    }

    public void setSyllabusid(int syllabusid) {
        this.syllabusid = syllabusid;
    }

    public String getSyllabusname() {
        return syllabusname;
    }

    public void setSyllabusname(String syllabusname) {
        this.syllabusname = syllabusname;
    }

    public String getSubjectcode() {
        return subjectcode;
    }

    public void setSubjectcode(String subjectcode) {
        this.subjectcode = subjectcode;
    }

    public int getNocredit() {
        return nocredit;
    }

    public void setNocredit(int nocredit) {
        this.nocredit = nocredit;
    }

    public String getDegreelevel() {
        return degreelevel;
    }

    public void setDegreelevel(String degreelevel) {
        this.degreelevel = degreelevel;
    }

    public String getTimeallocation() {
        return timeallocation;
    }

    public void setTimeallocation(String timeallocation) {
        this.timeallocation = timeallocation;
    }

    public String getPrerequisite() {
        return prerequisite;
    }

    public void setPrerequisite(String prerequisite) {
        this.prerequisite = prerequisite;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStudenttask() {
        return studenttask;
    }

    public void setStudenttask(String studenttask) {
        this.studenttask = studenttask;
    }

    public String getTool() {
        return tool;
    }

    public void setTool(String tool) {
        this.tool = tool;
    }

    public String getScoringscle() {
        return scoringscle;
    }

    public void setScoringscle(String scoringscle) {
        this.scoringscle = scoringscle;
    }

    public String getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(String decisionNo) {
        this.decisionNo = decisionNo;
    }

    public boolean isIsapproved() {
        return isapproved;
    }

    public void setIsapproved(boolean isapproved) {
        this.isapproved = isapproved;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getMinavg() {
        return minavg;
    }

    public void setMinavg(int minavg) {
        this.minavg = minavg;
    }

    public boolean isIsactive() {
        return isactive;
    }

    public void setIsactive(boolean isactive) {
        this.isactive = isactive;
    }

    public String getApprovedate() {
        return approvedate;
    }

    public void setApprovedate(String approvedate) {
        this.approvedate = approvedate;
    }
    
    

}
