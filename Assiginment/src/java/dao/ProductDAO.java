/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.Product;

public class ProductDAO extends DBContext {
    public static void main(String[] args) {
        ProductDAO a = new ProductDAO();
        for (Category category : a.getAllCate()) {
            System.out.println(category.getName());
        }
    }

    public ArrayList<Product> getProductByFilter(String search, String cateId, String pFrom, String pTo, String sortBy, String sortDir, int page, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            // Calculate the start position for pagination
            int start = (page - 1) * pageSize;

            // Create SQL String
            String sql = "SELECT * FROM Products, Category\n"
                    + "WHERE Products.category_id = Category.id AND Products.p_name LIKE ? AND Products.price BETWEEN " + pFrom + " AND " + pTo;
            if (!cateId.isEmpty()) {
                sql += " AND Products.category_id = " + cateId;
            }
            if (sortBy == null || sortBy.isEmpty()) {
                sortBy = "Products.id";
            }
            if (sortDir == null) {
                sortDir = "";
            }
            // Add sorting criteria
            sql += " ORDER BY " + sortBy + " " + sortDir;
            // Add pagination
            sql += " OFFSET " + start + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
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

    public int getTotalProduct(String search, String cateId, String pFrom, String pTo) {
        int total = 0;
        try {
            // Create SQL String
            String sql = "SELECT COUNT(*) FROM Products, Category\n"
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
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
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
}
