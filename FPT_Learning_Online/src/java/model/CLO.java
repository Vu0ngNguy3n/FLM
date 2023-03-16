/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class CLO {
    private String cloid;
    private String cloname;
    private String cloDetail;

    public CLO() {
    }

    public CLO(String cloid, String cloname, String cloDetail) {
        this.cloid = cloid;
        this.cloname = cloname;
        this.cloDetail = cloDetail;
    }

    public String getCloid() {
        return cloid;
    }

    public void setCloid(String cloid) {
        this.cloid = cloid;
    }

    public String getCloname() {
        return cloname;
    }

    public void setCloname(String cloname) {
        this.cloname = cloname;
    }

    public String getCloDetail() {
        return cloDetail;
    }

    public void setCloDetail(String cloDetail) {
        this.cloDetail = cloDetail;
    }
    
    
    
}
