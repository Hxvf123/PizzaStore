<%-- 
    Document   : Login
    Created on : Mar 11, 2025, 2:02:56 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login - PizzaStore</title>
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

            .login-container {

                margin-top: 40px;
            }

            .input-group {
                margin-left: 200px; 
                margin-bottom: 10px;
                width: 350px; 
            }

            .error { 
                margin-left: 200px; 
            }
            

            .input-group-text {
                width: 100px; 
            }

            .btn-login {
                margin-left: 300px; 
                
                font-size: 14px;
                padding: 5px 20px;
                background-color: #004aad;
                color: white;
            }


        </style>
    <div class="header d-flex justify-content-between align-items-center">
            <div>
                <a href="#">PizzaStore</a>
                <a href="#">Pizzas</a>
                <a href="#">Categories</a>
                <a href="#">Reviews</a>
            </div>
            <div>
                <a href="Register.jsp">Register</a>
                <a href="Login.jsp">Log in</a>
            </div>
        </div>
    </head>
    
    <body>

        <div class="login-container">
            <h3>Please log in here.</h3>
            <p>Enter your details below</p>
            <form action="LoginController" method="post">
                <c:if test="${not empty errorMessage}">
                    <div class="error">
                        ${errorMessage}
                    </div>
                </c:if>
                <div class="input-group">
                    <span class="input-group-text">Username</span>
                    <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
                </div>
                <div class="input-group">
                    <span class="input-group-text">Password</span>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Login</button>
            </form>
        </div>
    </body>
</html>
