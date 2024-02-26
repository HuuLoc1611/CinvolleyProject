/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product {
    private int pid;
 
    private String name;
    private String image;
    private String description;
    private double price;
    private Category category;
    private List<Pdetail> list;

    public Product() {
    }

    public Product(int pid, String name,  String image,String description,double price,Category category) {
        this.pid = pid;
        this.category = category;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.list = list;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Pdetail> getList() {
        return list;
    }

    public void setList(List<Pdetail> list) {
        this.list = list;
    }
    
}