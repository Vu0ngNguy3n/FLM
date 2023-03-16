<%-- 
    Document   : left
    Created on : 22-02-2023, 22:49:42
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="ttr-sidebar">
    <div class="ttr-sidebar-wrapper content-scroll">
        <!-- side menu logo start -->
        <div class="ttr-sidebar-logo" style="display: flex; justify-content: end">
            <!--<a href="#"><img alt="" src="../view/homepage/fpt1.png" width="122" height="27" style="margin-top: -16px; height: 60px;"></a>-->
            <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                    <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                    <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
            </div> -->
            <div class="ttr-sidebar-toggle-button">
                <i class="ti-arrow-left"></i>
            </div>
        </div>
        <!-- side menu logo end -->
        <!-- sidebar menu start -->
        <nav class="ttr-sidebar-navi" ">
            <ul>
                <li>
                    <a href="dashboard" class="ttr-material-button">
                        <span class="ttr-icon"><i class="ti-home"></i></span>
                        <span class="ttr-label">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-solid fa-users"></i></span>
                        <span class="ttr-label">User Management</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/userlist" class="ttr-material-button"><span class="ttr-label">User List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-sharp fa-solid fa-graduation-cap"></i></span>
                        <span class="ttr-label">Curriculum</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/CurriculumDetails" class="ttr-material-button"><span class="ttr-label">Curriculum List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/addcurriculum" class="ttr-material-button"><span class="ttr-label">Curriculum Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/comboview" class="ttr-material-button"><span class="ttr-label">Combo List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/combochange?status=1" class="ttr-material-button"><span class="ttr-label">CurriculumCombo Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/electiveList" class="ttr-material-button"><span class="ttr-label">Elective List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/electiveView?status=1" class="ttr-material-button"><span class="ttr-label">Elective Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-sharp fa-solid fa-book"></i></span>
                        <span class="ttr-label">Syllabus</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="decisionList" class="ttr-material-button"><span class="ttr-label">Syllabus List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/addsyl" class="ttr-material-button"><span class="ttr-label">Syllabus Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-solid fa-chalkboard"></i></span>
                        <span class="ttr-label">Subject</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/subjectList" class="ttr-material-button"><span class="ttr-label">Subject List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FLM/subjectview?status=1" class="ttr-material-button"><span class="ttr-label">Subject Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-solid fa-chalkboard"></i></span>
                        <span class="ttr-label">PO-PLO Management</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="polist" class="ttr-material-button"><span class="ttr-label">PO List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="poadd" class="ttr-material-button"><span class="ttr-label">PO Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                        <li>
                            <a href="plolist" class="ttr-material-button"><span class="ttr-label">PLO List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="ploadd" class="ttr-material-button"><span class="ttr-label">PLO Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="ttr-material-button">
                        <span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
                        <span class="ttr-label">Decision</span>
                        <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                    </a>
                    <ul>
                        <li>
                            <a href="decisionList" class="ttr-material-button"><span class="ttr-label">Decision List</span><i class="fa-solid fa-list"></i></a>
                        </li>
                        <li>
                            <a href="decisionAdd" class="ttr-material-button"><span class="ttr-label">Decision Add</span><i class="fa-solid fa-plus"></i></a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="${pageContext.request.contextPath}/FLM/sessionlist" class="ttr-material-button">
                        <span class="ttr-icon"><i class="fa-solid fa-chalkboard"></i></span>
                        <span class="ttr-label">Session</span>
                    </a>
                  <!--<a href="${pageContext.request.contextPath}/FLM/subjectview?status=1" class="ttr-material-button"><span class="ttr-label">Subject Add</span><i class="fa-solid fa-plus"></i></a>-->
                     
               
            </ul>
            <!-- sidebar menu end -->
        </nav>
        <!-- sidebar menu end -->
    </div>
</div>
