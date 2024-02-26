/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Pdetail;
import model.Product;

/**
 *
 * @author Admin
 */
public class Sort extends DBContext{
    public List<Product> SortMinToMax(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
    "order by price asc";
         try {
            PreparedStatement st = connection.prepareStatement(sql);          
            ResultSet rs = st.executeQuery();
             while(rs.next()){
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"), 
                        rs.getDouble("price"), c);
               
             
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
     public List<Product> SortMaxToMin(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n" +
        "order by price desc";
         try {
            PreparedStatement st = connection.prepareStatement(sql);          
            ResultSet rs = st.executeQuery();
             while(rs.next()){
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"), 
                        rs.getDouble("price"), c);
               
             
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
     
     public List<Product> SearchBySize(String size){   
         List<Product> list = new ArrayList<>();
        List<Pdetail> list2 = new ArrayList<>();
        String sql = "select * from Product where name like ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
           st.setString(1, "%"+size+"%");
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"), 
                        rs.getDouble("price"), c);
               
             
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
     }
     
     public List<Product> getProByPrice(double max, double min){
         List<Product> list = new ArrayList<>();
         String sql = "select * from Product where price < ? and price > ?";
            try {
            PreparedStatement st = connection.prepareStatement(sql);    
            st.setDouble(1, max);
            st.setDouble(2, min);
            ResultSet rs = st.executeQuery();
             while(rs.next()){
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"), 
                        rs.getDouble("price"), c);
               
             
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
     }
             
     public static void main(String[] args) {
         Sort d = new Sort();
        List<Product> list = d.getProByPrice(100000000,0);
         System.out.println(list);
    }
}
