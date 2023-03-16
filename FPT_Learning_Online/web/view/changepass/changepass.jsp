<%-- 
    Document   : login
    Created on : Jan 13, 2023, 11:15:03 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../view/changepass/changepass.css"/>
        <title>FLM Login Page</title>
    </head>
    <body>
        <div class="container">
            <div class="login-left">
                <div class="login-header">
                    <h1>Change password</h1>
                </div>
                <form action="../FLM/changepass" method="POST">
                    <div class="login-form-content">

                        <p style="color: greenyellow">${succi}</p>
                        <p style="color: red">${notConfirm}</p>

                        <div class="form-item">
                            <label for="email">Enter Current Password</label>
                            <input type="text"  id="password" name="password" required value="${password}">
                        </div>

                        <div class="form-item">
                            <label for="password">Enter New Password</label>
                            <input type="password"  id="npassword" name="npassword" required value="${npassword}">
                        </div>
                        <div class="form-item">
                            <label for="password">Confirm New Password </label>
                            <input type="password"  id="repassword" name="repassword" required value="${repassword}">
                        </div>
                        
                        <p> <a href="${pageContext.request.contextPath}/FLM/home" style="color:#0062cc ; text-decoration: none">Turn back home</a> </p>
                        <button type="submit">Save</button>
                    </div>

                </form>
            </div> 
            <div class="login-right">
                <img src="../view/login/fpt.jpg" alt="">
            </div> 
        </div>
    </body>
</html>
