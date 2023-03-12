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
import java.util.List;

/**
 *
 * @author pc
 */
public class LoginDAL {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs= null;
    public Account checkLogin(String user, String pass){
        try{
            String query ="select * from Account where username =? and password =?";
            conn = new DBContext().getConnection();
            ps= conn.prepareStatement(query);
            
            ps.setString(1, user);
            ps.setString(2, pass);
            rs =ps.executeQuery();
            while(rs.next()){
                
                Account a= new Account(rs.getString("username"), rs.getString("password"));
                return a;
            }
        }catch (Exception e){
            
        }
        return null;
        
    }
    public static void main(String[] args) {
        LoginDAL d = new LoginDAL();
        Account a = d.checkLogin("mrc", "1234");
        System.out.println(a.getUsername());
    }
}
