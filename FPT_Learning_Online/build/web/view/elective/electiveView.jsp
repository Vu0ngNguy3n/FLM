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
        <title>Elective View Management </title>

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
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
            />


    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <jsp:include page="../admin/Common/heading/heading.jsp"/>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <jsp:include page="../admin/Common/slideBar/left.jsp" />
        <!-- Left sidebar menu end -->

        <!--Main container start -->

        <main class="ttr-wrapper">

            <div class="container-fluid">

                <div class="db-breadcrumb">
                    <c:if test="${requestScope.status eq 1}">
                        <h4 class="breadcrumb-title">Combo Add</h4>
                    </c:if>
                    <c:if test="${requestScope.status eq 0}">
                        <h4 class="breadcrumb-title">Combo Edit</h4>
                    </c:if>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="widget-inner">
                                <form class="edit-profile m-b30" action="${pageContext.request.contextPath}/FLM/electiveView" method="post">
                                    <div class="row">
                                        <input type="hidden" name="electiveId" value="${requestScope.elective.electiveId}">
                                        <input type="hidden" name="status" value="${requestScope.status}">
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Elective Name <i style="color: red">*</i></label>
                                            <div>
                                                <input class="form-control" type="text" name="electiveName" id="name" onchange="onSubmit(event)" value="${requestScope.elective.electiveNameVn}" placeholder="Enter Elective Name...">
                                            </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label class="col-form-label">Note</label>
                                            <div>
                                                <input class="form-control" type="text" name="note" value="${requestScope.elective.note}" placeholder="Enter Note...">
                                            </div>
                                        </div>
                                        <div class="form-group col-12">
                                            <label class="col-form-label">Curriculum<i style="color: red">*</i> </label>
                                            <div>
                                                <select class="select"  data-mdb-filter="true" name="curriculum" >
                                                    <c:forEach items="${requestScope.curriculums}" var="curriculum">
                                                        <option value="${curriculum.curriculumId}" 
                                                                <c:if test="${curriculum.curriculumId eq requestScope.curriculumId}">
                                                                    selected=""
                                                                </c:if>
                                                                >${curriculum.curriculumCode}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="form-group col-12">
                                            <div>
                                                <label class="col-form-label">Select Subject<i style="color: red">*</i></label>
                                                <select class="select" multiple data-mdb-filter="true" name="subjects">
                                                    <c:forEach items="${requestScope.subjects}" var="subject">
                                                        <option value="${subject.subjectCode}" 
                                                                <c:forEach items="${requestScope.elective.subjects}" var="subjects">
                                                                    <c:if test="${subjects.subjectCode eq subject.subjectCode}">
                                                                        selected=""
                                                                    </c:if>
                                                                </c:forEach>        
                                                                >${subject.subjectCode}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-12">

                                            <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal" style="background-color: orange"
                                                    <c:if test="${requestScope.status eq 1}">
                                                        <i class="fa-solid fa-plus mr-1"></i>Add Elective
                                                    </c:if>
                                                    <c:if test="${requestScope.status eq 0}">
                                                        <i class="fa-solid fa-floppy-disk mr-2"></i>Save changes
                                                    </c:if>
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel" style="color: yellowgreen">Warning</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <c:if test="${requestScope.status eq 1}">
                                                                Add new Elective <i id="results"></i>
                                                            </c:if>
                                                            <c:if test="${requestScope.status eq 0}">
                                                                Change information of Elective: ${requestScope.elective.electiveNameVn}
                                                            </c:if>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  

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
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
        ></script>
        <script>
            $(document).ready(function () {
                if (document.getElementById('message').innerHTML !== '') {
                    $('.toast').toast('show');
                }
            });
            function onSubmit(event) {
                event.preventDefault()
                var element = document.getElementById('name');
                document.getElementById('results').innerHTML = `${element.value}`
            }
        </script>

    </body>
</html>