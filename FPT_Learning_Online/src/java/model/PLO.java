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
public class PLO {

    private int ploid;
    private String ploname, plodescription;
    private int curriculumId;
 

    public PLO() {
    }

    public int getCurriculumId() {
        return curriculumId;
    }

    public void setCurriculumId(int curriculumId) {
        this.curriculumId = curriculumId;
    }



    public PLO(int ploid, String ploname, String plodescription, int curriculumId) {
        this.ploid = ploid;
        this.ploname = ploname;
        this.plodescription = plodescription;
        this.curriculumId = curriculumId;
    }

    public PLO(int ploid, String ploname, String plodescription) {
        this.ploid = ploid;
        this.ploname = ploname;
        this.plodescription = plodescription;
    }

    public int getPloid() {
        return ploid;
    }

    public void setPloid(int ploid) {
        this.ploid = ploid;
    }

    public String getPloname() {
        return ploname;
    }

    public void setPloname(String ploname) {
        this.ploname = ploname;
    }

    public String getPlodescription() {
        return plodescription;
    }

    public void setPlodescription(String plodescription) {
        this.plodescription = plodescription;
    }

    @Override
    public String toString() {
        return "PLO{" + "ploid=" + ploid + ", ploname=" + ploname + ", plodescription=" + plodescription + ", curriculumId=" + curriculumId + '}';
    }

 

}
