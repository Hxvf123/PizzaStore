/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Product;

import Models.DAO.ProductDAO;
import Models.DTO.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateProductController", urlPatterns = {"/UpdateProductController"})
public class UpdateProductController extends HttpServlet {

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
        String url = "UpdateProduct.jsp";
        String message = "";
        String action = request.getParameter("action");

        try {
            if ("load".equals(action)) {
                String productID = request.getParameter("productID");
                ProductDAO productDao = new ProductDAO();
                Product product = productDao.getProductByID(productID);
                if (product != null) {
                    request.setAttribute("product", product);
                } else {
                    message = "Product not found!";
                }
            } else if ("update".equals(action)) {
                String productID = request.getParameter("productID");
                String productName = request.getParameter("productName");
                double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String productImage = request.getParameter("productImage");
                String description = request.getParameter("description");

                ProductDAO productDao = new ProductDAO();
                Product product = new Product(productID, productName, unitPrice, quantity, productImage, description);

                if (productDao.updateProduct(product)) {
                    message = "Update product successfully!";
                } else {
                    message = "Update product failed!";
                }
            }
        } catch (Exception ex) {
            log("Error at UpdateProductController: " + ex.getMessage());
            message = "An error occurred while updating the product!";
        } finally {
            request.setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
        processRequest(request, response);
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
