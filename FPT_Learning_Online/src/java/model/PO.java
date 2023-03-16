/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author l
 */
public class PO {

    private int poId;
    private String poName;
    private String poDecription;
    private int curriculumId;
    private Curriculum curriculum;

    public PO() {
    }

    public PO(int poId, String poName, String poDecription, int curriculumId, Curriculum curriculum) {
        this.poId = poId;
        this.poName = poName;
        this.poDecription = poDecription;
        this.curriculumId = curriculumId;
        this.curriculum = curriculum;
    }

    public PO(int poId, String poName, String poDecription, int curriculumId) {
        this.poId = poId;
        this.poName = poName;
        this.poDecription = poDecription;
        this.curriculumId = curriculumId;
    }

    public int getPoId() {
        return poId;
    }

    public void setPoId(int poId) {
        this.poId = poId;
    }

    public String getPoName() {
        return poName;
    }

    public void setPoName(String poName) {
        this.poName = poName;
    }

    public String getPoDecription() {
        return poDecription;
    }

    public void setPoDecription(String poDecription) {
        this.poDecription = poDecription;
    }

    public int getCurriculumId() {
        return curriculumId;
    }

    public void setCurriculumId(int curriculumId) {
        this.curriculumId = curriculumId;
    }

    public Curriculum getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(Curriculum curriculum) {
        this.curriculum = curriculum;
    }

    @Override
    public String toString() {
        return "PO{" + "poId=" + poId + ", poName=" + poName + ", poDecription=" + poDecription + ", curriculumId=" + curriculumId + ", curriculum=" + curriculum + '}';
    }

}
