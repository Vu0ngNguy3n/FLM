/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class Subject {
    private String subjectCode;
    private String subjectNameVn;
    private String subjectNameEn;
    private String semester;
    private int noCredit;
    private ArrayList<preRequisite> preRequisites;

    public Subject() {
    }

    public Subject(String subjectCode, String subjectNameVn, String subjectNameEn, String semester, int noCredit, ArrayList<preRequisite> preRequisites) {
        this.subjectCode = subjectCode;
        this.subjectNameVn = subjectNameVn;
        this.subjectNameEn = subjectNameEn;
        this.semester = semester;
        this.noCredit = noCredit;
        this.preRequisites = preRequisites;
    }

    
   

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectNameVn() {
        return subjectNameVn;
    }

    public void setSubjectNameVn(String subjectNameVn) {
        this.subjectNameVn = subjectNameVn;
    }

    public String getSubjectNameEn() {
        return subjectNameEn;
    }

    public void setSubjectNameEn(String subjectNameEn) {
        this.subjectNameEn = subjectNameEn;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public int getNoCredit() {
        return noCredit;
    }

    public void setNoCredit(int noCredit) {
        this.noCredit = noCredit;
    }

    public ArrayList<preRequisite> getPreRequisites() {
        return preRequisites;
    }

    public void setPreRequisites(ArrayList<preRequisite> preRequisites) {
        this.preRequisites = preRequisites;
    }

    @Override
    public String toString() {
        return subjectCode;
    }

   
    
}
