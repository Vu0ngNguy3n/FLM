/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class Question {
    private String sessionno,name,detail;

    public Question() {
    }

    public Question(String sessionno, String name, String detail) {
        this.sessionno = sessionno;
        this.name = name;
        this.detail = detail;
    }

    public String getSessionno() {
        return sessionno;
    }

    public void setSessionno(String sessionno) {
        this.sessionno = sessionno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
    
}
