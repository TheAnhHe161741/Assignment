/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    public void insertOrder(User u, Cart cart) {
        //1. Thuc hien add order sau khi check out
        //2. Had Order -> Lay Id cua Order 
        //3. Tu Id cua Order -> Add cac orderitem theo id cua Order
        //4. Sau khi check out hoan tat -> Product giam so luong 
        try {
          
            String sql = "  INSERT INTO [Orders] ([buyer_id] ,[create_date] ,[total] ,[status]) VALUES (?,getdate(),?,1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            stm.setFloat(2, cart.getTotalMoney());
            stm.executeUpdate();
            
          //2. Create SQL2 String - Add Orders xong lay top 1 ID of Orders DESC (de lay th OrderID moi vua dc add)
            String sql2 = "SELECT TOP 1 [id] FROM Orders ORDER BY id DESC";
            stm = connection.prepareStatement(sql2);
            
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1); //  oid = result Selected tu SQL2
                for (CartItem item : cart.getListItems()) {
          // 3. Create SQL3 String - add OrderItems cua Orders check out vao DB (add cac item cua order)
                    String sql3 = "  INSERT INTO [OrderItems] ([order_id] ,[quantity] ,[product_id]) VALUES (?,?,?)";
         
                    stm = connection.prepareStatement(sql3);
                    stm.setInt(1, oid);
                    stm.setInt(2, item.getQuantity());
                    stm.setInt(3, item.getProduct().getId());
                    stm.executeUpdate();
                }
            }
            //4. Create SQL4 String - Sau khi checkout -> add -> update so luong stock giam di sau khi check out
            String sql4 = "  UPDATE [Products] SET stock = stock-? WHERE id = ?";

            stm = connection.prepareStatement(sql4);
            // Duyet tung item trong cart de get quantity va tru di 
            for (CartItem item : cart.getListItems()) {
                stm.setInt(1, item.getQuantity());
                stm.setInt(2, item.getProduct().getId());
                stm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Order> getAllOrderByUserId(int uid) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders WHERE buyer_id = " + uid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getDouble(4),
                        rs.getInt(5), OrderStatusEnum.getNameValueOf(rs.getInt(5))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void editOrder(int status, int oid) {
        try {
            
            String sql = "UPDATE Orders SET status = ? WHERE id = " + oid;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Order getOrderById(int oid) {
        try {
         String sql = "SELECT * FROM Orders WHERE id = " + oid;
         PreparedStatement stm = connection.prepareStatement(sql);
         ResultSet rs = stm.executeQuery();
        while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getDouble(4),
                        rs.getInt(5), OrderStatusEnum.getNameValueOf(rs.getInt(5)));
                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
