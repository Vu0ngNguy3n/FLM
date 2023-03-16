<%-- 
    Document   : login
    Created on : Jan 13, 2023, 11:15:03 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../view/resetpass/resetpass.css"/>
        <title>FLM Login Page</title>
    </head>
    <body>
        <div class="container">
            <div class="login-left">
                <div class="login-header">
                    <h1 style="margin-right: 15px">${title}</h1>
                </div>

                    <form action="${pageContext.request.contextPath}/FLM/resetpass" method="post">
                    <div class="login-form-content">
                        <div class="form-item">
                            <h1>${info}</h1>
                            <label for="email">${mess}</label>
                            <input type="text" name="username" value="${username}">
                        </div>
                        <button type="submit">Send</button>
                    </div>
                </form>
                <br/>
                <div class="signup_link" 
                     style="text-align: center;
                     margin-left: -30%;
                     font-size: 16px;
                     color: #666666;">
                    Already have the account? 
                    <a href="${pageContext.request.contextPath}/FLM/login" 
                       style="color: #2691d9;
                       text-decoration: none;"
                       >Login</a>
                </div>
            </div>
            <div class="login-right">
                <img src="../view/login/fpt.jpg" alt="">
            </div> 
        </div>
    </body>
</html>
