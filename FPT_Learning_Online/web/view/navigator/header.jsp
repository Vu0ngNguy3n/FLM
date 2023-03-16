<%-- 
    Document   : header
    Created on : Feb 3, 2023, 12:23:47 AM
    Author     : l
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="<%= request.getContextPath() %>/view/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/view/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>FLM: FPT Learning Material</title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/css/color/color-1.css">

        <!-- REVOLUTION SLIDER CSS ============================================= -->

        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/assets/vendors/revolution/css/navigation.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- REVOLUTION SLIDER END -->	
    </head>

    <body id="bg" >
        
        <div class="page-wraper">
            <!--<div id="loading-icon-bx"></div>-->
            <!-- Header Top ==== -->
            <header class="header rs-nav" style="position: fixed; top: 0;width: 100%;">
                <div class="top-bar">
                    <div class="container">
                        <div class="row d-flex justify-content-between">
                            <div class="topbar-left">
                                <ul>
                                    <li><a href="#"><i class="fa fa-phone"></i> (024) 7300 5588</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i> truyensinh.hanoi@fpt.edu.vn</a></li>
                                </ul>
                            </div>
                            <div class="topbar-right">
                                <ul>

                                    <c:if test="${(account eq null) and (user eq null)}">
                                        <li><a href="${pageContext.request.contextPath}/FLM/login">Login</a></li>
                                        <li><a href="${pageContext.request.contextPath}/FLM/signup">Register</a></li>
                                        </c:if>
                                        <c:if test="${(account ne null) or (user ne null)}">
                                        
                                        <a href="${pageContext.request.contextPath}/FLM/profile"><i class="fa fa-user fa-lg"> 
                                            </i> Hello, 
                                            <c:if test="${account ne null}">
                                                ${account.fullname}
                                            </c:if>
                                            <c:if test="${user ne null}">
                                                ${user.getEmail()}
                                            </c:if></a>
                                            
                                        <a href="${pageContext.request.contextPath}/FLM/logout" class="btn " style="margin-left: 15px">Log Out</a>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sticky-header navbar-expand-lg">
                    <div class="menu-bar clearfix">
                        <div class="container clearfix">
                            <!-- Header Logo ==== -->
                            <div class="menu-logo">
                                <a href="${pageContext.request.contextPath}/FLM/home"><img src="../view/homepage/fpt.png" alt=""></a>
                            </div>
                            <!-- Mobile Nav Button ==== -->
                            <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- Author Nav ==== -->
                            <div class="secondary-menu">
                                <div class="secondary-inner">
                                    <ul>
                                        <li><a href="https://www.facebook.com/DaihocFPTHaNoi" class="btn-link"><i class="fa-brands fa-facebook-f"></i></a></li>
                                        <li><a href="https://hanoi.fpt.edu.vn/" class="btn-link"><i class="fa-brands fa-google"></i></a></li>


                                        <!-- Search Button ==== -->
                                        <li class="search-btn"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Search Box ==== -->
                            <div class="nav-search-bar">
                                <form action="#">
                                    <input name="search"  type="text" class="form-control" placeholder="Type to search">
                                    <span><i class="ti-search"></i></span>
                                </form>
                                <span id="search-remove"><i class="ti-close"></i></span>
                            </div>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="#"><img src="<%= request.getContextPath() %>/view/navigator/fpt.jpg" alt="alt"/></a>
                                </div>
                                <div class="menu-logo">
                                    <a href="#"><img src="../view/navigator/fpt.jpg" alt="alt"/></a>
                                </div>
                                <ul class="nav navbar-nav">	

                                    <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/curriculum">Curriculum Search <i style="font-size: 100%;" class="fa-solid fa-book"></i></a

                                    </li>
                                    <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/syllabus">Syllabus Search<i style="font-size: 100%;" class="fa-solid fa-school"></i> </a>
                                    </li>

                                    <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/learningpath">Learning Path<i style="font-size: 100%;" class="fa-solid fa-graduation-cap"></i></a
                                        
                                    </li>
                                    <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/prerequisite">Pre-Requisite<i style="font-size: 100%;" class="fa-sharp fa-solid fa-chalkboard-user"></i></a>
                                    </li>
                                    <!--                                    them phan currriculum detail va syllabus detail cua manager-->
<!--                                    <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/curriculumdetail">Curriculum Detail</a>
        </li>
        <li class="add-mega-menu"><a href="<%=request.getContextPath() %>/FLM/syllabusdetail">Syllabus Detail</a>
        </li>-->
                                    <c:if test="${(account ne null) and (account.getRole().getRoleid() == 1)}">
                                        <li class="add-mega-menu" ><a  href="<%=request.getContextPath() %>/FLM/dashboard">MANAGEMENT <i class="fa fa-chevron-down"></i></a>
<!--                                            <ul class="sub-menu">
                                                
                                                        <li><a href="${pageContext.request.contextPath}/FLM/userlist">Users Management </a></li>
                                                        <li><a href="#">Google Login Manage</a></li>
                                                    
                                                <li><a href="<%=request.getContextPath() %>/FLM/po">PO</a></li>
                                                <li><a href="<%=request.getContextPath() %>/FLM/dashboard">DASHBOARD</a></li>
                                            </ul>-->
                                        </li>
                                    </c:if>


                                </ul>
                                <div class="nav-social-link">
                                    <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                                    <a href="javascript:;"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </div>
                            <!-- Navigation Menu END ==== -->
                        </div>
                    </div>
                </div>
            </header>
            <!-- Header Top END ==== -->
    </body>
</html>
