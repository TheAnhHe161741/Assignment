/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author pc
 */
public class AccountDAL extends DBContext {

    public Connection connection;

    public ArrayList<Account> getallUser() {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String sql = "  Select *from Account";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                Account u = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6));
                list.add(u);
            }
            return list;

        } catch (Exception e) {
            return list;
        }
    }

    public void register(String email, String name, String gender, String phone, String pass, String dob, String address) {
        try {
            String sql = "insert into Account (email,fullname,[password],gender,[address]) values(?,?,?,?,?)";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, email);
            statement.setString(2, name);
            statement.setString(3, pass);
            statement.setString(4, gender);
            statement.setString(5, address);

            statement.executeUpdate();

            ResultSet rs = statement.executeQuery();

        } catch (Exception e) {
        }

    }

}
