/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author bongt
 */
public class learningPath {
    private int syllabusID;
    private String subjectName;
    private String syllabusName;
    private String Decision;
    private ArrayList<preRequisite> subjectNeed;

    public learningPath(int syllabusID, String subjectName, String syllabusName, String Decision, ArrayList<preRequisite> subjectNeed) {
        this.syllabusID = syllabusID;
        this.subjectName = subjectName;
        this.syllabusName = syllabusName;
        this.Decision = Decision;
        this.subjectNeed = subjectNeed;
    }

    public learningPath() {
    }

    public int getSyllabusID() {
        return syllabusID;
    }

    public void setSyllabusID(int syllabusID) {
        this.syllabusID = syllabusID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSyllabusName() {
        return syllabusName;
    }

    public void setSyllabusName(String syllabusName) {
        this.syllabusName = syllabusName;
    }

    public String getDecision() {
        return Decision;
    }

    public void setDecision(String Decision) {
        this.Decision = Decision;
    }

    public ArrayList<preRequisite> getSubjectNeed() {
        return subjectNeed;
    }

    public void setSubjectNeed(ArrayList<preRequisite> subjectNeed) {
        this.subjectNeed = subjectNeed;
    }

    
    
    
}
