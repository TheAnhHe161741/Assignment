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
import model.Category;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get bien tu front-end (productlist.jsp) day ve 
        int pageNumber = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 6;

        String search = request.getParameter("search");
        String cateId = request.getParameter("cateId");
        String pFrom = request.getParameter("pFrom");
        String pTo = request.getParameter("pTo");
        String sortBy = request.getParameter("sortBy");
        String sortDir = request.getParameter("sortDir");

        //dieu kien bien truyen vao rong truyen vao n 1 string ""
        if (search == null) {
            search = "";
        }
        if (cateId == null) {
            cateId = "";
        }
        if (pFrom == null || pFrom.isEmpty()) {
            pFrom = "0";
        }
        if (pTo == null || pTo.isEmpty()) {
            pTo = String.valueOf(Double.MAX_VALUE);
        }
        // Call DAO
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> plist = dao.getProductByFilter(search, cateId, pFrom, pTo, sortBy, "", pageNumber, pageSize);
        int totalProducts = dao.getTotalProduct(search, cateId, pFrom, pTo);
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        ArrayList<Category> clist = dao.getAllCate();
        request.setAttribute("clist", clist);
        request.setAttribute("plist", plist);

        request.setAttribute("search", search);
        request.setAttribute("cateId", cateId);
        request.setAttribute("pFrom", pFrom);
        request.setAttribute("pTo", pTo);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("sortDir", sortDir);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
