<%-- 
    Document   : insertpo
    Created on : Feb 27, 2023, 3:19:22 AM
    Author     : l
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Po</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <div style="margin-top:120px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="${pageContext.request.contextPath}/FLM/po/insert" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add PO</h4>
                            <h1></h1>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>PO Id</label>
                                <input name="poid" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>PO Name</label>
                                <input name="poName" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>PO Description</label>
                                <input name="poDecription" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Curriculum Id</label>
                                <input name="cid" type="text" class="form-control" value ="${po}" readonly>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Add">
                            <button class="btn btn-default" onclick="goBack()">Back</button>
                            <script>
                                function goBack() {
                                    window.history.back();
                                }
                            </script>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
    <script src="js/manager.js" type="text/javascript"></script>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
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
