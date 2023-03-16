<%-- 
    Document   : heading
    Created on : 22-02-2023, 22:48:13
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="ttr-header">
    <div class="ttr-header-wrapper">
        <!--sidebar menu toggler start -->
        <div class="ttr-toggle-sidebar ttr-material-button">
            <i class="ti-close ttr-open-icon"></i>
            <i class="ti-menu ttr-close-icon"></i>
        </div>
        <!--sidebar menu toggler end -->
        <!--logo start -->
        <div class="ttr-logo-box">
            <div>
                <a href="home" class="ttr-logo">
                    <img alt="" class="ttr-logo-mobile" src="../assets/images/logo-mobile.png" width="30" height="30">
                    <img alt="" class="ttr-logo-desktop" src="../view/homepage/fpt.png" width="160" height="27" style="height: 60px;">
                </a>
            </div>
        </div>
        <!--logo end -->
        <div class="ttr-header-menu">
            <!-- header left menu start -->
            <ul class="ttr-header-navigation">
                <li>
                    <a href="home" class="ttr-material-button ttr-submenu-toggle">HOME</a>
                </li>

            </ul>
            <!-- header left menu end -->
        </div>
        <div class="ttr-header-right ttr-with-seperator">
            <!-- header right menu start -->
            <ul class="ttr-header-navigation">
                
                <li><p style="    color: white;
                       line-height: 60px;
                       margin-bottom: 0;
                       font-family: auto;">Hello, ${account.fullname}</p></li>
                <li>
                    <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="" src="../assets/images/testimonials/pic3.jpg" width="32" height="32"></span></a>

                    <div class="ttr-header-submenu">
                        <ul>
                            <li><a href="user-profile.html">My profile</a></li>
                            <li><a href="${pageContext.request.contextPath}/FLM/logout">Logout</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <!-- header right menu end -->
        </div>
        <div aria-live="polite" aria-atomic="true" style="position: relative;">
            <div style="position: absolute; right: 2.5rem; top:  5rem;">
                <div id="toasts" class="toast fade " >
                    <div class="toast-header bg-success" >
                        <strong class="mr-auto text-white" >Active: ${message}</strong>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="toast-body" >
                        ${message} Succesfull
                    </div>
                </div>
            </div>
        </div>

        <div id="message" hidden="">${message}</div>
        <%
            session.removeAttribute("message");
        %>
        <!--header search panel start -->
        <div class="ttr-search-bar">
            <form class="ttr-search-form">
                <div class="ttr-search-input-wrapper">
                    <input type="text" name="qq" placeholder="search something..." class="ttr-search-input">
                    <button type="submit" name="search" class="ttr-search-submit"><i class="ti-arrow-right"></i></button>
                </div>
                <span class="ttr-search-close ttr-search-toggle">
                    <i class="ti-close"></i>
                </span>
            </form>
        </div>
        <!--header search panel end -->
    </div>


</header>
