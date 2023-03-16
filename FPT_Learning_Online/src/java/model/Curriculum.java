/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Curriculum {

    private int curriculumId;
    private String curriculumCode, nameEn, decription, decisionNo;
    private int totalCredit;
    private PO po;
    private PLO plo;

    public Curriculum() {
    }

    public Curriculum(int curriculumId, String curriculumCode, String nameEn, String decription, String decisionNo, int totalCredit, PO po, PLO plo) {
        this.curriculumId = curriculumId;
        this.curriculumCode = curriculumCode;
        this.nameEn = nameEn;
        this.decription = decription;
        this.decisionNo = decisionNo;
        this.totalCredit = totalCredit;
        this.po = po;
        this.plo = plo;
    }

    public Curriculum(int curriculumId, String curriculumCode, String nameEn, String decription, String decisionNo, int totalCredit) {
        this.curriculumId = curriculumId;
        this.curriculumCode = curriculumCode;
        this.nameEn = nameEn;
        this.decription = decription;
        this.decisionNo = decisionNo;
        this.totalCredit = totalCredit;
    }

    public Curriculum(String curriculumCode) {
        this.curriculumCode = curriculumCode;
    }

    public Curriculum(int curriculumId, String curriculumCode) {
        this.curriculumId = curriculumId;
        this.curriculumCode = curriculumCode;
    }

    public int getCurriculumId() {
        return curriculumId;
    }

    public void setCurriculumId(int curriculumId) {
        this.curriculumId = curriculumId;
    }

    public String getCurriculumCode() {
        return curriculumCode;
    }

    public void setCurriculumCode(String curriculumCode) {
        this.curriculumCode = curriculumCode;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public String getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(String decisionNo) {
        this.decisionNo = decisionNo;
    }

    public int getTotalCredit() {
        return totalCredit;
    }

    public void setTotalCredit(int totalCredit) {
        this.totalCredit = totalCredit;
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

    @Override
    public String toString() {
        return "Curriculum{" + "curriculumId=" + curriculumId + ", curriculumCode=" + curriculumCode + ", nameEn=" + nameEn + ", decription=" + decription + ", decisionNo=" + decisionNo + ", totalCredit=" + totalCredit + ", po=" + po + ", plo=" + plo + '}';
    }

}
