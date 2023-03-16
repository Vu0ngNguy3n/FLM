/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class SessionList {
    private String subjectcode;
    private int syllabusid;
    private String syllabusname;
    private int sessionamount;

    public SessionList() {
    }

    public SessionList( int syllabusid,String syllabusname,String subjectcode , int sessionamount) {
        this.subjectcode = subjectcode;
        this.syllabusid = syllabusid;
        this.syllabusname = syllabusname;
        this.sessionamount = sessionamount;
    }

    public String getSubjectcode() {
        return subjectcode;
    }

    public void setSubjectcode(String subjectcode) {
        this.subjectcode = subjectcode;
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

    public int getSessionamount() {
        return sessionamount;
    }

    public void setSessionamount(int sessionamount) {
        this.sessionamount = sessionamount;
    }
    
    
}
