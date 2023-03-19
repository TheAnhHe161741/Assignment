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
public class ProductList1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get bien tu front-end (productlist.jsp) day ve 
        String search = request.getParameter("search");
        String cateId = request.getParameter("cateId");
        String pFrom = request.getParameter("pFrom");
        String pTo = request.getParameter("pTo");
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
        ArrayList<Product> plist = dao.getProductByFilter(search, cateId, pFrom, pTo, "", "", 1, Integer.MAX_VALUE);

        request.setAttribute("plist", plist);
        ArrayList<Category> clist = dao.getAllCate();
        request.setAttribute("clist", clist);
        // Xu ly Phan Trang 
        int count = dao.count(search, cateId);
        int pageSize = 1;
        int endPage = 0;
        endPage = count / pageSize;
        if (count % pageSize != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);

//        String indexString = request.getParameter("index");
//        int index = Integer.parseInt(indexString);
//        ArrayList<Product> listSearchCount = dao.searchByCount(search, cateId, index, pageSize);
//        request.setAttribute("listSearchCount", listSearchCount);
        request.getRequestDispatcher("productlist_1.jsp").forward(request, response);
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
        processRequest(request, response);
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
