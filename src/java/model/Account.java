/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Account {
    private int uid;
    private String username;
    private String password;
    private boolean isAdmin;
    private boolean isActive;
    private AccountDetail a;
    public Account() {
    }

    public Account(int uid, String username, String password, boolean isAdmin, AccountDetail a) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.a = a;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Account(int uid, String username, String password, boolean isAdmin, boolean isActive, AccountDetail a) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.isActive = isActive;
        this.a = a;
    }
    
    
  
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public AccountDetail getA() {
        return a;
    }

    public void setA(AccountDetail a) {
        this.a = a;
    }

  
    
}
