<%-- 
    Document   : signup
    Created on : Jan 13, 2023, 11:31:50 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
              integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ=="
              crossorigin="anonymous" />
        <title>FLM Register</title>
        <link rel="stylesheet" href="../view/guest/sign.css"/>
        <script src="../view/guest/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>

        <div class="container">

            <c:if test="${requestScope.statusUser eq true}">
                <script >//
//                    swal("Sorry!", "Your Username is Exist!!!", "error");
//                </script>
            </c:if>
            <c:if test="${requestScope.statusEmail eq true}">
<!--                <script >
                    swal("Sorry!", "Your Email is Exist!!!", "error");
                </script>-->
            </c:if>
            <div class="header" >
                <h2>Sign Up Form</h2>
            </div>

            <form action="${pageContext.request.contextPath}/FLM/signup" class="form" id="form" method="POST">
                <div class="form-control">
                    <label>User Name</label>
                    <input type="text" name="username" id="username" placeholder="Enter Your User Name" autocomplete="off" 
                           <c:if test="${requestScope.username ne null}"> value="${requestScope.username}"</c:if>>
                           <i class="fas fa-check-circle"></i>
                           <i class="fas fa-exclamation-circle"></i>
                           <small>Error Message</small>
                    </div>

                    <div class="form-control">
                        <label>Full Name</label>
                        <input type="text" name="lastname" id="lastname" placeholder="Enter Your Full Name" autocomplete="off" 
                        <c:if test="${requestScope.fullname ne null}"> value="${requestScope.fullname}"</c:if>>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error Message</small>
                    </div>

                    <div class="form-control">
                        <label>Email</label>
                        <input type="text" name="email" id="email" placeholder="Enter Your Email" autocomplete="off"
                        <c:if test="${requestScope.email ne null}"> value="${requestScope.email}"</c:if>>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error Message</small>
                    </div>

                    <div class="form-control">
                        <label>Phone</label>
                        <input type="number" name="phone" id="phone" placeholder="Enter Your Phone Number" pattern="(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})" autocomplete="off"
                        <c:if test="${requestScope.phone ne null}"> value="${requestScope.phone}"</c:if>>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error Message</small>
                    </div>

                    <div class="form-control">
                        <label>Password</label>
                        <input type="password" name="password" id="password" placeholder="Enter Your Password" autocomplete="off"
                        <c:if test="${requestScope.password ne null}"> value="${requestScope.password}"</c:if>>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error Message</small>
                    </div>

                    <div class="form-control">
                        <label>Confirm Password</label>
                        <input type="password" name="cpassword" id="cpassword" placeholder="Confirm Password" autocomplete="off"
                        <c:if test="${requestScope.cpassword ne null}"> value="${requestScope.cpassword}"</c:if>>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error Message</small>
                    </div>
                    <div class="signup_link" 
                         style="text-align: center;
                         font-size: 16px;
                         color: #666666;">
                        Already have an account? 
                        <a href="${pageContext.request.contextPath}/FLM/login" 
                       style="color: #2691d9;
                       text-decoration: none;"
                       >Login</a>
                </div>
                <input type="submit" value="Submit" class="btn">
            </form>
        </div>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="../view/guest/script.js"></script>
    </body>

</html>
