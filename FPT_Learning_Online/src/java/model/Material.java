/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bongt
 */
public class Material {
    private String materialdescription,author,publisher,
            publisheddate,edition,isbn;
    private boolean ismain,ishard,isonline;
    private String note;

    public Material() {
    }

    public Material(String materialdescription, String author, String publisher, String publisheddate, String edition, String isbn, boolean ismain, boolean ishard, boolean isonline, String note) {
        this.materialdescription = materialdescription;
        this.author = author;
        this.publisher = publisher;
        this.publisheddate = publisheddate;
        this.edition = edition;
        this.isbn = isbn;
        this.ismain = ismain;
        this.ishard = ishard;
        this.isonline = isonline;
        this.note = note;
    }

    public String getMaterialdescription() {
        return materialdescription;
    }

    public void setMaterialdescription(String materialdescription) {
        this.materialdescription = materialdescription;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPublisheddate() {
        return publisheddate;
    }

    public void setPublisheddate(String publisheddate) {
        this.publisheddate = publisheddate;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public boolean isIsmain() {
        return ismain;
    }

    public void setIsmain(boolean ismain) {
        this.ismain = ismain;
    }

    public boolean isIshard() {
        return ishard;
    }

    public void setIshard(boolean ishard) {
        this.ishard = ishard;
    }

    public boolean isIsonline() {
        return isonline;
    }

    public void setIsonline(boolean isonline) {
        this.isonline = isonline;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
    
     
}
