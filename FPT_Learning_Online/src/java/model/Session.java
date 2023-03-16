/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class Session {
    private int sessionid,sessionno;
    private String topic,learntype,lo,itu,material,down,task,url;

    public Session() {
    }

    public Session(int sessionid,int sessionno,String topic, String learntype, String lo, String itu, String material, String down, String task, String url) {
        this.sessionid=sessionid;
        this.sessionno = sessionno;
        this.topic= topic;
        this.learntype = learntype;
        this.lo = lo;
        this.itu = itu;
        this.material = material;
        this.down = down;
        this.task = task;
        this.url = url;
    }

    public int getSessionid() {
        return sessionid;
    }

    public void setSessionid(int sessionid) {
        this.sessionid = sessionid;
    }

    public int getSessionno() {
        return sessionno;
    }

    public void setSessionno(int sessionno) {
        this.sessionno = sessionno;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getLearntype() {
        return learntype;
    }

    public void setLearntype(String learntype) {
        this.learntype = learntype;
    }

    public String getLo() {
        return lo;
    }

    public void setLo(String lo) {
        this.lo = lo;
    }

    public String getItu() {
        return itu;
    }

    public void setItu(String itu) {
        this.itu = itu;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getDown() {
        return down;
    }

    public void setDown(String down) {
        this.down = down;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    

   
    
}
