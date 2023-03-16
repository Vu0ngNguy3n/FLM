<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>FLM Sign Up</title>
        <!-- Mobile Specific Metas -->
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
            />
        <!-- Font-->
        <link rel="stylesheet" type="text/css" href="../view/guest/css/opensans-font.css" />
        <link
            rel="stylesheet"
            type="text/css"
            href="../view/guest/fonts/line-awesome/css/line-awesome.min.css"
            />
        <!-- Jquery -->
        <link
            rel="stylesheet"
            href="https://jqueryvalidation.org/files/demo/site-demos.css"
            />
        <link rel="stylesheet" href="../view/toast/toast.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
        <!-- Main Style Css -->
        <link rel="stylesheet" href="../view/guest/signup1.css" />
    </head>
    <body class="form-v7">
        <div class="page-content">
            <div class="form-v7-content">
                <c:if test="${(requestScope.statusEmail eq  true) or (requestScope.statusUser eq true)}">
                    <input type="hidden" id="login"  value=${true}>
                </c:if>
                <div id="success-toast" class="toast hide">
                    <div class="toast-header" style="background-color: #FDA769">
                        <strong class="mr-auto">FLM Notification</strong>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">
                            &times;
                        </button>
                    </div>
                    <div class="toast-body">
                        <i class="fa-regular fa-circle-check"></i>
                        <c:if test="${requestScope.statusEmail eq true}">
                            Your Email is Exits!!
                        </c:if>
                        <c:if test="${requestScope.statusUser eq true}">
                            Your User is Exits!!
                        </c:if>
                    </div>
                </div>
                <div class="form-left">
                    <img src="../view/guest/images/form-v7.jpg" alt="form" />
                    <p class="text-1">Sign Up</p>
                    <p class="text-2">Privacy policy & Term of service</p>
                </div>
                <form class="form-detail" action="${pageContext.request.contextPath}/FLM/signup" method="POST" id="myform">
                    <div class="form-row">
                        <label for="username">USERNAME</label>
                        <input
                            type="text"
                            name="username"
                            id="username"
                            class="input-text"
                            value="${requestScope.username}"
                            readonly=""
                            />
                    </div>
                    <div class="form-row">
                        <label for="lastname">FULL NAME</label>
                        <input
                            type="text"
                            name="lastname"
                            id="lastname"
                            class="input-text"
                            value="${requestScope.fullname}"
                            readonly=""
                            />
                    </div>  
                    <div class="form-row">
                        <label for="your_email">E-MAIL</label>
                        <input
                            type="text"
                            name="email"
                            id="email"
                            class="input-text"
                            required
                            pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"
                            value="${requestScope.email}"
                            readonly=""
                            />
                    </div>
                    <div class="form-row">
                        <label for="phone">PHONE NUMBER</label>
                        <input
                            type="phone"
                            name="phone"
                            id="phone"
                            class="input-text"
                            pattern="(\+84|0)\d{9,10}" 
                            value="${requestScope.phone}"
                            readonly=""
                            />
                    </div>
                    <input
                        type="hidden"
                        name="password"
                        value="${requestScope.password}"
                        />
                    <div class="form-row">
                        <label for="password">CODE CONFIRM</label>
                        <input
                            type="text"
                            name="confirm"
                            id="confirm"
                            class="input-text"
                            required
                            />
                    </div>

                    <div class="form-row-last d-flex justify-content-around">

                        <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal" style="background-color: orange">
                            Register
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel" style="color: yellowgreen">FLM Notification</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Confirm about this code?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button onclick="submitForm()" class="btn btn-primary">Register</button>
                                    </div>
                                </div>
                            </div>
                        </div>  

                    </div>

                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        <script>
                                            function showToast() {
                                                const successToast = document.getElementById('success-toast');
                                                successToast.classList.remove('hide');
                                                successToast.classList.add('show');
                                                setTimeout(() => {
                                                    successToast.classList.remove('show');
                                                    successToast.classList.add('hide');
                                                }, 3000);
                                            }

                                            var status = document.getElementById('login').value;
                                            if (status !== null) {
                                                showToast();
                                                document.getElementById('login').value = false;
                                            }
        </script>
        <script>
            // just for the demos, avoids form submit
            jQuery.validator.setDefaults({
                debug: true,
                success: function (label) {
                    label.attr("id", "valid");
                },
            });
            $("#myform").validate({
                rules: {
                    email: {
                        required: true,
                        email: true,
                    },
                    phone: {
                        required: true,
                    },
                    password: "required",
                    cpassword: {
                        equalTo: "#password",
                    },
                    username: {
                        required: true,
                    },
                    lastname: {
                        required: true,
                    }
                },
                messages: {
                    username: {
                        required: "Please enter an username",
                    },
                    email: {
                        required: "Please provide an email",
                    },
                    lastname: {
                        required: "Please provide your full name",
                    },
                    phone: {
                        required: "Please provide your phone number",
                    },
                    password: {
                        required: "Please provide a password",
                    },
                    cpassword: {
                        required: "Please provide a password",
                        equalTo: "Not match Password",
                    },
                },
            });
            const form = document.getElementById('myform');
            form.addEventListener('submit', (event) => {
                event.preventDefault();

                Validate();
            });
            function submitForm() {
                document.getElementById('myform').submit()
            }
        </script>
    </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
