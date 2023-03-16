<%-- 
    Document   : footer
    Created on : Feb 3, 2023, 12:23:51 AM
    Author     : l
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Footer ==== -->
        <footer style="
                bottom: 0;
                left: 0;
                right: 0;
                margin-bottom: 0;">
            <div class="footer-top">
                <div class="pt-exebar">
                    <div class="container">
                        <div class="d-flex align-items-stretch">
                            <div class="pt-logo mr-auto">

                                <a style="width: 30%" href="${pageContext.request.contextPath}/FLM/home"><img src="../view/homepage/fpt.png" alt="" /></a>
                            </div>
                            <div class="pt-social-link">
                                <ul class="list-inline m-a0">
                                    <li><a href="https://www.facebook.com/DaihocFPTHaNoi" class="btn-link"><i class="fa-brands fa-facebook-f"></i></a></li>
                                    <li><a href="https://hanoi.fpt.edu.vn/" class="btn-link"><i class="fa-brands fa-google"></i></a></li>
                                </ul>
                                <a class="btn btn-primary" id="back-to-top" href="#" style="margin-left: 5px;">Back To Top</a>
                            </div>
                            <c:if test="${(account eq null) and (user eq null)}">
                                <div class="pt-btn-join">
                                    <a href="${pageContext.request.contextPath}/FLM/login" class="btn ">Join Now</a>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12 footer-col-4">
                            <div class="widget">
                                <h5 class="footer-title">Sign Up For A FPTer</h5>
                                <p class="text-capitalize m-b20">Know More Information about our school. We hope these information about the FPT Learning material is helpful with every student.</p>

                            </div>
                        </div>
                        <div class="col-12 col-lg-5 col-md-7 col-sm-12">
                            <div class="row">
                                <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                    <div class="widget footer_widget">
                                        <h5 class="footer-title">School</h5>
                                        <ul>
                                            <li><a href="">Home</a></li>
                                            <li><a href="https://www.facebook.com/icpdp.hn">ICPDP</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                    <div class="widget footer_widget">
                                        <h5 class="footer-title">Curriculum</h5>
                                        <ul>
                                            <li><a href="<%=request.getContextPath() %>/FLM/curriculum">Search</a></li>
                                            <li><a href="<%=request.getContextPath() %>/FLM/curriculum">Show List</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-4 col-lg-4 col-md-4 col-sm-4">
                                    <div class="widget footer_widget">
                                        <h5 class="footer-title">Syllabus</h5>
                                        <ul>
                                            <li><a href="<%=request.getContextPath() %>/FLM/syllabus">Overview</a></li>
                                            <li><a href="<%=request.getContextPath() %>/FLM/syllabus">Search</a></li>
                                            <li><a href="<%=request.getContextPath() %>/FLM/syllabus">List</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 col-md-5 col-sm-12 footer-col-4">
                            <div class="widget footer_widget">
                                <h5 class="footer-title">Contact</h5>
                                <ul class="magnific-image">

                                    <li ><a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+H%E1%BB%8Dc+FPT/@21.0115292,105.5246874,16z/data=!4m5!3m4!1s0x31345b465a4e65fb:0xaae6040cfabe8fe!8m2!3d21.0132505!4d105.5270639" class="btn-link"><i class="fa fa-home" > </i>Hoa Lac, Thach That, Ha Noi</a></li>
                                    <li><a href="javascript:;"><i class="fa fa-envelope-o"></i> truyensinh.hanoi@fpt.edu.vn</a></li>
                                    <li><a href="faq-1.html"><i class="fa fa-phone"></i> (024) 7300 5588</a></li>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 text-center"><a target="_blank" href="https://daihoc.fpt.edu.vn/">FPT Education</a></div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer END ==== -->
        <button class="back-to-top fa fa-chevron-up" ></button>
    </div>

    <!-- External JavaScripts -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="../assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="../assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
    <script src="../assets/vendors/magnific-popup/magnific-popup.js"></script>
    <script src="../assets/vendors/counter/waypoints-min.js"></script>
    <script src="../assets/vendors/counter/counterup.min.js"></script>
    <script src="../assets/vendors/imagesloaded/imagesloaded.js"></script>
    <script src="../assets/vendors/masonry/masonry.js"></script>
    <script src="../assets/vendors/masonry/filter.js"></script>
    <script src="../assets/vendors/owl-carousel/owl.carousel.js"></script>
    <script src="../assets/js/functions.js"></script>
    <script src="../assets/js/contact.js"></script>
    <script src='../assets/vendors/switcher/switcher.js'></script>
</body>

</html>
