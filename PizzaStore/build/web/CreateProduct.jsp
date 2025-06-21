<%-- 
    Document   : addProduct
    Created on : Mar 13, 2025
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
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
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
                padding-top: 10px;
            }

            .form-box {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }

            h2 {
                color: #004aad;
                margin-bottom: 20px;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                width: 100px;
                padding: 8px;
                margin: 5px;
                border: none;
                border-radius: 4px;
                background-color: #004aad;
                color: white;
                cursor: pointer;
            }

            button:hover {
                background-color: #003480;
            }

            .back-btn {
                text-decoration: none;
                margin-top: 10px;
            }

            .back-btn:hover {
                text-decoration: none;
            }

            p {
                color: green;
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
                <a href="Orders.jsp">Orders</a>
                <a href="ViewCart.jsp">ViewCart<c:if test="${cart != null && cart.cart.size() > 0}">(${cart.cart.size()})</c:if></a>
            </div>
            <div>
                <span>Admin Page</span>
                <span>Welcome, admin</span>
                <a href="LogoutController">Log Out</a>
            </div>
        </div>
           <br/><br/>
        <div class="container">
            <div class="form-box">
                <h2>Create New Product</h2>
                <form action="AddProductController" method="post">
                    Enter Product ID:
                    <input type="text" name="productID" required/><br/>
                    Enter Product Name:
                    <input type="text" name="productName" required/><br/>
                    Enter Unit Price:
                    <input type="number" name="unitPrice" step="0.01" required/><br/>
                    Enter Quantity:
                    <input type="number" name="quantity" required/><br/>
                    Enter Product Image URL:
                    <input type="text" name="productImage" required/><br/>
                    Enter Description:
                    <input type="text" name="description" required/><br/>
                    <button type="submit">Create</button>
                    <a href="Admin.jsp" class="back-btn"><button type="button">Back</button></a>
                </form>
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>
            </div>
        </div>
    </body>
</html>
