/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.*;
import java.time.LocalDate;
import model.AccountDetail;
import model.Cart;
import model.Category;
import model.Item;
import model.Pdetail;
import model.Size;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        List<Pdetail> list2 = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[cid]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[Product]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductNoiBat() {
        List<Product> list = new ArrayList<>();
        List<Pdetail> list2 = new ArrayList<>();
        String sql = "select * from product where  pid <= 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory(int cid) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        if (cid != 0) {
            sql += " where cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cid"), rs.getString("name")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> get3Category() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category where cid <= 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cid"), rs.getString("name")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProductByCID(int cid) {
        List<Product> list = new ArrayList<>();
        List<Pdetail> list2 = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[cid]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[Product] where cid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalPro() {
        String sql = "select count (*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getRelatedPro(int pid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where cid = (select cid from Product where  pid = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProArr() {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from Product where pid in (select  top 3  pid  from Product order by pid desc)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> paging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from product \n"
                + "                    order by pid\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH FIRST 9 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getPdetail(int pid) {
        List<Product> list1 = new ArrayList<>();
        String sql = "select p.sid, p.pid, p.quantity, s.id, s.name as[sname], p1.cid, p1.name, p1.image, p1.description, p1.price from ProductDetail p, Size s, Product p1 where p1.pid=p.pid and s.id = p.sid and p.pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                //int pid, String name, String image, String description, double price, Category category
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                List<Pdetail> list2 = new ArrayList<>();
                String sql2 = "select * from ProductDetail p, size s where p.sid = s.id and p.pid = ?";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, pid);
                ResultSet rs2 = st2.executeQuery();
                while (rs2.next()) {
                    Size s = new Size(rs2.getInt("sid"), rs2.getString("name"));
                    list2.add(new Pdetail(rs2.getInt("pid"), rs2.getInt("quantity"), s));
                    p.setList(list2);

                }
                list1.add(p);
                return list1;

            }
        } catch (Exception e) {
        }
        return null;

    }

    public Size getSizeBySid(int sid) {
        String sql = "select * from size where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size(rs.getInt(1), rs.getString(2));
                return s;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getPdetailCart() {
        List<Product> list1 = new ArrayList<>();
        String sql = "select p.sid, p.pid, p.quantity, s.id, s.name as[sname], p1.cid, p1.name, p1.image, p1.description, p1.price \n" +
"                from ProductDetail p, Size s, Product p1 where p1.pid=p.pid and s.id = p.sid";
       
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

    public Product getPdetailCart(int pid, int sid) {
        String sql = "select p.sid, p.pid, p.quantity, s.id, s.name as[sname], p1.cid, p1.name, p1.image, p1.description, p1.price from ProductDetail p, Size s, Product p1 where p1.pid=p.pid and s.id = p.sid and p.pid = ? and s.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                //int pid, String name, String image, String description, double price, Category category
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                List<Pdetail> list2 = new ArrayList<>();
                String sql2 = "select * from ProductDetail p, size s where p.sid = s.id and p.pid = ? and s.id = ?";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, pid);
                st2.setInt(2, sid);
                ResultSet rs2 = st2.executeQuery();
                while (rs2.next()) {
                    Size s = new Size(rs2.getInt("sid"), rs2.getString("name"));
                    // list2.add(new Pdetail(pid, , s));
                    list2.add(new Pdetail(rs.getInt("pid"), rs.getInt("quantity"), s));
                    p.setList(list2);
                    return p;
                }

            }
        } catch (Exception e) {
        }
        return null;

    }

    public List<Product> getProByText(String txt, int index) {
        List<Product> list = new ArrayList<>();
        List<Pdetail> list2 = new ArrayList<>();
        String sql = "select * from Product where name like ? order by pid\n"
                + "                OFFSET ? ROWS \n"
                + "                FETCH FIRST 9 ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            st.setInt(2, (index - 1) * 9);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPro(String cid, String search, String min, String max, String op) {
        List<Product> list = new ArrayList<>();
        String sql = "";
        if (cid == null && search == null) {
            sql = "select * from Product"
                    + " order by + " + op;
        }
         if (cid == null && min != null && op!= null) {
                sql = "select * from Product where price" + " between " + min + " and " + max + " order by "+op;    
        } 
         if( min != null && op == null){
              sql = "select * from Product where price" + " between " + min + " and " + max;     
        }
      
        if (cid == null && search != null && min == null && op!= null) {
            sql = "select * from Product where name like " + "'%" + search + "%'"
                    + " order by + " + op;
        }
        if (cid != null && search == null && min == null && op!= null ) {
            sql = "select * from Product where cid = " + cid
                    + " order by " + op;
        }
        if (search == null && cid != null && min != null && op!= null) {
            sql = "select * from Product where cid =  " + cid + "and price " + " between " + min + " and " + max
                    + " order by " + op;
        }
        if (search != null && cid == null && min != null && op!= null) {
            sql = "select * from Product where name like " + "'%" + search + "%'" + "and price " + " between " + min + " and " + max
                    + " order by  " + op;
        }
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
        public List<Product> searchPro2(String cid, String search, String min, String max, String op) {
        List<Product> list = new ArrayList<>();
        String sql = "";
         if (cid == null && search==null && min != null && op!= null) {
                sql = "select * from Product where price" + " between " + min + " and " + max + " order by "+op;    
        } 
         if( cid == null && search==null && min != null && op == null){
              sql = "select * from Product where price" + " between " + min + " and " + max;     
        }
         if(cid != null && min != null && search == null && op==null){
              sql = "select * from Product where cid =  " + cid + " and price " + " between " + min + " and " + max;
         }
         if (search != null && cid == null && min != null && op== null) {
            sql = "select * from Product where name like " + "'%" + search + "%'" + " and price " + " between " + min + " and " + max;
        }

      
     
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
      
   
     public List<Product> maxtomin(String cid, String search, String min, String max, String op) {
        List<Product> list = new ArrayList<>();
        String sql = "";
         if (cid == null && search == null) {
            sql = "select * from Product"
                    + " order by + " + op + " desc";
        }
         if (cid == null && min != null && op!= null) {
                sql = "select * from Product where price" + " between " + min + " and " + max + " order by "+op + " desc";    
        } 
         if( min != null && op == null){
              sql = "select * from Product where price" + " between " + min + " and " + max;     
        }
      
        if (cid == null && search != null && min == null && op!= null) {
            sql = "select * from Product where name like " + "'%" + search + "%'"
                    + " order by + " + op +" desc";
        }
        if (cid != null && search == null && min == null && op!= null ) {
            sql = "select * from Product where cid = " + cid
                    + " order by " + op +" desc";
        }
        if (search == null && cid != null && min != null && op!= null) {
            sql = "select * from Product where cid =  " + cid + "and price " + " between " + min + " and " + max
                    + " order by " + op +" desc";
        }
        if (search != null && cid == null && min != null && op!= null) {
            sql = "select * from Product where name like " + "'%" + search + "%'" + "and price " + " between " + min + " and " + max
                    + " order by  " + op +" desc";
        }
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
     public List<Product> getAjax(String max){
          List<Product> list = new ArrayList<>();
        String sql = "select * from Product where cid = 1 and price < " +max;
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), "");
                Product p = new Product(rs.getInt("pid"), rs.getString("name"), rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"), c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
     }

    public void addProduct(String cid, String name, String image, String description, String price, String sid[], String quantity) {
        String sql1 = "INSERT INTO [dbo].[Product]\n"
                + "           ([cid]\n"
                + "           ,[name]\n"
                + "           ,[image]\n"
                + "           ,[description]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, cid);
            st1.setString(2, name);
            st1.setString(3, image);
            st1.setString(4, description);
            st1.setString(5, price);
            st1.executeUpdate();
           
            String sql3 = "select top 1  pid from Product  order by pid desc";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            ResultSet rs = st3.executeQuery();
            int n = 0;
            while (rs.next()) {
                n = rs.getInt(1);
            }
            for (String i : sid) {
                 String sql2 = "INSERT INTO [dbo].[ProductDetail]\n"
                    + "           ([sid]\n"
                    + "           ,[pid]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
                  PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, i);
            st2.setInt(2, n);
            st2.setString(3, quantity);
            st2.executeUpdate();
            }
           
        } catch (Exception e) {
        }
    }

    public void update(String pid, String cid, String name, String image, String description, String price, String sid, String quantity) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [cid] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[image] =?\n"
                + "      ,[description] = ?\n"
                + "      ,[price] = ?\n"
                + " WHERE pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.setString(2, name);
            st.setString(3, image);
            st.setString(4, description);
            st.setString(5, price);
            st.setString(6, pid);
            st.executeUpdate();
            String sql2 = "UPDATE [dbo].[ProductDetail]\n"
                    + "   SET  [quantity] = ?\n"
                    + " WHERE pid = ? and sid = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, quantity);
            st2.setString(2, pid);
            st2.setString(3, sid);
            st2.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleteP(String pid, String sid) {
        String sql2 = "DELETE FROM [dbo].[ProductDetail]\n"
                + "      WHERE pid = ? and sid = ?";

        try {
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setString(1, pid);
            st2.setString(2, sid);
            st2.executeUpdate();
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE pid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void addOrder(Cart cart, AccountDetail a) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql1 = " INSERT INTO [dbo].[Order]\n"
                    + "           ([uid]\n"
                    + "           ,[date]\n"
                    + "           ,[totalmoney])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, a.getUid());
            st1.setString(2, date);
            st1.setDouble(3, cart.getTotalMoney());
            st1.executeUpdate();
            String sql2 = "select top 1 o.oid from  [dbo].[Order] o order by o.oid  desc";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs2 = st2.executeQuery();
            while (rs2.next()) {
                int oid = rs2.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql3 = "INSERT INTO [dbo].[OrderLine]\n"
                            + "           ([oid]\n"
                            + "           ,[pid]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[sid])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?,?)";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, oid);
                    st3.setInt(2, i.getProduct().getPid());
                    st3.setInt(3, i.getQuantity());
                    st3.setDouble(4, i.getPrice());
                    st3.setInt(5, i.getSize().getSid());
                    st3.executeUpdate();
                }
            }
            String sql4 = "UPDATE [dbo].[ProductDetail]\n"
                    + "   SET \n"
                    + "      [quantity] = ?\n"
                    + " WHERE pid = ? and sid = ?";
            PreparedStatement st4 = connection.prepareStatement(sql4);
            for (Item i : cart.getItems()) {
                st4.setInt(1, i.getProduct().getList().get(0).getQuantity() - i.getQuantity());
                st4.setInt(2, i.getProduct().getPid());
                st4.setInt(3, i.getSize().getSid());
                st4.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public Category getCaById(int cid) {

        String sql = "select * from Category where cid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateCategory(String cid, String name) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [name] = ?\n"
                + " WHERE cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, cid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCategory(String cid) {
            String sql = "DELETE FROM [dbo].[Category]\n" +
"      WHERE cid = ?";
              try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            st.executeUpdate();
        } catch (Exception e) {
    }
    }

    public static void main(String[] args) {
        DAO d = new DAO();
      List<Product> list = d.getAjax("2500000000");
        for (Product o : list) {
            System.out.println(o.getName());
        }
    
    }

   
}
