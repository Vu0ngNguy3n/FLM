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

    </head>

    <%@include file="../navigator/header.jsp" %>
    <body id="bg">
        <!-- <div class="page-wraper"> -->

        <!-- <div id="loading-icon-bx"></div> -->
        <!-- Header Top ==== -->
        <div class="container " style="margin-top:155px">
            <h3>A subject is the pre-requisite of</h3>
            <div class="mb-4">
                <form action="${pageContext.request.contextPath}/FLM/prerequisite" method="post">
                    <div class="input-group input-group-sm">
                        <c:choose>
                            <c:when test="${txt==null}">
                                <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter Subject Code..." name="txt">
                            </c:when>
                            <c:otherwise>
                                <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="${txt}" name="txt">
                            </c:otherwise>

                        </c:choose>

                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>    
            </div>
            <c:choose>

                <c:when test="${list.isEmpty()||list==null}">
                    <h5>${message}</h5>
                </c:when>

                <c:otherwise>
                    <table class="table table-bordered ">
                        <thead class="table-warning">
                            <tr>
                                <th scope="col">Syllabus ID</th>
                                <th scope="col">Subject Name</th>
                                <th scope="col">Syllabus Name</th>
                                <th scope="col">DecisionNo MM/dd/yyyy</th>
                                <th scope="col">All subjects learn after</th>
                            </tr>
                        </thead>
                        <c:forEach items="${list}" var="ls">
                            <tr>
                                <th>${ls.getSyllabusID()}</th>
                                <td>${ls.getSubjectName()}</td>
                                <td><a href="#" class="text-primary stretched-link">${ls.getSyllabusName()}</a></td>
                                <td>${ls.getDecision()}</td>
                                <td>
                                        <c:choose>
                                            <c:when test="${ls.getSubjectNeed().isEmpty()}">
                                                <h6>This subject has no corollary</h6>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${ls.getSubjectNeed()}" var="ls2">
                                                    <h6>${ls2.getPre()}</h6>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                        <tbody>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </body>

</html>

