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
public class Elective {
    private int electiveId;
    private String electiveNameVn;
    private String elecctiveNameEn;
    private String note;
    private String tag;
    private int curriculumID;
    ArrayList<Subject> subjects = new ArrayList<>();

    public Elective() {
    }

    public Elective(int electiveId, String electiveNameVn, String elecctiveNameEn, String note, String tag, int curriculumID) {
        this.electiveId = electiveId;
        this.electiveNameVn = electiveNameVn;
        this.elecctiveNameEn = elecctiveNameEn;
        this.note = note;
        this.tag = tag;
        this.curriculumID = curriculumID;
    }

    public int getCurriculumID() {
        return curriculumID;
    }

    public void setCurriculumID(int curriculumID) {
        this.curriculumID = curriculumID;
    }

  

    public int getElectiveId() {
        return electiveId;
    }

    public void setElectiveId(int electiveId) {
        this.electiveId = electiveId;
    }

    public String getElectiveNameVn() {
        return electiveNameVn;
    }

    public void setElectiveNameVn(String electiveNameVn) {
        this.electiveNameVn = electiveNameVn;
    }

    public String getElecctiveNameEn() {
        return elecctiveNameEn;
    }

    public void setElecctiveNameEn(String elecctiveNameEn) {
        this.elecctiveNameEn = elecctiveNameEn;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public ArrayList<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(ArrayList<Subject> subjects) {
        this.subjects = subjects;
    }
    
    
}
