/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Category;
import entity.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getProductByFilter(String search, String cateId, String pFrom, String pTo) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            // Create SQL String
            String sql = "SELECT * FROM Products, Category\n"
                    + "  WHERE Products.category_id = Category.id AND Products.p_name LIKE ? AND Products.price BETWEEN " + pFrom + " AND " + pTo;
            if (!cateId.isEmpty()) {
                sql = sql + " and Products.category_id = " + cateId;
            }
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getDate(10), rs.getBoolean(11), rs.getInt(12), new Category(rs.getInt(13), rs.getString(14)));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Category> getAllCate() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            // Create SQL String
            String sql = "SELECT * FROM Category";
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(String id) {
        try {
            // Create SQL String
            String sql = "SELECT * FROM Products, Category WHERE Products.category_id = Category.id AND Products.id = ?";
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5),
                        rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getDate(10), rs.getBoolean(11), rs.getInt(12), new Category(rs.getInt(13), rs.getString(14)));
                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int count(String search, String cateId) {
        try {
            // Create SQL String            
            String sql = "SELECT count(*) FROM Products, Category\n"
                    + "  WHERE Products.category_id = Category.id AND Products.p_name LIKE ?";
            if (!cateId.isEmpty()) {
                sql = sql + " and Products.category_id = " + cateId;
            }
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            // Execute Query
            ResultSet rs = stm.executeQuery();
            // Process Result
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void editProduct(String pid, String name, String code, String stock, String price, String discount, String img, String color, String desc, String date, String cate) {
        try {
            // Create SQL String
            String sql = "UPDATE Products \n"
                    + "  SET p_name = ?, p_code = ?, stock = ?, price = ?, discount = ?, img = ?, color = ?, [description] = ?, [create_date] = ?, [category_id] = ?\n"
                    + "  WHERE id = " + pid;
            // Create Statement
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, code);
            stm.setString(3, stock);
            stm.setString(4, price);
            stm.setString(5, discount);
            stm.setString(6, img);
            stm.setString(7, color);
            stm.setString(8, desc);
            stm.setString(9, date);
            stm.setString(10, cate);
            // Execute Update
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(String pid) {
        try {
            String sql = "DELETE FROM Products WHERE id = " + pid;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addProduct(String pname, String pcode, String stock, String price, String disc, String img, String color, String desc, String date, String cate) {
        try {
            String sql = "INSERT INTO Products (p_name, p_code, stock, price, discount, img, color, [description], [create_date], [category_id]) VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pname);
            stm.setString(2, pcode);
            stm.setString(3, stock);
            stm.setString(4, price);
            stm.setString(5, disc);
            stm.setString(6, img);
            stm.setString(7, color);
            stm.setString(8, desc);
            stm.setString(9, date);
            stm.setString(10, cate);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

//    public ArrayList<Product> searchByCount(String search, String cateId, int index, int size) {
//        ArrayList<Product> list = new ArrayList<>();
//        try {
//            // Create SQL String
//            String sql = "WITH x AS (SELECT ROW_NUMBER() OVER (ORDER BY [create_date] DESC) as r, * FROM Products, Category WHERE Products.category_id = Category.id AND Products.p_name LIKE ?\n";
//            if (!cateId.isEmpty()) {
//                sql = sql + " AND Products.category_id = " + cateId;
//            }
//            String sql1 = sql + ") SELECT * FROM x WHERE r BETWEEN ?*3-2 and ? * 3";
//            // Create Statement
//            PreparedStatement stm = connection.prepareStatement(sql1);
//            stm.setString(1, "%" + search + "%");
//            stm.setInt(2, index);
//            stm.setInt(3, index);
//            // Execute Query
//            ResultSet rs = stm.executeQuery();
//            // Process Result
//            while (rs.next()) {
//                Product product = new Product(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6),
//                        rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11), rs.getBoolean(12), rs.getInt(13), new Category(rs.getInt(14), rs.getString(15)));
//                list.add(product);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public static void main(String[] args) {
//        ProductDAO dAO = new ProductDAO();
//        int count = dAO.count("A", "");
//        System.out.println(count);
//    }
}
