/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Sub extends Syllabus {

    private String subjectNameEn;

    public Sub() {
    }

    public Sub(int syllabusId, String subjectCode, String subjectNameVn, String syllabusNameVn, String isActive, String isApproved, String decisionNo) {
//        super(syllabusId, subjectCode, syllabusNameVn, isActive, isApproved, decisionNo);
        this.subjectNameEn = subjectNameVn;
    }

    public String getSubjectNameEn() {
        return subjectNameEn;
    }

    public void setSubjectNameEn(String subjectNameEn) {
        this.subjectNameEn = subjectNameEn;
    }


}
