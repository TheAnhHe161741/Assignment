/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            // Create SQL String
            String sql = "SELECT * FROM [Users]"; // Create SQL String
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getInt(10));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void register(String email, String name, String gender, String phone, String pass, String dob, String address) {
        try {
            // Create SQL String
            String sql = "INSERT INTO Users(email, full_name, gender, phone, [password], dob, create_date, [address], [isAdmin]) VALUES (?,?,?,?,?,?,GETDATE(),?,0)";
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, name);
            stm.setString(3, gender);
            stm.setString(4, phone);
            stm.setString(5, pass);
            stm.setString(6, dob);
            stm.setString(7, address);
            // Execute Update
            stm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editProfile(String email, String password, String name, String gender, String phone, String dob, String address, String id) {
        try {
            // Create SQL String
            String sql = "UPDATE Users SET [email] = ?, [password] = ?, [full_name] = ?, [gender] = ?, [phone] = ?, [dob] = ?, [address] = ? WHERE [id] = ?";
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.setString(4, gender);
            stm.setString(5, phone);
            stm.setString(6, dob);
            stm.setString(7, address);
            stm.setString(8, id);
            // Execute Update
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String uid) {
        try {
            String sql = "DELETE FROM Users WHERE id = " + uid;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editUserManager(String email, String password, String name, String gender, String phone, String dob, String address, String isAd, String id) {
        try {
            // Create SQL String
            String sql = "UPDATE Users SET [email] = ?, [password] = ?, [full_name] = ?, [gender] = ?, [phone] = ?, [dob] = ?, [address] = ?, [isAdmin] = ? WHERE [id] = ?";
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.setString(4, gender);
            stm.setString(5, phone);
            stm.setString(6, dob);
            stm.setString(7, address);
            stm.setString(8, isAd);
            stm.setString(9, id);
            // Execute Update
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserById(String id) {
        try {
            // Create SQL String
            String sql = "SELECT * FROM Users WHERE id = " + id;
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9), rs.getInt(10));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public User getUserById(String id) {
//        try {
//            String sql = "select * from Users where id = ? " + id;
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8), rs.getString(9));
//                return user;
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
}
