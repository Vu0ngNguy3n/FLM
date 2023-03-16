<%-- 
    Document   : combo
    Created on : Feb 17, 2023, 9:15:44 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Combo List</title>
    </head>
    <body>
        <%@include file="../navigator/header.jsp" %>
        <div class="container" style="margin-top: 160px; ">
            <div class="row justify-content-between mr-1 ml-1" >
                <h1 style="margin-bottom: 0;">Elective Management</h1>

            </div>


            <hr class="my-5" style="background-color: orange;"/>

            <table class="table table-bordered mb-5">

                <tbody>
                    <tr>
                        <th>Curriculum ID</th>
                        <td><i>${requestScope.curriculum.curriculumId}</i></td>
                    </tr>
                    <tr>
                        <th>Curriculum Code</th>
                        <td><i>${requestScope.curriculum.curriculumCode}</i></td>
                    </tr>
                    <tr>
                        <th>Curriculum Name</th>
                        <td><i>${requestScope.curriculum.nameEn}</i></td>
                    </tr>
                </tbody>
            </table>
            <hr class="my-5" style="background-color: orange;"/>



            <table class="table table-bordered mb-5">
                <thead class="table-warning">
                    <tr>
                        <th scope="col">Elective Id</th>
                        <th scope="col">Elective Name </th>
                        <th scope="col">Subject</th>

                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.electives}" var="elective">
                        <tr>
                            <th>${elective.electiveId}</th>
                            <td>${elective.electiveNameVn}</td>      
                            <td><a href="${pageContext.request.contextPath}/FLM/electivedetail?electiveId=${elective.electiveId}">${elective.electiveNameVn}</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>




    <%@include file="../navigator/footer.jsp" %> 

</body>
</html>
