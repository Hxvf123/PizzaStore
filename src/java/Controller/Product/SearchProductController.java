package Controller.Product;

import Models.DAO.ProductDAO;
import Models.DTO.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "SearchProduct.jsp";

        try {
            String action = request.getParameter("action");
            String searchType = request.getParameter("type");
            String searchValue = request.getParameter("searchValue");
            List<Product> productList = null;
            ProductDAO dao = new ProductDAO();

            if ("Search".equalsIgnoreCase(action)) {
                if (searchType != null && searchValue != null && !searchValue.trim().isEmpty()) {
                    if ("name".equalsIgnoreCase(searchType)) {
                        productList = dao.searchByName(searchValue);
                        if (productList == null || productList.isEmpty()) {
                            request.setAttribute("message", "No results found for this name.");
                        } else {
                            request.setAttribute("SearchResult", productList);
                        }
                    } else if ("price".equalsIgnoreCase(searchType)) {
                        try {
                            String[] priceRange = searchValue.split("-");
                            double minPrice = Double.parseDouble(priceRange[0].trim());
                            double maxPrice = Double.parseDouble(priceRange[1].trim());
                            productList = dao.searchByPrice(minPrice, maxPrice);
                            if (productList == null || productList.isEmpty()) {
                                request.setAttribute("message", "No products found within this price range.");
                            } else {
                                request.setAttribute("SearchResult", productList);
                            }
                        } catch (NumberFormatException | ArrayIndexOutOfBoundsException e) {
                            request.setAttribute("message", "Invalid price format. Please enter as 'min-max'.");
                        }
                    } else {
                        request.setAttribute("message", "Invalid search type.");
                    }
                } else {
                    request.setAttribute("message", "Please enter a search value.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Search Product Controller";
    }
}

//        try {
//            String searchType = request.getParameter("searchType"); 
//            String searchValue = request.getParameter("searchValue"); 
//            List<Product> productList = null;
//            ProductDAO dao = new ProductDAO();
//
//            if ("name".equalsIgnoreCase(searchType)) {
//                productList = dao.searchByName(searchValue);
//            } else if ("price".equalsIgnoreCase(searchType)) {
//                try {
//                    String[] priceRange = searchValue.split("-");
//                    double minPrice = Double.parseDouble(priceRange[0].trim());
//                    double maxPrice = Double.parseDouble(priceRange[1].trim());
//                    productList = dao.searchByPrice(minPrice, maxPrice);
//                } catch (NumberFormatException | ArrayIndexOutOfBoundsException e) {
//                    request.setAttribute("message", "Invalid Price");
//                }
//            }
//
//            request.setAttribute("productList", productList);
//            request.getRequestDispatcher("Home.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
//        }
//    }
