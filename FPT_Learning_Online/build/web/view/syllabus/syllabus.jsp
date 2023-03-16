<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Syllabus Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>

    <%@include file="../navigator/header.jsp" %>
    <body id="bg">
        <div class="container" style="margin-top: 155px">
            <h3>Syllabus Management</h3>
            <div class="mb-4">
                <form action="${pageContext.request.contextPath}/FLM/syllabus" method="post">
                    <div class="input-group input-group-sm">

                        <table class="auto-style1 mb-3">
                            <tbody><tr>
                                    <th class="auto-style13" style="text-align: right">Search by Subject:	

                                    </th>
                                    <td class="auto-style10">
                                        <div class="form-inline">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter Subject Code OR Name..." name="txt" style=width:500px;>
                                                </span>
                                                <div class="input-group-append">
                                                    <button type="submit" name="chon" class="btn btn-secondary btn-number">
                                                        <i class="fa fa-search"></i>
                                                    </button>       
                                                </div>
                                            </div>
                                    </td>
                                </tr>
                            </tbody></table>


                    </div>
            </div>
        </form>    
    </div>
    <div class="container mt-5">
        <c:choose>

            <c:when test="${list.isEmpty()||list==null}">
                <h5>${message}</h5>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-info">
                        <tr>
                            <th scope="col"> Syllabus ID</th>
                            <th scope="col">Subject Code</th>
                            <th scope="col">Subject Name</th>
                            <th scope="col">Syllabus Name</th>
                            <th scope="col">IsApproved</th>
                            <th scope="col">IsActive</th>
                            <th scope="col">DecisionNo MM/dd/yyyy</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${list}" var="o">
                            <tr>
                                <td>${o.getSyllabusId()}</td>
                                <th>${o.getSubjectCode()}</th>
                                <td>${o.getSyllabusNameEn()}</td>
                                <td><a href="#">${o.getSyllabusNameVn()}</a></td>
                                <td><input type="checkbox" <c:if test="${o.isActive}">checked</c:if> disabled=""></td>
                                <td><input type="checkbox" <c:if test="${o.isApproved}">checked</c:if> disabled=""></td>
                                <th><a href="#">${o.getDecisionNo()}</a></th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>

</html>

