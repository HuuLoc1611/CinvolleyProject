/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderLine {
    private int oid, pid, sid, quantity;
    private double money;
    private Product p;
    public OrderLine() {
    }

    public OrderLine(int oid, int pid, int sid, int quantity, double money, Product p) {
        this.oid = oid;
        this.pid = pid;
        this.sid = sid;
        this.quantity = quantity;
        this.money = money;
        this.p = p;
    }
     public void setP(Product p) {
        this.p = p;
    }

    public Product getP() {
        return p;
    }

   
    
    public OrderLine(int oid, int pid, int sid, int quantity, double money) {
        this.oid = oid;
        this.pid = pid;
        this.sid = sid;
        this.quantity = quantity;
        this.money = money;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
    
}
