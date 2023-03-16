/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class Assessments {
    private String category,type,part,weight,criteria,duration,clo,questiontype,noquesiton,skill,
            guide,note;

    public Assessments() {
    }

    public Assessments(String category, String type, String part, String weight, String criteria, String duration, String clo, String questiontype, String noquesiton, String skill, String guide, String note) {
        this.category = category;
        this.type = type;
        this.part = part;
        this.weight = weight;
        this.criteria = criteria;
        this.duration = duration;
        this.clo = clo;
        this.questiontype = questiontype;
        this.noquesiton = noquesiton;
        this.skill = skill;
        this.guide = guide;
        this.note = note;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPart() {
        return part;
    }

    public void setPart(String part) {
        this.part = part;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getClo() {
        return clo;
    }

    public void setClo(String clo) {
        this.clo = clo;
    }

    public String getQuestiontype() {
        return questiontype;
    }

    public void setQuestiontype(String questiontype) {
        this.questiontype = questiontype;
    }

    public String getNoquesiton() {
        return noquesiton;
    }

    public void setNoquesiton(String noquesiton) {
        this.noquesiton = noquesiton;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getGuide() {
        return guide;
    }

    public void setGuide(String guide) {
        this.guide = guide;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
   
    
}
