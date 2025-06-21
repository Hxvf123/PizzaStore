<%-- 
    Document   : updateProduct
    Created on : Mar 13, 2025
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }

            .header {
                background-color: #004aad;
                padding: 10px 20px;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                box-sizing: border-box;
                position: absolute;
                top: 0;
            }

            .header a {
                color: white;
                margin: 0 10px;
                text-decoration: none;
            }

            h1 {
                text-align: center;
                color: #004aad;
            }

            .container {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0 15px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button, a.btn-back {
                background-color: #004aad;
                color: white;
                padding: 10px 20px;
                margin: 5px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                cursor: pointer;
            }

            button:hover, a.btn-back:hover {
                background-color: #003080;
            }

            a.btn-back {
                text-align: center;
            }

            p {
                color: green;
                text-align: center;
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
            <h1>Update Product</h1>
            <form action="UpdateProductController" method="post">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="productID" value="${product.productID}" />
                
                Product Name:
                <input type="text" name="productName" value="${product.productName}" required />
                
                Enter Unit Price:
                <input type="number" name="unitPrice" step="0.01" value="${product.unitPrice}" required />
                
                Enter Description:
                <input type="text" name="description" value="${product.description}" required />
                
                Enter Quantity:
                <input type="number" name="quantity" value="${product.quantity}" required />
                
                Enter Image URL:
                <input type="text" name="productImage" value="${product.productImage}" required />
                
                <div style="text-align: center;">
                    <button type="submit">Save</button>
                    <a href="Admin.jsp" class="btn-back">Back</a>
                </div>
            </form>
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
        </div>
    </body>
</html>
