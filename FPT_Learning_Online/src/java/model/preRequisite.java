 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;



/**
 *
 * @author admin
 */
public class preRequisite {
    private String subject;
    private String pre;

    public preRequisite() {
    }

    public preRequisite(String subject,String pre) {
        this.subject = subject;
        this.pre = pre;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPre() {
        return pre;
    }

    public void setPre(String pre) {
        this.pre = pre;
    }

    @Override
    public String toString() {
        return pre;
    }

    
    
    
}
