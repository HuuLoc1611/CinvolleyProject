/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Order;
import java.sql.*;
import java.util.ArrayList;
import model.AccountDetail;
import model.Category;
import model.OrderLine;
import model.Pdetail;
import model.Product;
import model.Size;

/**
 *
 * @author Admin
 */
public class DaoOrder extends DBContext {

    public List<Order> getAllOrder() {
        String sql = "select * from [order] o, AccountDetail a where o.uid = a.uid order by o.oid desc";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //int uid, String name, String address, String phone, String email, String image, String dob
                AccountDetail a = new AccountDetail(rs.getInt("uid"), rs.getString("name"), rs.getString("address"), rs.getString("phone"), rs.getString("email"),
                        rs.getString("image"), rs.getString("dob"));
                //int oid, String date, double totalmoney, AccountDetail accountdetail
                list.add(new Order(rs.getInt(1), rs.getString("date"), rs.getDouble("totalmoney"), a));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderLine> getAllOrderLine() {
        String sql = "select * from [OrderLine]";
        List<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderLine(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5)));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
  
    
    public List<Order> getRevenue() {
        String sql = "select sum(totalmoney)  date from [order] o";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDetail a = new AccountDetail();
                list.add(new Order(0, "", rs.getDouble(1), a));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int totalQuantity() {
        int n = 0;
        String sql = "select  sum(quantity) as total  from OrderLine";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return n;
    }

    public List<Order> getRevenuebyYear(String year) {
        List<Order> list = new ArrayList<>();
        int month[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
        for (int i : month) {
            String sql = "select sum(totalmoney) as [total] from [order] o where  \n"
                    + "year(date) = ? and MONTH(date) = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, year);
                st.setInt(2, i);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    AccountDetail a = new AccountDetail();
                    list.add(new Order(0, "", rs.getDouble(1), a));
                }
            } catch (Exception e) {
            }
        }

        return list;
    }

    public List<OrderLine> getByCidSold() {
        List<OrderLine> list = new ArrayList<>();
        String sql = "select sum(quantity) as [total], c.cid, c.name  from OrderLine o,[order] o1, Product p, Category c \n" +
"                     where o.pid = p.pid and p.cid = c.cid and o.oid = o1.oid \n" +
"                      group by c.cid, c.name ";
   

        try {         
            PreparedStatement st = connection.prepareStatement(sql);
          
       ResultSet rs =st.executeQuery();
               
            
            
            while (rs.next()) {

                list.add(new OrderLine(0, 0, 0, rs.getInt("total"), 0));
            }
        } catch (Exception e) {
        }
        return list;
    }
   public List<OrderLine> getByCidSold(String month, String year) {
        List<OrderLine> list = new ArrayList<>();
        String sql = "";
    if (month.equals("")) {
            sql = "select sum(quantity) as [total], c.cid, c.name  from OrderLine o,[order] o1, Product p, Category c \n"
                    + " where o.pid = p.pid and p.cid = c.cid and o.oid = o1.oid and year(o1.date) = ?\n" +
                      " group by c.cid, c.name ";
         } else if(!month.equals("")){
             sql = "select sum(quantity) as [total], c.cid, c.name  from OrderLine o,[order] o1, Product p, Category c \n"
                    + " where o.pid = p.pid and p.cid = c.cid and o.oid = o1.oid and month(o1.date) = ?\n and year(o1.date)=? " +
                      " group by c.cid, c.name ";
        }

        try {         
            PreparedStatement st = connection.prepareStatement(sql);
            if (month.equals("")){
                st.setString(1, year);

            } else {
                  st.setString(1, month);
                st.setString(2, year);
            }
       ResultSet rs =st.executeQuery();
               
            
            
            while (rs.next()) {

                list.add(new OrderLine(0, 0, 0, rs.getInt("total"), 0));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProDuctLIST(int cid) {
        List<Product> list1 = new ArrayList<>();
        String sql = "select p.sid, p.pid, p.quantity, s.id, s.name as[sname], p1.cid, p1.name, p1.image, p1.description, p1.price \n"
                + "                from ProductDetail p, Size s, Product p1 where p1.pid=p.pid and s.id = p.sid";
        if (cid != 0) {
            sql += " and p1.cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                //int pid, String name, String image, String description, double price, Category category
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                List<Pdetail> list2 = new ArrayList<>();
                String sql2 = "select * from ProductDetail p, size s where p.sid = s.id";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                ResultSet rs2 = st2.executeQuery();
                while (rs2.next()) {
                    Size s = new Size(rs2.getInt("sid"), rs2.getString("name"));
                    list2.add(new Pdetail(rs2.getInt("pid"), rs2.getInt("quantity"), s));
                    p.setList(list2);

                }
                list1.add(p);

            }
        } catch (Exception e) {
        }
        return list1;

    }
    public List<Order> getCustomerRich(String month, String year){
        List<Order> list = new ArrayList<>();
        String sql = "select sum(totalmoney) as [total], a.uid, a.name, a.phone, a.email from [order] o, AccountDetail a "
                + "where o.uid = a.uid and MONTH(o.date) = ? and YEAR(o.date) = ?\n" +
        "group by  a.uid, a.name, a.phone, a.email order by total desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
               st.setString(1, month);
            st.setString(2, year);
            ResultSet rs = st.executeQuery();
        
            while(rs.next()){
                                            //int uid, String name, String address, String phone, String email, String image, String dob
                AccountDetail a = new AccountDetail(rs.getInt(2), rs.getString(3), "", rs.getString(4), rs.getString(5), "", "");
              list.add(new Order(0, null, rs.getDouble("total"), a));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<OrderLine> listGetFe(){
        List<OrderLine> list = new ArrayList<>();
        String sql = "select top 3 sum(quantity) as [total], p.name, p.image, p.pid, p.price from OrderLine o, Product p where o.pid = p.pid\n" +
"group by p.name, p.image, p.pid, p.price order by total desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Product p = new Product(rs.getInt(4), rs.getString(2), rs.getString(3), null, 0, null);
                list.add(new OrderLine(0, rs.getInt(4), 0, rs.getInt(1), rs.getDouble(5), p));
            }
        } catch (Exception e) {
        }
        return list;
    }
      public List<Order> getHistoryOrder(int uid){
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] o, [OrderLine] o1, AccountDetail a, Product p where o.oid = o1.oid and a.uid = o.uid \n" +
"                and o1.pid = p.pid and o.uid = ? order by o.oid desc";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                while (rs.next()) {         
                    Category c = new Category();
                    Product product = new Product(rs.getInt("pid"), rs.getString(19), rs.getString(20), rs.getString(21), rs.getDouble("price"), c);
                    AccountDetail accountdetail = new AccountDetail();
                    //int oid, int pid, int sid, int quantity, double money
                    OrderLine o = new OrderLine(rs.getInt(1), rs.getInt("pid"), 0, rs.getInt(8), 0);
                    list.add(new Order(rs.getInt("oid"), rs.getString("date"), rs.getDouble("price"), product, o));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DaoOrder d = new DaoOrder();
      List<Order> list = d.getHistoryOrder(4);
        System.out.println(list);
    }
}
