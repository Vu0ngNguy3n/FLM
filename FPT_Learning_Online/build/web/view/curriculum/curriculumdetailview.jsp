<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <style>
        .nav-link{
            background-color: rgb(255 238 186);

        }
    </style>
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Path</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>

    <%@include file="../navigator/header.jsp" %>
    <body id="bg">
        <div class="container " style="margin-top:155px">
            <h3>Curriculum Details</h3>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <td class="col col-sm-2 table-warning">CurriculumCode</td>
                    <td class="col col-sm-10">${c.getCurriculumCode()}</td>
                </tr>
                <tr>
                    <td class="col col-sm-2 table-warning">Name</td>
                    <td class="col col-sm-10">${c.getNameEn()}</td>

                </tr>
                <tr>
                    <td class="col col-sm-2 table-warning">Description</td>
                    <td class="col col-sm-10">${c.getDecription()}</td>
                </tr> 
                <tr>
                    <td class="col col-sm-2 table-warning">DecisionNo</td>
                    <td class="col col-sm-10">${c.getDecisionNo()}</td>
                </tr>
                <tr>
                    <td class="col col-sm-2 table-warning"></td>
                    <td class="col col-sm-10">
                        <a href="${pageContext.request.contextPath}/FLM/combolist?curriculumId=${c.curriculumId}" 
                           class="btn btn-primary">View Combo</a>
                        <a href="${pageContext.request.contextPath}/FLM/po/view?cid=${c.curriculumId}" 
                           class="btn btn-primary">View PO</a>
                        <a href="" 
                           class="btn btn-primary">View Elective</a>
                    </td>
                </tr>
            </table>


            <div class="mt-5 mb-3">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#plo" class="nav-link active war btn-war" data-toggle="tab">PLO</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#subject" class="nav-link" data-toggle="tab">Subjects</a>
                    </li>

                </ul>

                <div class="tab-content" >
                    <div class="tab-pane fade show active" id="plo">
                        <c:choose>
                            <c:when test="${plo.isEmpty()}">
                                <h5 class="mt-3 text-danger">This curriculumn was not update PLO</h5>
                            </c:when>

                            <c:otherwise>
                                <table class="table table-bordered table-striped table-hover">
                                    <thead class="table-warning">
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">PLO Name</th>
                                            <th scope="col">PLO Descrioption</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${plo}" var="plo">
                                        <tr>
                                            <c:set var="v" value="${v}"/>
                                            <td>${v+1}</td>
                                            <td>${plo.getPloname()}</td>
                                            <td>${plo.getPlodescription()}</td>
                                            <td>${ques.getDetail()}</td> 
                                            <c:set var="v" value="${v+1}"/>
                                        </tr>
                                    </c:forEach>
                                    <tbody>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="tab-pane fade " id="subject">
                        <h5 class="mt-3 text-danger">This curriculum was not update Subject</h5>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <script src="../view/assets/js/jquery.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
</html>

