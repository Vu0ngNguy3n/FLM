/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author l
 */
public class Mapping {

    private int ploid;
    private int poid;
    private int curriculumid;
    private PO po;
    private PLO plo;
    private Curriculum curriculum;

    public Curriculum getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(Curriculum curriculum) {
        this.curriculum = curriculum;
    }

    public Mapping(int ploid, int poid, int curriculumid, PO po, PLO plo, Curriculum curriculum) {
        this.ploid = ploid;
        this.poid = poid;
        this.curriculumid = curriculumid;
        this.po = po;
        this.plo = plo;
        this.curriculum = curriculum;
    }

    public PO getPo() {
        return po;
    }

    public void setPo(PO po) {
        this.po = po;
    }

    public PLO getPlo() {
        return plo;
    }

    public void setPlo(PLO plo) {
        this.plo = plo;
    }

    public Mapping() {
    }

    public Mapping(int ploid, int poid, int curriculumid, PO po, PLO plo) {
        this.ploid = ploid;
        this.poid = poid;
        this.curriculumid = curriculumid;
        this.po = po;
        this.plo = plo;
    }

    public Mapping(int ploid, int poid, int curriculumid) {
        this.ploid = ploid;
        this.poid = poid;
        this.curriculumid = curriculumid;
    }

    public int getPloid() {
        return ploid;
    }

    public void setPloid(int ploid) {
        this.ploid = ploid;
    }

    public int getPoid() {
        return poid;
    }

    public void setPoid(int poid) {
        this.poid = poid;
    }

    public int getCurriculumid() {
        return curriculumid;
    }

    public void setCurriculumid(int curriculumid) {
        this.curriculumid = curriculumid;
    }

    @Override
    public String toString() {
        return "Mapping{" + "ploid=" + ploid + ", poid=" + poid + ", curriculumid=" + curriculumid + ", po=" + po + ", plo=" + plo + '}';
    }

}
