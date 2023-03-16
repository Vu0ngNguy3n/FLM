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
        <title>Learning Path</title>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>

    <%@include file="../navigator/header.jsp" %>
    <body>
        <div class="container" style="margin-top:155px; margin-bottom: 9%;">
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


            <div class="mt-5 mb-3">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item ">
                        <a class="nav-link active war btn-war" id="po-link" href="#po" data-toggle="tab" aria-controls="po" >PO</a>
                    </li>
                    <li class="nav-item" style="margin-left: 1px">
                        <a class="nav-link"  data-toggle="tab" id="plo-link" href="#plo" role="tab" aria-controls="plo" >PLO</a>
                    </li>
                    <li class="nav-item" style="margin-left: 1px">
                        <a class="nav-link"  data-toggle="tab" href="#map" role="tab" aria-controls="map" >Mapping POs to PLOs</a>
                    </li>
                </ul>


                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="po" role="tabpanel" >
                        <c:choose>
                            <c:when test="${polist.isEmpty()}">
                                <h5 class="mt-3 text-danger">This curriculumn was not update PaO</h5>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-bordered table-striped table-hover" >
                                    <c:forEach items="${polist}" var="c" >
                                        <c:if test="${c.po.poId == 0}">
                                            This curriculumn was not update PO
                                            <c:set var="hideThead" value="true" />

                                        </c:if>
                                    </c:forEach>
                                    <thead class="table-warning" ${hideThead ? 'style="display:none;"   ' : ''} >
                                        <tr>
                                            <th scope="col">PO ID</th>
                                            <th scope="col">PO Name</th>
                                            <th scope="col">PO Descrioption</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${polist}" var="c">
                                            <c:if test="${c.po.poId != 0}">
                                                <tr>
                                                    <td>${c.po.poId}</td>
                                                    <td>${c.po.poName}</td>
                                                    <td>${c.po.poDecription}</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="tab-pane fade" id="plo" role="tabpanel"  style="margin-top: -24px">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="table-warning">
                                <tr>
                                    <th scope="col">PLO ID</th>
                                    <th scope="col">PLO Name</th>
                                    <th scope="col">PLO Descrioption</th>
                                </tr>
                            </thead>
                            <br/>
                            <c:forEach items="${plolist}" var="c" >
                                <tr id=>
                                    <th>${c.plo.ploid}</th>
                                    <th>${c.plo.ploname}</th>
                                    <td>${c.plo.plodescription}</td>
                                </tr>
                            </c:forEach> 
                        </table>
                    </div>

                    <div class="tab-pane fade" id="map" role="tabpanel">
                        <c:choose>
                            <c:when test="${polist.isEmpty()}">
                                <h5 class="mt-3 text-danger">This curriculumn was not update Mapping</h5>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${polist}" var="c" >
                                    <c:if test="${c.po.poId == 0}">
                                        This curriculumn was not update Mapping
                                        <c:set var="hide" value="true" />
                                    </c:if>
                                </c:forEach>
                                <table class="table table-bordered table-striped table-hover" ${hide ? 'style="display:none;"   ' : ''}>
                                    <thead class="table-warning">

                                        <tr>
                                            <th>PLO(s)</th>
                                                <c:forEach items="${polist}" var="a">
                                                <th>${a.po.poName}</th>
                                                </c:forEach>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${plolist}" var="b">
                                            <tr>
                                                <td>${b.plo.ploname}</td>
                                                <c:forEach items="${polist}" var="a">
                                                    <c:set var="checked" value="false" />
                                                    <c:forEach items="${mapping}" var="p">
                                                        <c:if test="${p.plo.ploid == b.plo.ploid && p.po.poId == a.po.poId}">
                                                            <c:set var="checked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <td><c:if test="${checked}">✓</c:if></td>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <%@include file="../navigator/footer.jsp" %>
</html>


