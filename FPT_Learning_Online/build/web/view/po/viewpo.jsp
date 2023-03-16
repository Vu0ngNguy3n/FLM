<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Path</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <style>
        .nav-link{
            background-color: rgb(255 238 186);
        }
    </style>
    <%@include file="../navigator/header.jsp" %>
    <body id="bg">
        <div class="container " style="margin-top:155px">
            <h3>Po management</h3>

            <c:forEach var="c" items="${plolist}" begin="0" end="0">
                <table class="table table-bordered table-striped table-hover">
                    <tr>
                        <td class="col col-sm-2 table-warning">Curriculum Code</td>
                        <td class="col col-sm-10">${c.curriculumCode}</td>
                    </tr>
                    <tr>
                        <td class="col col-sm-2 table-warning">Name</td>
                        <td class="col col-sm-10">${c.nameEn}</td>
                    </tr>
                </table>
            </c:forEach>
            <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                <div class="row justify-content-end mr-1 ml-1"> 
                    <button class="add btn btn-outline-primary  mb-2 " >
                        <i class="fa-solid fa-plus mr-1"></i>
                        <c:forEach items="${polist}" var="c" begin="0" end="0">
                            <a href="${pageContext.request.contextPath}/FLM/po/insert?cid=${c.curriculumId}">Add PO</a>
                        </c:forEach>
                    </button>
                    <button class="add btn btn-outline-primary  mb-2 " style="margin-left: 5px">
                        <i class="fa-solid fa-plus mr-1"></i>
                        <a href="#">Add PLO</a>
                    </button>

                </div>
            </c:if>
            <div class=" mb-3">
                <div class="tab-content" >
                    <div class="tab-pane fade show active" id="plo">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="table-warning">
                                <tr>
                                    <th scope="col">PO ID</th>
                                    <th scope="col">PO Name</th>
                                    <th scope="col">PO Descrioption</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>

                            <c:forEach items="${polist}" var="c" >
                                <tr >
                                    <th>${c.po.poId}</th>
                                    <td> ${c.po.poName}</td>
                                    <th>${c.po.poDecription}</th>
                                        <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                                        <td>
                                            <a href="${pageContext.request.contextPath}/FLM/po/edit?poid1=${c.po.poId}"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach> 

                            <thead class="table-warning">
                                <tr>
                                    <th scope="col">PLO ID</th>
                                    <th scope="col">PLO Name</th>
                                    <th scope="col">PLO Descrioption</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <br/>
                            <c:forEach items="${plolist}" var="c" >
                                <tr id=>
                                    <th>${c.plo.ploid}</th>
                                    <th>${c.plo.ploname}</th>
                                    <td>${c.plo.plodescription}</td>
                                    <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                                        <td>
                                            <a href="#"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach> 
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



    </body>
    <script src="../view/assets/js/jquery.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
</html>

