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
                <h1 style="margin-bottom: 0;">Combo Management</h1>
                <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                    <button class="add btn btn-outline-primary  " ><i class="fa-solid fa-plus mr-1"></i><a href="#">Add</a></button>
                        </c:if>
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
                    <tr>
                        <th>Decision No</th>
                        <td><i>${requestScope.curriculum.decisionNo}</i></td>
                    </tr>
                </tbody>
            </table>
            <hr class="my-5" style="background-color: orange;"/>

            <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                <div class="row justify-content-end mr-1 ml-1"> <button class="add btn btn-outline-primary  mb-2 " ><i class="fa-solid fa-plus mr-1"></i><a href="#">Add</a></button></div>
                        </c:if>


            <table class="table table-bordered mb-5">
                <thead class="table-warning">
                    <tr>
                        <th scope="col">Combo Id</th>
                        <th scope="col">Combo Name Viet Nam</th>
                        <th scope="col">Combo Name English</th>
                            <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                            <th scope="col"></th>
                            </c:if>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.combos}" var="combos">
                        <tr>
                            <th>${combos.comboid}</th>
                            <td><a href="${pageContext.request.contextPath}/FLM/combodetails?comboid=${combos.comboid}">${combos.comboNameVn}</a></td>
                            <td><a href="${pageContext.request.contextPath}/FLM/combodetails?comboid=${combos.comboid}">${combos.comboNameEn}</a></td>
                                <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                                <th scope="col" style="display: flex; justify-content: center;"><button class="edit btn btn-warning"><i class="fa-solid fa-pen-to-square mr-1"></i><a href="#">Edit</a></button></th>
                                </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>




    <%@include file="../navigator/footer.jsp" %> 

</body>
</html>
