/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class AddToCart extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Cart cart = null;
            List<CartItem> listItems = new ArrayList<>();
            if (session.getAttribute("cart") == null) {
                cart = new Cart(listItems);
            } else {
                cart = (Cart) session.getAttribute("cart");
            }
            String productID = request.getParameter("productID");
            String quantity = request.getParameter("quantity");
            ProductDAO dao = new ProductDAO();
            Product p = dao.getProductById(productID);
            CartItem cartItem = new CartItem(p, Integer.valueOf(quantity));
            cart.addItem(cartItem);
            session.setAttribute("cart", cart);
            response.sendRedirect("productList");
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
