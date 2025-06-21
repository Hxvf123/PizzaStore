<%-- 
    Document   : Admin
    Created on : Mar 11, 2025, 2:12:28 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.DAO.ProductDAO" %>
<%@ page import="Models.DTO.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Product Management</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
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

            .create-btn {
                text-decoration: none;
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border-radius: 5px;
            }

            .container {
                width: 100%;
                padding: 20px;
                box-sizing: border-box;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .actions a {
                margin: 0 5px;
                text-decoration: none;
                color: #007bff;
            }

            .actions a:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <div class="header">
            <div>
                <a href="Admin.jsp">PizzaStore</a>
                <a href="Admin.jsp">Pizzas</a>
                <a href="Admin.jsp">Categories</a>
                <a href="Admin.jsp">Reviews</a>
                
            </div>
            <div>
                <span>Admin Page</span>
                <span>Welcome, admin</span>
                <a href="LogoutController">Log Out</a>
            </div>
        </div>


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
        <div class="container">
            <h1>Pizzas</h1>
            <a href="CreateProduct.jsp" class="create-btn">Create New</a>
            <br/><br/>

            <table>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>ImageUrl</th>
                    <th </th>
                </tr>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td>${product.productName}</td>
                        <td>$${product.unitPrice}</td>
                        <td>${product.description}</td>
                        <td>${product.productImage}</td>
                        <td class="actions">
                            <a href="DetailProductController?productID=${product.productID}">Details</a> |
                            <a href="UpdateProductController?action=load&productID=${product.productID}">Edit</a> |
                            <a href="DeleteProductController?productID=${product.productID}" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${not empty message}">
                <p style="color: green">${message}</p>
            </c:if>
        </div>
    </body>
</html>