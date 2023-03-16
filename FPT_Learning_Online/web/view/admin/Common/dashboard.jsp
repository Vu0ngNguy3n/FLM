<%-- 
    Document   : curriadmin
    Created on : Feb 17, 2023, 12:28:26 AM
    Author     : inuya
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href=".error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>FLM Dashboard </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="../assets/js/html5shiv.min.js"></script>
        <script src="../assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="../assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="../assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="../assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <jsp:include page="../Common/heading/heading.jsp"/>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <jsp:include page="../Common/slideBar/left.jsp" />
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">This is Admin System Page !</h4>
                </div>	
                <div class="row">
                    <div class="container d-flex justify-content-center">
                        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel" style="width: 80%">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="https://i1-vnexpress.vnecdn.net/2021/02/20/DH-FPT-4359-1612093890-5647-1613785573.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=gQK2V-7CxACvJ6jG6kmv1Q" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://i1-vnexpress.vnecdn.net/2020/12/17/a-nh-2-vne-jpg-1608192223-9524-1608192324.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=rSJaI6DIZHbxYMdI2O355A" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://thituyensinh.ican.vn/wp-content/uploads/2021/01/1a.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--<div class="ttr-overlay"></div>-->

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
        <script src='../assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="../assets/js/functions.js"></script>
        <script src="../assets/vendors/chart/chart.min.js"></script>
        <script src="../assets/js/admin.js"></script>
        <script src='../assets/vendors/switcher/switcher.js'></script>
        <script>
        </script>
    </body>
</html>