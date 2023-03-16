<%-- 
    Document   : curriadmin
    Created on : Feb 17, 2023, 12:28:26 AM
    Author     : inuya
--%>

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
                    <h4 class="breadcrumb-title">Decision Add</h4>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" action="" method="post">
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Decision No</label>
                                            <div>
                                                <input class="form-control" type="text" name="decisionNo" value="${decisionNo}">
                                                <span class="text-danger">${error}</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Decision Name</label>
                                            <div>
                                                <input class="form-control" type="text" name="name" value="${name}">
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Approved Date</label>
                                            <div>
                                                <input class="form-control" type="date" name="approvedDate" value="${approvedDate}" readonly="">
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Create Date</label>
                                            <div>
                                                <input class="form-control" type="date" name="createDate" value="${createDate}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">File Name</label>
                                            <div>
                                                <input class="form-control" type="text" name="fileName" value="${fileName}">
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Active</label>
                                            <div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" ${isActive ? 'checked' : ''} name="isActive" id="isActive1" value="true">
                                                    <label class="form-check-label" for="isActive1">isActive</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" ${isActive ? '' : 'checked'} name="isActive" id="isActive2" value="false">
                                                    <label class="form-check-label" for="isActive2">deActive</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group col-6"></div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Approved</label>
                                            <div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" ${isApproved ? 'checked' : ''} name="isApproved" id="isApproved1" value="true">
                                                    <label class="form-check-label" for="isActive1">isApproved</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" ${isApproved ? '' : 'checked'} name="isApproved" id="isApproved2" value="false">
                                                    <label class="form-check-label" for="isActive2">deApproved</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-12">
                                            <label class="col-form-label">Note</label>
                                            <div>
                                                <textarea class="form-control" name="note">${note}</textarea>
                                            </div>
                                        </div>


                                        <div class="col-12">
                                            <button type="submit" class="btn">Save changes</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
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