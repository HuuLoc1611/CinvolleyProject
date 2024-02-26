/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public final class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemById(int id, int sid){
        for (Item i : items) {
            if(id == i.getProduct().getPid() && sid == i.getSize().getSid()){
                return i;
            }
        }
        return null;
    }
    public int getQuantityById(int id, int sid){
        Item i = getItemById(id, sid);
        return i.getQuantity();
    }
    public void addItem(Item t){
        if(getItemById(t.getProduct().getPid(), t.getSize().getSid()) != null){
            Item m = getItemById(t.getProduct().getPid(), t.getSize().getSid());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }else {
           items.add(t);
        }
    }
    
    public void removeItem(int id, int sid){
        if(getItemById(id, sid)!= null){
            items.remove(getItemById(id, sid));
        }
    }
    public double getTotalMoney(){
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }
    private Product getProByID(int id, List<Product> list, int sid){
        DAO d = new DAO();
       /* for (Product i : list) {
          if( i.getPid() == id){
              return i;
          }
        }
        return null;*/
       Product p = d.getPdetailCart(id, sid);
       return p;
    }
    
   
    public Cart(String txt, List<Product> list){
        DAO d = new DAO();     
        items = new ArrayList<>();
        try {
             if(txt != null && txt.length() != 0){
            String [] s = txt.split("/");
                    for (String i : s) {
                String []n = i.split(":");
                int id = Integer.parseInt(n[0]);
                int quantity= Integer.parseInt(n[1]);
                int sid = Integer.parseInt(n[2]);
                Product p = getProByID(id, list, sid);
                 Size s2 = d.getSizeBySid(sid);                  
                Item t = new Item(p, quantity, p.getPrice(), s2);
                        addItem(t);
            }
        }
        } catch (Exception e) {
        }
       
    }
    
    
    public static void main(String[] args) {
       String  txt = "1" + ":" + "4" + "2";
       DAO d  = new DAO();
       Cart cart = new Cart();
       List<Product> list = d.getPdetailCart();
       Product p = cart.getProByID(2, list, 2);
        System.out.println(p.getName());
    }
}
