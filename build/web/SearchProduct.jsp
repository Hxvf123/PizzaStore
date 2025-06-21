<%@page import="Models.DTO.Product"%>
<%@page import="Models.DAO.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Product Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .header {
                background-color: #004aad;
                padding: 10px 20px;
            }

            .header a {
                color: white;
                margin: 0 10px;
                text-decoration: none;
            }

            h3 {
                padding: 10px;
            }


            table {
                width: 80%;
                margin: auto;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: center;
            }
            img {
                width: 100px;
                height: 100px;
            }
            h1 {
                text-align: center;
                color: blue;
            }
            .btn {
                padding: 5px 10px;
                margin: 5px;
                background-color: #004aad;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .btn:hover {
                background-color: #0033ff;
            }
            .message {
                text-align: center;
                color: red;
            }
            .btn-search {
                margin-left: 300px; 

                font-size: 14px;
                padding: 5px 20px;
                background-color: #004aad;
                color: white;
            }
            .btn-back {
                margin-left: 300px; 

                font-size: 14px;
                padding: 5px 20px;
                background-color: #004aad;
                color: white;
            }
            .search-form {
                width: 80%;
                margin: 20px ;

            }
            .card-img-top {
            height: 400px;
            width: 413px;
            object-fit: cover;
            
        }
        </style>
    <div class="header d-flex justify-content-between align-items-center">
        <div>
            <a href="Home.jsp">PizzaStore</a>
            <a href="Home.jsp">Pizzas</a>
            <a href="Home.jsp">Categories</a>
            <a href="Home.jsp">Reviews</a>
            <a href="ViewCart.jsp">ViewCart<c:if test="${cart != null && cart.cart.size() > 0}">(${cart.cart.size()})</c:if></a>
            </div>
            <div>
                <a href="LogoutController">Log Out</a>
            </div>
        </div>
    </head>
    <body>
        <h3>Pizza Menu </h3>

    <%
        ProductDAO dao = new ProductDAO();
        List<Product> productList = null;
        try {
            productList = dao.getAllProducts();
            request.setAttribute("productList", productList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <div class="search-form">
        <form class="d-flex justify-content-center flex-column align-items-center" action="SearchProductController" method="post">
            <div class="d-flex mb-2">
                <select class="form-select me-2" name="type" style="width: 200px;">
                    <option value="name">Search by Name</option>
                    <option value="price">Search by Price</option>
                </select>
                <input class="form-control" type="text" name="searchValue" placeholder="Enter search value" 
                       value="${searchValue != null ? searchValue : ''}" required style="width: 300px;">
            </div>
            <input class="btn btn-primary" type="submit" value="Search" name="action"/>
        </form>
    </div>

    <c:set var="productList" value="${requestScope.SearchResult}"/>
    <c:if test="${productList != null}">
        <div class="container">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach var="product" items="${productList}">
                    <div class="col">
                        <div class="card h-100">
                            <img src="${pageContext.request.contextPath}/images/${product.productImage}" 
                                 class="card-img-top" alt="${product.productName}">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <p class="text-primary m-0">$${product.unitPrice}</p>
                                </div>
                                <p class="text-muted">Quantity: ${product.quantity}</p>
                                <p class="card-text">${product.description}</p>
                            </div>
                            <div class="card-footer text-center">
                                <form action="AddCartController" method="post">
                                    <input type="hidden" name="productID" value="${product.productID}">
                                    <input type="hidden" name="productName" value="${product.productName}">
                                    <input type="hidden" name="unitPrice" value="${product.unitPrice}">
                                    <input type="hidden" name="productImage" value="${product.productImage}">
                                    <input type="number" name="quantity" value="1" min="1" max="${product.quantity}" required class="form-control mb-2">
                                    <button type="submit" class="btn btn-primary">Add Pizza</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <a class ="btn" href="Home.jsp">Back</a>
    <c:if test="${empty productList}">
        <p class="message">No products available!</p>
    </c:if>
</body>
</html>
