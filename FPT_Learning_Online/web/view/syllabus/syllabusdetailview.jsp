<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <style>
        .nav-link{
            background-color: rgb(260 230 190);

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
            <h3>Syllabus Details</h3>
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th class="col col-sm-2 table-warning">Syllabus ID</th>
                    <td class="col col-sm-10">${sy.getSyllabusid()}</td>

                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">Syllabus Name</th>
                    <td class="col col-sm-10">${sy.getSyllabusname()}</td>

                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">Subject Code</th>
                    <td class="col col-sm-10">${sy.getSubjectcode()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">NoCredit</th>
                    <td class="col col-sm-10">${sy.getNocredit()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">Degree Level</th>
                    <td class="col col-sm-10">${sy.getDegreelevel()}</td>
                </tr> 
                <tr>
                    <th class="col col-sm-2 table-warning">Time Allocation</th>
                    <td class="col col-sm-10">${sy.getTimeallocation()}</td>
                </tr> 
                <tr>
                    <th class="col col-sm-2 table-warning">Pre-Requisite</th>
                    <td class="col col-sm-10">${sy.getPrerequisite()}</td>
                </tr>  
                <tr>
                    <th class="col col-sm-2 table-warning">Description</th>
                    <td class="col col-sm-10">${sy.getDescription()}</td>
                </tr>  
                <tr>
                    <th class="col col-sm-2 table-warning">StudentTasks</th>
                    <td class="col col-sm-10">${sy.getStudenttask()}</td>
                </tr>  
                <tr>
                    <th class="col col-sm-2 table-warning">Tools</th>
                    <td class="col col-sm-10">${sy.getTool()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">Scoring Scale</th>
                    <td class="col col-sm-10">${sy.getScoringscle()}</td>
                </tr> 
                <tr>
                    <th class="col col-sm-2 table-warning">DecisionNo</th>
                    <td class="col col-sm-10">${sy.getDecisionNo()}</td>
                </tr> 
                <tr>
                    <th class="col col-sm-2 table-warning">IsApproved</th>
                    <td class="col col-sm-10">${sy.isIsapproved()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">Note</th>
                    <td class="col col-sm-10">${sy.getNote()}</td>
                </tr>  
                <tr>
                    <th class="col col-sm-2 table-warning">MinAvgMarkToPass</th>
                    <td class="col col-sm-10">${sy.getMinavg()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">IsActive</th>
                    <td class="col col-sm-10">${sy.isIsactive()}</td>
                </tr>
                <tr>
                    <th class="col col-sm-2 table-warning">ApprovedDate</th>
                    <td class="col col-sm-10">${sy.getApprovedate()}</td>
                </tr>
            </table>


            <div class="mt-5">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#material" class="nav-link active war btn-war" data-toggle="tab">Material</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#clo" class="nav-link" data-toggle="tab">CLO</a>
                    </li>
                    <li class="nav-item">
                        <a href="#session" class="nav-link" data-toggle="tab">Session</a>
                    </li>
                    <li class="nav-item">
                        <a href="#question" class="nav-link" data-toggle="tab">Constructive question</a>
                    </li>
                    <li class="nav-item">
                        <a href="#assessment" class="nav-link" data-toggle="tab">Assessment</a>
                    </li>
                </ul>

                <div class="tab-content" >
                    <div class="tab-pane fade show active" id="material">
                        <c:choose>
                            <c:when test="${material.isEmpty()||material==null}">
                                <h5 class="mt-3 text-danger">This syllabus was not update material</h5>
                            </c:when>

                            <c:otherwise>
                                <table class="table table-bordered table-striped table-hover">
                                    <thead class="table-warning">
                                        <tr>
                                            <th scope="col">Material Description</th>
                                            <th scope="col">Author</th>
                                            <th scope="col">Publisher</th>
                                            <th scope="col">PublishedDate</th>
                                            <th scope="col">Edition</th>
                                            <th scope="col">ISBN</th>
                                            <th scope="col">IsMainMaterial</th>
                                            <th scope="col">IsHardCopy</th>
                                            <th scope="col">IsOnline</th>
                                            <th scope="col">Note</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${material}" var="ma">
                                        <tr>
                                            <td>${ma.getMaterialdescription()}</td>
                                            <td>${ma.getAuthor()}</td>
                                            <td>${ma.getPublisher()}</td>
                                            <td>${ma.getPublisheddate()}</td>
                                            <td>${ma.getEdition()}</td>
                                            <td>${ma.getIsbn()}</td>
                                            <td><input type="checkbox" ${ma.isIsmain()?   "checked":""} disabled=""></td>
                                            <td><input type="checkbox" ${ma.isIshard()?   "checked":""} disabled=""></td>
                                            <td><input type="checkbox" ${ma.isIsonline()? "checked":""} disabled=""></td>
                                            <td>${ma.getNote()}</td>
                                        </tr>
                                    </c:forEach>
                                    <tbody>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <div class="tab-pane fade" id="clo">
                        <c:choose>
                            <c:when test="${clo.isEmpty()}">
                                <h5 class="mt-3 text-danger">This syllabus was not update CLO</h5>
                            </c:when>

                            <c:otherwise>
                                <table class="table table-bordered table-striped table-hover">
                                    <thead class="table-warning">
                                        <tr>
                                            <th scope="col">CloId</th>
                                            <th scope="col">CloName</th>
                                            <th scope="col">CloDetails</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${clo}" var="clo">
                                        <tr>
                                            <td>${clo.getCloid()}</td>
                                            <td>${clo.getCloname()}</td>
                                            <td>${clo.getCloDetail()}</td>
                                        </tr>
                                    </c:forEach>
                                    <tbody>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <div class="tab-pane fade" id="session">
                        <div class="tab-pane fade show active">
                            <c:choose>
                                <c:when test="${session.isEmpty()||session==null}">
                                    <h5 class="mt-3 text-danger">This syllabus was not update session</h5>
                                </c:when>

                                <c:otherwise>
                                    <table class="table table-bordered table-striped table-hover">
                                        <thead class="table-warning">
                                            <tr>
                                                <th scope="col">Session</th>
                                                <th scope="col">Topic</th>
                                                <th scope="col">Learning-TeachingType</th>
                                                <th scope="col">LO</th>
                                                <th scope="col">ITU</th>
                                                <th scope="col">Material</th>
                                                <th scope="col">S-Download</th>
                                                <th scope="col">StudentTask</th>
                                                <th scope="col">URLs</th>
                                            </tr>
                                        </thead>
                                        <c:forEach items="${session}" var="ses">
                                            <tr>
                                                <td>${ses.getSessions()}</td>
                                                <td>${ses.getTopic()}</td>
                                                <td>${ses.getLearntype()}</td>
                                                <td>${ses.getLo()}</td>
                                                <td>${ses.getItu()}</td>
                                                <td>${ses.getMaterial()}</td>
                                                <td>${ses.getDown()}</td>
                                                <td>${ses.getTask()}</td>
                                                <td>${ses.getUrl()}</td>
                                            </tr>
                                        </c:forEach>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                    
                    <div class="tab-pane fade" id="question">
                        <div class="tab-pane fade show active">
                            <c:choose>
                                <c:when test="${ques.isEmpty()||ques==null}">
                                    <h5 class="mt-3 text-danger">This syllabus was not update contructive question</h5>
                                </c:when>

                                <c:otherwise>
                                    <table class="table table-bordered table-striped table-hover">
                                        <thead class="table-warning">
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col">SessionNo</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Detail</th>
                                                
                                            </tr>
                                        </thead>
                                        <c:forEach items="${ques}" var="ques">
                                            <tr>
                                                <c:set var="v" value="${v}"/>
                                                <td>${v+1}</td>
                                                <td>${ques.getSessionno()}</td>
                                                <td>${ques.getName()}</td>
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
                    </div>
                    
                    <div class="tab-pane fade" id="assessment">
                        <div class="tab-pane fade show active">
                            <c:choose>
                                <c:when test="${a.isEmpty()||a==null}">
                                    <h5 class="mt-3 text-danger"> This syllabus was not update contructive question</h5>
                                </c:when>

                                <c:otherwise>
                                    <table class="table table-bordered table-striped table-hover">
                                        <thead class="table-warning">
                                            <tr>
                                                <th scope="col">Category</th>
                                                <th scope="col">Type</th>
                                                <th scope="col">Part</th>
                                                <th scope="col">Weight</th>
                                                <th scope="col">Completion Criteria</th>
                                                <th scope="col">Duration</th>
                                                <th scope="col">CLO</th>
                                                <th scope="col">Question Type</th>
                                                <th scope="col">No Question</th>
                                                <th scope="col">Knowledge and Skill</th>
                                                <th scope="col">Grading Guide</th>
                                                <th scope="col">Note</th>
                                                
                                                
                                            </tr>
                                        </thead>
                                        <c:forEach items="${a}" var="a">
                                            <tr>
                                                <td>${a.getCategory()}</td>
                                                <td>${a.getType()}</td>
                                                <td>${a.getPart()}</td>
                                                <td>${a.getWeight()}</td>
                                                <td>${a.getCriteria()}</td>
                                                <td>${a.getDuration()}</td>
                                                <td>${a.getClo()}</td>
                                                <td>${a.getQuestiontype()}</td>
                                                <td>${a.getNoquesiton()}</td>
                                                <td>${a.getSkill()}</td>
                                                <td>${a.getGuide()}</td>
                                               <td>${a.getNote()}</td>
                                            </tr>
                                        </c:forEach>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                    
                    
                </div>
            </div>
    </body>
    <script src="../view/assets/js/jquery.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="../view/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
</html>

