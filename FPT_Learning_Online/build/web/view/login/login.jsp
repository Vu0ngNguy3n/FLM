<%-- 
    Document   : login
    Created on : Jan 13, 2023, 11:15:03 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../view/login/login.css"/> 
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <title>FLM Login Page</title>
    </head>
    <body>
        <div class="container">
            <c:if test="${requestScope.active eq false}">
                <script >
                    swal("Sorry!", "Your Account is not Active!", "error");
                </script>
            </c:if>
            <c:if test="${requestScope.success eq false}">
                <script >
                    swal("Sorry!", "Your Username or Password is Invalid!!", "error");
                </script>
            </c:if>
            <c:if test="${requestScope.logout eq true}">
                <script >
                    swal("Congratulations!", "Logout Successfully", "success");
                </script>
            </c:if>
            <div class="login-left">
                <div class="login-header">
                    <h1>Welcome to FPT Learning Material</h1>
                    <p>Please login ti user the platform</p>
                </div>
                <form action="${pageContext.request.contextPath}/FLM/login" method="POST">
                    <div class="login-form-content">
                        <div class="form-item">
                            <label for="email">Enter Username</label>
                            <input type="text" value="${requestScope.username}" id="email" name="username">
                        </div>
                        <div class="form-item">
                            <label for="password">Enter Password</label>
                            <input type="password"  id="password" value="${requestScope.password}" name="password">
                        </div>
                        <div class="form-item">
                            <div class="checkbox">
                                <input type="checkbox" id="rememberMeCheckbox" name="rememberme" >
                                <label for="rememberMeCheckbox" id="checkboxLabel">Remember me</label>

                            </div> 
                        </div>
                        <button type="submit">Sign In</button>
                        <div class="signup_link" 
                             style="text-align: center;
                             margin-left: -30%;
                             font-size: 16px;
                             color: #666666;">
                            Don't have an account? 
                            <a href="${pageContext.request.contextPath}/FLM/signup" 
                               style="color: #2691d9;
                               text-decoration: none;"
                               >Guest</a>
                            <br/>
                            Forgot password? 
                            <a href="${pageContext.request.contextPath}/FLM/resetpass" 
                               style="color: #2691d9;
                               text-decoration: none;"
                               >Reset Password</a>
                        </div>
                    </div>
                    <div class="login-form-footer" style="margin-top: 0">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/FPT_Learning_Online/FLM/googlelogin&response_type=code
                           &client_id=32171747165-moskrbtb5flo4s2cgqangv7qmukphcj3.apps.googleusercontent.com&approval_prompt=force">
                            <img width="30" src="../view/login/google.png" alt="">Google Login
                        </a>
                    </div>
                </form>
            </div> 
            <div class="login-right">
                <img src="../view/login/fpt.jpg" alt="">
            </div> 
        </div>
    </body>
</html>