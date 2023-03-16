<%-- 
    Document   : userlist1
    Created on : Feb 26, 2023, 11:18:38 PM
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
            crossorigin="anonymous"/>

    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="../Common/heading/heading.jsp"/>
        <jsp:include page="../Common/slideBar/left.jsp" />

        <main class="ttr-wrapper">
            <div class="db-breadcrumb" style="display: flex; justify-content: center;">
                <h4 >PLO LIST Management</h4>
            </div>	
            <div class="mb-4 ml-5">
                <form action="${pageContext.request.contextPath}/FLM/plolist" method="post">                                      
                    <div class="input-group input-group-sm">
                        <table class="auto-style1 mb-3">

                            <tbody>
                                <tr>
                                    <th class="auto-style13" style="text-align: right">Search by Curriculum ID                                     
                                    </th>                  
                                    <td class="auto-style10">
                                        <div class="form-inline">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter Curriculum ID..." name="plid" style=width:500px;>
                                                </span>                                                
                                                <div class="input-group-append">
                                                    <button type="submit" name="chon" class="btn btn-secondary btn-number" style="background-color: orange; border-color: orange;">
                                                        <i class="fa fa-search" ></i>
                                                    </button>       
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </form>
                <script>
                    function toggleSort() {
                        const sortSpan = document.getElementById("sort-span");
                        if (sortSpan.textContent === "Asc") {
                            sortSpan.textContent = "Sort Mini";
                        } else {
                            sortSpan.innerHTML = "<i class="fas fa - long - arrow - down"></i>";
                        }
                    }
                </script>
                <table class="table table-bordered mb-5">
                    <thead class="table-warning">
                        <tr>
                            <th scope="col"></th>
                            <th scope="col" data-sort-order="asc" id="po-id-header">PLO ID <span id="sort-span" onclick="toggleSort()"> Sort <i class="fas fa-arrows-v"></i></span></th>
                            <th scope="col">PLO Name</th>
                            <th scope="col">PLO Description</th>
                            <th scope="col">Curriculum ID</th>
                            <th scope="col">Manager</th>
                        </tr>
                    </thead>
                    <tbody id='content'>
                        <c:choose>
                            <c:when test="${listplo.isEmpty()||listplo==null}">
                            <h5>${message}</h5>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listplo}" var="s" varStatus="index"> 
                                <tr class="numrow">
                                    <th>${index.index+1}</th>
                                    <th>${s.getPloid()}</th>
                                    <td>${s.getPloname()}</td>
                                    <td>${s.getPlodescription()}</td>
                                    <td>${s.getCurriculumId()}</td>
                                    <td>
                                        <button
                                            type="button"
                                            style="color: white; background-color: orange;border-color: orange;"
                                            class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"
                                            >
                                            <a href="ploedit?ploid1=${s.getPloid()}"> <i class="fa fa-edit"></i></a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <script>

                    // Get the table header and table body elements
                    const poIdHeader = document.getElementById("po-id-header");
                    const tableBody = document.getElementById("content");

                    // Add a click event listener to the PO ID header
                    poIdHeader.addEventListener("click", function () {
                        // Get the current sort order from the data-sort-order attribute
                        const sortOrder = poIdHeader.getAttribute("data-sort-order");

                        // Sort the table rows based on the PO ID column
                        const rows = Array.from(tableBody.children);
                        rows.sort(function (rowA, rowB) {
                            const poIdA = Number(rowA.children[1].textContent);
                            const poIdB = Number(rowB.children[1].textContent);
                            if (sortOrder === "asc") {
                                return poIdA - poIdB;
                            } else {
                                return poIdB - poIdA;
                            }
                        });

                        // Update the data-sort-order attribute and re-render the table rows
                        if (sortOrder === "asc") {
                            poIdHeader.setAttribute("data-sort-order", "desc");

                        } else {
                            poIdHeader.setAttribute("data-sort-order", "asc");
                        }
                        tableBody.innerHTML = "";
                        rows.forEach(function (row) {
                            tableBody.appendChild(row);
                        });
                    });
                </script>
            </div>
        </main>

    </body>
    <script src="../view/profile/script.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"
    ></script>
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

