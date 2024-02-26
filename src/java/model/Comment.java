/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Comment {
    private int commentid;
       private String date;
       private String comment;
    private int pid;
   private AccountDetail a;

    public Comment() {
    }

    public Comment(int commentid, String date, String comment, int pid, AccountDetail a) {
        this.commentid = commentid;
        this.date = date;
        this.comment = comment;
        this.pid = pid;
        this.a = a;
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public AccountDetail getA() {
        return a;
    }

    public void setA(AccountDetail a) {
        this.a = a;
    }

   
}
