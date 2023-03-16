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
            <h1>View Elective Details</h1>

            <table class="table table-bordered mb-5 ">

                <thead >
                    <tr>
                        <th scope="col">Elective Subject</th>
                        <th scope="col">${elective.electiveNameVn}</th>
                    </tr>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">${elective.electiveNameVn}</th>
                    </tr>
                    <tr>
                        <th scope="col">Note</th>
                        <th scope="col">${elective.note}</th>
                    </tr>
                </thead>


            </table>

            <hr class="my-5" style="background-color: orange;"/>

            <div class="row justify-content-between mr-1 ml-1">
                <h1 style="margin-bottom: 0;">List Subject Elective</h1>
                
            </div>
            <table class="table table-bordered mb-5">
                <thead class="table-warning">
                    <tr>
                        <th scope="col">Subject Code</th>
                        <th scope="col">Subject Name </th>
                        <th scope="col">Note</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.elective.subjects}" var="elective">
                        <tr>
                            <th>${elective.subjectCode}</th>
                            <th>${elective.subjectNameVn}</th>
                            <th>${requestScope.elective.note}</th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>



        <%@include file="../navigator/footer.jsp" %> 

    </body>
</html>
