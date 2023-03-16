<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
 <%@include file="../navigator/header.jsp" %>
    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">          
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Manager Curriculum</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

   
    <body id="bg">       
        <div class="container" style="margin-top: 200px">
            <div class="table-wrapper">

                <h3>Manager Curriculum </h3>

                <div class="mb-4">
                    <form action="${pageContext.request.contextPath}/FLM/curriculumdetail" method="get">                                      
                        <div class="input-group input-group-sm">
                            <table class="auto-style1 mb-3">
                                <tbody><tr>
                                        <th class="auto-style13" style="text-align: right">Search by Curriculum:                                     
                                        </th>                  
                                        <td class="auto-style10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <input  type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter Curriculum Code OR Name..." name="txt" style=width:500px;>
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
                        
                    <div class="row">                  
                        <div class="col-sm-3">                         
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Curriculum</span></a>       					
                        </div>
                    </div>

                <div class="container mt-5">
                    <c:choose>

                        <c:when test="${list.isEmpty()||list==null}">
                            <h5>${message}</h5>

                        </c:when>
                        <c:otherwise>
                            <table class="table table-bordered table-striped  table-hover ">
                                <thead class="table-info">
                                    <tr>
                                        <th scope="col"> </th>
                                        <th scope="col">CurriculumCode</th>
                                        <th scope="col" >Name</th> 
                                        <th scope="col">Description</th>
                                        <th scope="col">DecisionNo</th>
                                        <th scope="col">Total Credit</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="o">
                                    <tr>
                                        <th>${o.getCurriculumId()}</th>
                                        <th>${o.getCurriculumCode()}</th>
                                        <td ><a href="#">  ${o.getNameEn()}  </a></td>  
                                        <td>${o.getDecription()}</td>
                                        <th><a href="#">${o.getDecisionNo()}</a></th>
                                        <td>${o.getTotalCredit()}</td>
                                        <td>
                                            <a href="./edit?curriculumId=${o.curriculumId}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        </td>
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
        <div id="addEmployeeModal" class="modal fade" style="margin-top:155px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addcurriculum" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Curriculum</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>CurriculumCode</label>
                                <input name="codeCurriculum" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="nameCurriculum" type="text" class="form-control" required>
                            </div><div class="form-group">
                               
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" type="text" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <label>DecisionNo</label>
                                <input name="decision" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Total Credit</label>
                                <input name="credit" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="ADD">
                        </div>
  
                    </form>
                </div>
            </div>
        </div>   
                        
    </body>

</html>

