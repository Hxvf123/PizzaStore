<%-- 
    Document   : DetailProduct
    Created on : Mar 13, 2025, 4:57:11 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Models.DTO.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("LoadAllProductController");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            .header {
                background-color: #004aad;
                padding: 10px 20px;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header a {
                color: white;
                margin: 0 10px;
                text-decoration: none;
            }
            .container {
                width: 50%;
                margin: auto;
                text-align: center;
            }
            .details {
                text-align: left;
                display: inline-block;
            }
            .details p {
                font-size: 18px;
            }
            .details span {
                font-weight: bold;
            }
            .actions {
                margin-top: 20px;
            }
            .actions a {
                text-decoration: none;
                font-size: 18px;
                color: blue;
                font-weight: bold;
            }
            .separator {
                margin: 0 10px;
                font-size: 18px;
                color: black;
            }
            .product-image {
                margin: 20px 0;
            }
            .product-image img {
                width: 200px;
                height: 200px;
                border: 1px solid #ddd;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div>
                <a href="Home.jsp">PizzaStore</a>
                <a href="Home.jsp">Pizzas</a>
                <a href="Home.jsp">Categories</a>
                <a href="Home.jsp">Reviews</a>
            </div>
            <div>
                <span>Admin Page</span>
                <span>Welcome, admin</span>
                <a href="LogoutController">Log Out</a>
            </div>
        </div>


        <div class="container">
            <h2>Product Details</h2>
            <div class="product-image">

                <img src="${pageContext.request.contextPath}/images/${product.productImage}" alt="${product.productName}" />

            </div>
            <div class="details">
                <p><span>Product ID:</span> <%= product.getProductID()%></p>
                <p><span>Product Name:</span> <%= product.getProductName()%></p>
                <p><span>Price:</span> $<%= product.getUnitPrice()%></p>
                <p><span>Quantity:</span> <%= product.getQuantity()%></p>
                <p><span>Description:</span> <%= product.getDescription()%></p>
            </div>
            <div class="actions">
                <a href="UpdateProductController?action=load&productID=<%= product.getProductID()%>">Edit</a>
                <span class="separator">|</span>
                <a href="Admin.jsp">Back to List</a>
            </div>
        </div>

    </body>
</html>
