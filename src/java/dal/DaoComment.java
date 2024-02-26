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
import model.Comment;
public class DaoComment extends DBContext{

    public void addComment(String pid, int uid, String comment) {
          LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "INSERT INTO [dbo].[Comment]\n"
                + "           ([pid]\n"
                + "           ,[uid]\n"
                + "           ,[comment]\n"
                + "           ,[date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, uid);
            st.setString(3, comment);
            st.setString(4, date);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public List<Comment> getAllComment(String pid){
        List<Comment> list = new ArrayList<>();
        String sql = "select * from Comment c, AccountDetail a where pid = ? and c.uid = a.uid";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                //int uid, String name, String address, String phone, String email, String image, String dob
                AccountDetail a = new AccountDetail(rs.getInt("uid"), rs.getString("name"), rs.getString("address"), rs.getString("phone"), rs.getString("email"),
                        "", rs.getString("dob"));
                list.add(new Comment(rs.getInt(1), rs.getString("date"),rs.getString("comment"), rs.getInt(2), a));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Comment> get3Comment(int mount, String pid){
         List<Comment> list = new ArrayList<>();
          String sql = "select * from Comment c, AccountDetail a where pid = ? and c.uid = a.uid order by c.commentid  OFFSET ? ROWS  FETCH FIRST 3 ROWS ONLY";
          System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
           st.setInt(2, mount);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                //int uid, String name, String address, String phone, String email, String image, String dob
                AccountDetail a = new AccountDetail(rs.getInt("uid"), rs.getString("name"), rs.getString("address"), rs.getString("phone"), rs.getString("email"),
                        "", rs.getString("dob"));
                list.add(new Comment(rs.getInt(1), rs.getString("date"),rs.getString("comment"), rs.getInt(2), a));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
          
    
    public static void main(String[] args) {
        DaoComment d = new DaoComment();
       List<Comment> list = d.get3Comment(1, "1");
        System.out.println(list);
    }
}
