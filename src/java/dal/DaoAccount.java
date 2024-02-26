/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AccountDetail;

public class DaoAccount extends DBContext {

    public Account checkAccount(String user, String pass) {
        String sql = "select * from Account where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDetail a2 = new AccountDetail(rs.getInt("uid"), null, "", "", "", "", "");
                Account a = new Account(rs.getInt("uid"), rs.getString(2), rs.getString(3), rs.getBoolean(4),rs.getBoolean(5), a2);
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExsit(String user) {
        String sql = "select * from Account where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDetail a2 = new AccountDetail(rs.getInt("uid"), null, "", "", "", "", "");
                Account a = new Account(rs.getInt("uid"), rs.getString(2), rs.getString(3), rs.getBoolean(4), a2);
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String user, String password) {
        String sql = "insert into Account ( username, password, isAdmin, isActive) values ( ?, ?, 0, 1)";
        int n = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, password);
            st.executeUpdate();

            

        } catch (Exception e) {
        }
      

    }
     public Account getAccountById(int aid) {
        String sql = "select * from Account where uid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            System.out.println(sql);

            while (rs.next()) {
                AccountDetail a2 = new AccountDetail();
               Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), a2);
                return a;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void changePass(int aid, String pass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + " WHERE uid = ?";
        try {
            System.out.println(sql);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(2, aid);
            st.setString(1, pass);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public AccountDetail getAById(int aid) {
        String sql = "select * from AccountDetail where uid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            System.out.println(sql);

            while (rs.next()) {

                AccountDetail a = new AccountDetail(rs.getInt(1), rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                return a;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void upDate(String name, String address, String phone, String email, String image, String dob, int uid) {
        try {
            String sql1 = "insert [dbo].[AccountDetail] (uid) values (?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, uid);
            st1.executeUpdate();
        } catch (Exception e) {
        }
        try {
            String sql = "UPDATE [dbo].[AccountDetail]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[dob] = ?\n"
                    + " WHERE uid = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, image);
            st.setString(6, dob);
            st.setInt(7, uid);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Account> gettAllAccount(String search) {
        String sql = "";
        if (search.isEmpty()) {
            sql = "select * from Account a left join AccountDetail a1 on a.uid = a1.uid";
        } else if ("1".equals(search)) {
            sql = "select * from Account a  join AccountDetail a1 on a.uid = a1.uid and isAdmin = 1 and a.uid != 2";
        } else {
            sql = "select * from Account a  join AccountDetail a1 on a.uid = a1.uid and isAdmin = 0";
        }
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDetail a2 = new AccountDetail(rs.getInt(5), rs.getString("name"), rs.getString("address"), rs.getString("phone"),
                        rs.getString("email"), rs.getString("image"), rs.getString("dob"));
                //int uid, String name, String address, String phone, String email, String image, String dob
                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean("isAdmin"),
                        rs.getBoolean("isActive"),
                        a2);
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updataAdmin(String uid, String ad) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET       [isAdmin] = ?\n"
                + " WHERE uid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ad);
            st.setString(2, uid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
     public void isActive(String uid, String ad) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET       [isActive] = ?\n"
                + " WHERE uid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ad);
            st.setString(2, uid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
   

    public static void main(String[] args) {
        DaoAccount d = new DaoAccount();
        AccountDetail a2 = d.getAById(1);
                System.out.println(a2.getName());
     
    }
}
