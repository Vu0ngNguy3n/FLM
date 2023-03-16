
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Syllabus</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <b><h1> Edit Syllabus</h1></b>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editsyllabus" method="post">
                            <div class="modal-header" >						
                                <h4 class="modal-title">Edit Syllabus</h4>
                             
                                 <li class="nav-item1">
                                <a class="nav-link" href="<%=request.getContextPath() %>/FLM/syllabusdetail"> Back </a>
                            </li>
                            </div>
                             
                            </div>
                                  <div class="modal-body">
                                <div class="form-group">
                                    <label>Syllabus ID</label>
                                    <input value="${cur.syllabusId}" name="syllabusId" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Subject Code</label>
                                    <input value="${cur.subjectCode}" name="sylcode" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Subject Name</label>
                                    <input value="${cur.syllabusNameEn}" name="sylnameEn" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Syllabus Name</label>                                
                                    <textarea name="sylnameVn" class="form-control" required>${cur.syllabusNameVn}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>IsActive</label>
                                     <input value="${cur.isActive}" name="isActive" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>IsApproved</label>                                  
                                     <input value="${cur.isApproved}" name="isApproved" type="text" class="form-control" required>
                                </div>  
                                <div class="form-group">
                                    <label>DecisionNo MM/dd/yyyy</label>                                  
                                     <input value="${cur.decisionNo}" name="decisionNo" type="text" class="form-control" required>
                                </div> 
                            </div>
                                
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    </body>
       <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script> 
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</html>