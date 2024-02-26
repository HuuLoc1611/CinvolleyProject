/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Order {
    private int oid;  
    private String date;
    private double totalmoney;
    private Product product;
    private AccountDetail accountdetail;
   private OrderLine o;

    public Order() {
    }

    public Order(int oid, String date, double totalmoney, AccountDetail accountdetail) {
        this.oid = oid;
        this.date = date;
        this.totalmoney = totalmoney;
        this.accountdetail = accountdetail;
    } 

    public Order(int oid, String date, double totalmoney, Product product, OrderLine o) {
        this.oid = oid;
        this.date = date;
        this.totalmoney = totalmoney;
        this.product = product;

        this.o = o;
    }

    public void setO(OrderLine o) {
        this.o = o;
    }

    public OrderLine getO() {
        return o;
    }

    
    
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

   

  

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public AccountDetail getAccountdetail() {
        return accountdetail;
    }

    public void setAccountdetail(AccountDetail accountdetail) {
        this.accountdetail = accountdetail;
    }

   
    
}
