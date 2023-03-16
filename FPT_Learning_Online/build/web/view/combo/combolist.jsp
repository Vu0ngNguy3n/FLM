<%-- 
    Document   : combolist
    Created on : Feb 28, 2023, 1:30:48 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>User List Management </title>

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
        <link rel="stylesheet" href="../view/toast/toast.css"/>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <title>Combo View</title>
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="../admin/Common/heading/heading.jsp"/>
        <jsp:include page="../admin/Common/slideBar/left.jsp" />
        <jsp:useBean id="curriculumCode" class="dal.CurriculumDBContext"/>
        <main class="ttr-wrapper">
            <div class="db-breadcrumb" style="display: flex; justify-content: center;">
                <h4 >Combo List Management</h4>
            </div>
            <c:if test="${requestScope.add eq  true}">
                <input type="hidden" id="toast" value="${requestScope.add}">
            </c:if>
            <c:if test="${requestScope.update eq  true}">
                <input type="hidden" id="toast" value="${requestScope.update}">
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
                    <c:if test="${requestScope.add eq true}">
                        ${requestScope.comboName} is add successfully!!!
                    </c:if>
                    <c:if test="${requestScope.update eq true}">
                        ${requestScope.comboName} is update successfully!!!
                    </c:if>
                </div>
            </div>
            <div class="mb-4 ml-5">
                <form action="${pageContext.request.contextPath}/FLM/comboview" method="post">                                      
                    <div class="input-group input-group-sm">
                        <table class="auto-style1 mb-3">
                            <tbody><tr>
                                    <th class="auto-style13" style="text-align: right">Search by ComboId/ComboName:                                     
                                    </th>                  
                                    <td class="auto-style10">
                                        <div class="form-inline">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter ID OR ComboName..." name="comboSearch" style=width:500px;>
                                                </span>                                                
                                                <div class="input-group-append">
                                                    <button type="submit" name="chon" class="btn btn-secondary btn-number" style="background-color: orange; border-color: orange;">
                                                        <i class="fa fa-search" ></i>
                                                    </button>       
                                                </div>
                                            </div>
                                    </td>
                                </tr>
                            </tbody></table>


                    </div>
                </form>
            </div>
            <div class="row justify-content-between mr-1 ml-1">
                <c:if test="${requestScope.pages eq 0}">
                    <h5 style="color: orange;">No Combo Can Be Found!!!</h5>
                </c:if>
                <c:if test="${requestScope.pages ne 0}">
                    <h5 style="color: orange;">Have ${requestScope.pages} result!!!</h5>
                </c:if>
                <button class="add btn btn-outline-warning   mb-2 " style="color: white; background-color: orange;" >
                    <i class="fa-solid fa-plus mr-1"></i><a href="${pageContext.request.contextPath}/FLM/combochange?status=1" style="text-decoration: none; color: white">Add New Combo</a>
                </button>
            </div>

            <table class="table table-bordered mb-5">
                <thead class="table-warning">
                    <tr>
                        <th scope="col">ComboID</th>
                        <th scope="col">Combo Name <a href="${pageContext.request.contextPath}/FLM/comboview?comboSearch=${requestScope.comboSearch}&sort=${!requestScope.sort}"><i class="fa-solid fa-sort"></i></a></th>
                        <th scope="col" style="width: 12%">Curriculum ID </th>
                        <th scope="col">Subjects</th>
                        <th scope="col">Management</th>

                    </tr>
                </thead>
                <tbody id='content'>
                    <c:forEach items="${requestScope.combos}" var="combo" varStatus="index" >
                        <c:if test="${index.index <10}">
                            <tr class="numrow">
                                <td>${combo.comboid}</td>
                                <td><p>${combo.comboNameVn}</p></td>
                                <td>${curriculumCode.curriculumCode(combo.curriculumId)}</td>
                                <td>
                                    <ul style="list-style-type: none">
                                        <c:forEach items="${combo.subjects}" var="subject">
                                            <li style="font-size: 16px">
                                                ${subject.subjectCode}
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </td>
                                <td>
                                    <button class="add btn btn-outline-warning   mb-2 " style="color: white; background-color: orange;" >
                                        <i class="fa-solid fa-plus mr-1"></i><a href="${pageContext.request.contextPath}/FLM/combochange?status=0&comboId=${combo.comboid}" style="text-decoration: none; color: white">Edit</a>
                                    </button>
                                </td>
                            </tr>
                        </c:if>


                    </c:forEach>

                </tbody>
            </table>
            <nav aria-label="...">
                <ul class="pagination">
                    <c:forEach var="i" end="${requestScope.pages/10}" begin="0">
                        <li class="page-item"><a class="page-link" onClick="LoadMore(${i})">${i+1}</a></li>
                        </c:forEach>

                </ul>
            </nav>
        </main>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"
    ></script>
    <script >
                            function LoadMore(index) {
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/FLM/loadmorecombo",
                                    type: 'GET',
                                    data: {
                                        num: index,
                                        comboSearch: '${requestScope.comboSearch}',
                                        sort: '${requestScope.sort}'
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("content");
                                        row.innerHTML = data;
                                    },
                                    error: function (xhr) {

                                    }
                                });

                            }
    </script>
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

        var status = document.getElementById('toast').value;
        if (status !== null) {
            showToast();
            document.getElementById('toast').value = false;
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
</html>
