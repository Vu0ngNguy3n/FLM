<%-- 
    Document   : combodetails
    Created on : Feb 17, 2023, 10:31:05 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../navigator/header.jsp" %>

        <div class="container" style="margin-top: 140px;">
            <h1>View Combo Details</h1>

            <table class="table table-bordered mb-5 ">

                <thead >
                    <tr>
                        <th scope="col">Combo Name</th>
                        <th scope="col">${combo.comboNameVn}</th>
                    </tr>
                    <tr>
                        <th scope="col">Note</th>
                        <th scope="col">${combo.note}</th>
                    </tr>
                </thead>


            </table>

            <hr class="my-5" style="background-color: orange;"/>

            <div class="row justify-content-between mr-1 ml-1">
                <h1 style="margin-bottom: 0;">List Subject Combo</h1>
                <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                    <div class="row justify-content-end mr-1 ml-1"> <button class="add btn btn-outline-primary  mb-2 " ><i class="fa-solid fa-plus mr-1"></i><a href="#">Add Subject</a></button></div>

                </c:if>
            </div>
            <table class="table table-bordered mb-5">
                <thead class="table-warning">
                    <tr>
                        <th scope="col">Subject Code</th>
                        <th scope="col">Subject Name Viet Nam</th>
                        <th scope="col">Semester</th>
                        <th scope="col">Note</th>
                            <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                            <th scope="col"></th>
                            </c:if>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.combo.subjects}" var="subject">
                        <tr>
                            <th>${subject.subjectCode}</th>
                            <th>${subject.subjectNameVn}</th>
                            <th>${subject.semester}</th>
                            <th>${requestScope.combo.note}</th>
                                <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                                <th scope="col" style="display: flex; justify-content: center;"><button class="edit btn btn-warning"><i class="fa-solid fa-pen-to-square mr-1"></i><a href="#">Edit</a></button></th>
                                        </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>



        <%@include file="../navigator/footer.jsp" %> 

    </body>
</html>
