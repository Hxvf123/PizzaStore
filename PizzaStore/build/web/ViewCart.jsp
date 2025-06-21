<%-- 
    Document   : ViewCart
    Created on : Mar 10, 2025, 8:53:12 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <style>
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
            img {
                width: 100px;
                height: 100px;
            }
            h2, h3 {
                text-align: center;
                color: blue;
            }
            .btn {
                padding: 5px 10px;
                background-color: #004aad;
                color: white;
                border-radius: 5px;
                text-decoration: none;
            }
            .btn:hover {
                background-color: darkblue;
                 color: white;
            }
            .message {
                text-align: center;
                color: red;
            }
            .btn {
                padding: 5px 10px;
                margin: 5px;
                background-color: #004aad;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
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
        <h2>View your Cart</h2>

        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:if test="${cart != null && cart.items.size() > 0}">
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalPrice" value="0"/>
                    <c:forEach var="item" items="${cart.items}">
                        <c:set var="subtotal" value="${item.value.unitPrice * item.value.quantity}" />
                        <c:set var="totalPrice" value="${totalPrice + subtotal}" />
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/images/${item.value.productImage}" alt="${item.value.productName}" />
                            </td>
                            <td>${item.value.productName}</td>
                            <td>${item.value.description}</td>
                            <td>${String.format('%.2f', item.value.unitPrice)} $</td>
                            <td>
                                <form action="UpdateCartController" method="post">
                                    <input type="hidden" name="productID" value="${item.value.productID}">
                                    <input type="number" name="quantity" value="${item.value.quantity}" min="1">
                                    <input type="submit" value="Update" class="btn">
                                </form>
                            </td>
                            <td>${String.format('%.2f', subtotal)} $</td>
                            <td>
                                <a href="DeleteCartController?productID=${item.value.productID}" onclick="return confirm('Do you want to delete this product?')" class="btn">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3>Total: ${String.format('%.2f', totalPrice)} $</h3>
            
        </c:if>

        <c:if test="${cart == null || cart.items.size() == 0}">
            <h3>Your Cart is empty!</h3>
        </c:if>
        <a class ="btn" href="Home.jsp">Back</a>
    </body>
</html>
