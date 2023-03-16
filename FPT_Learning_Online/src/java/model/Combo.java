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
public class Combo {

    private int comboid;
    private String comboNameVn;
    private String comboNameEn;
    private String note;
    private String tag;
    private int curriculumId;
    ArrayList<Subject> subjects = new ArrayList<>();

    public Combo() {
    }

    public Combo(int comboid, String comboNameVn, String comboNameEn, String note, String tag, int curriculumId) {
        this.comboid = comboid;
        this.comboNameVn = comboNameVn;
        this.comboNameEn = comboNameEn;
        this.note = note;
        this.tag = tag;
        this.curriculumId = curriculumId;
    }

    public int getComboid() {
        return comboid;
    }

    public void setComboid(int comboid) {
        this.comboid = comboid;
    }

    public String getComboNameVn() {
        return comboNameVn;
    }

    public void setComboNameVn(String comboNameVn) {
        this.comboNameVn = comboNameVn;
    }

    public String getComboNameEn() {
        return comboNameEn;
    }

    public void setComboNameEn(String comboNameEn) {
        this.comboNameEn = comboNameEn;
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

    public int getCurriculumId() {
        return curriculumId;
    }

    public void setCurriculumId(int curriculumId) {
        this.curriculumId = curriculumId;
    }
    
}
