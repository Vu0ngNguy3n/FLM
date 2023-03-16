/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Syllabus {
    private int syllabusId;
    private String subjectCode, syllabusNameEn,syllabusNameVn;
    private boolean      isActive,isApproved;
      private String      decisionNo;

    public Syllabus() {
    }

    public Syllabus(int syllabusId, String subjectCode, String syllabusNameEn, String syllabusNameVn, boolean isActive, boolean isApproved, String decisionNo) {
        this.syllabusId = syllabusId;
        this.subjectCode = subjectCode;
        this.syllabusNameEn = syllabusNameEn;
        this.syllabusNameVn = syllabusNameVn;
        this.isActive = isActive;
        this.isApproved = isApproved;
        this.decisionNo = decisionNo;
    }

    public int getSyllabusId() {
        return syllabusId;
    }

    public void setSyllabusId(int syllabusId) {
        this.syllabusId = syllabusId;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSyllabusNameEn() {
        return syllabusNameEn;
    }

    public void setSyllabusNameEn(String syllabusNameEn) {
        this.syllabusNameEn = syllabusNameEn;
    }

    public String getSyllabusNameVn() {
        return syllabusNameVn;
    }

    public void setSyllabusNameVn(String syllabusNameVn) {
        this.syllabusNameVn = syllabusNameVn;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public String getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(String decisionNo) {
        this.decisionNo = decisionNo;
    }

    
}
