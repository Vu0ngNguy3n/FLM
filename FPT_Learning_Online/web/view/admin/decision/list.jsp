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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

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
        <style>
            .sort-btn {
                border: none;
                background-color: transparent;
                cursor: pointer;
                padding: 0;
                margin: 0;
            }

            .sort-btn i {
                margin-left: 5px;
                color: #999;
                transition: color 0.3s ease-in-out;
            }

            .sort-btn.active i {
                color: #000;
            }

        </style>
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
                    <h4 class="breadcrumb-title">Decision List</h4>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title d-flex justify-content-between">
                                <a href="decisionAdd" class="btn " role="button" aria-pressed="true">Add New</a>
                                <form class="form-inline my-2 my-lg-0 float-right" action="" method="post">
                                    <input class="form-control form-row" type="text" name="search" value="${key}" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </div>
                            <div class="widget-inner">

                                <div class="table-responsive mt-4" >
                                    <c:if test="${list.size() == 0 }">
                                        <h3 class="text-center text-danger">Not Found ${key}</h3>
                                    </c:if>
                                    <c:if test="${list.size() > 0 }">
                                        <form action="" name="form1" method="post">
                                            <table class="table">
                                                <caption>List of Decision</caption>
                                                <thead>
                                                    <tr>
                                                        <th   class="text-center">ID <button id="sort" class="sort-btn"><i class="fa fa-sort"></i></button></th>
                                                        <th  class="text-center">Decision No <button id="sort" class="sort-btn"><i class="fa fa-sort"></i></button></th>
                                                        <th  class="text-center">Decision Name <button id="sort" class="sort-btn"><i class="fa fa-sort"></i></button></th>
                                                        <th  class="text-center">Active</th>
                                                        <th  class="text-center">Approved</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${list}" var="item">
                                                        <tr>
                                                            <th scope="row" class="text-center">${item.decisionID}

                                                            </th>
                                                            <td class="text-center">${item.decisionNo}</td>
                                                            <td class="">${item.decisionName}</td>
                                                            <td class="text-center"><i class="fa ${item.isActive ? 'fa-check' : 'fa-times'} ${item.isActive ? 'text-success' : 'text-danger'}"></i></td>
                                                            <td class="text-center"><i class="fa ${item.isApproved ? 'fa-check' : 'fa-times'} ${item.isApproved ? 'text-success' : 'text-danger'}"></i></td>
                                                            <td class="text-center"><a href="decisionDetail?id=${item.decisionID}">View</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item disabled">
                                                        <a class="page-link" href="decisionList?page=${page - 1}${key != null ? '&search=' : ''} ${key != null ? key : ''}">Pre</a>
                                                    </li>
                                                    <c:forEach begin="1" end="${numberOfPage}" var="i">
                                                        <li class="page-item ${page == i ? 'active' : ''}"><a class="page-link" href="decisionList?page=${i}${key != null ? '&search=' : ''} ${key != null ? key : ''}">${i}</a></li>

                                                    </c:forEach>
                                                    <li class="page-item ${page == numberOfPage ? 'disabled' : ''}">
                                                        <a class="page-link" href="decisionList?page=${page + 1}${key != null ? '&search=' : ''} ${key != null ? key : ''}">Next</a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </form>
                                    </c:if>


                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>

        <script>
//            function sort(sort) {
//                let search = document.getElementById('search');
//                document.form1.action = 'decisionList?sort=' + sort + "&search=" + search.value;
//
//            }

        </script>
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                if (document.getElementById('message').innerHTML !== '') {
                    $('.toast').toast('show');
                }
            });
        </script>
    </body>
</html>