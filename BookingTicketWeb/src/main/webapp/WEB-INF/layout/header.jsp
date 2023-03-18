<%-- 
    Document   : header
    Created on : Aug 3, 2022, 1:57:21 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm">
    <div class="container-fluid">
        <a href="<c:url value="/" />" style="margin-left: 80px"><img src="<c:url value="/img/Logo1.png"/>" style=" width: 90%; height: 90px"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto" style="margin-left:350px">
                <li class="nav-item">
                    <c:url value="/" var="action" />
                    <a class="nav-link text-white" href="${action}" style= "font-weight: bold;">TRANG CHỦ</a>
                </li>
                <c:if test="${currentUser.userrole == 'Customer'}">
                <li class="nav-item">
                    <a class="nav-link text-info" href="<c:url value="/coment" />" style="margin-left: 40px; font-weight: bold">
                        PHẢN HỒI</a>
                </li>
                </c:if>
                <c:if test="${currentUser.userrole == 'Driver'}">
                <li class="nav-item">
                    <a class="nav-link text-info" href="<c:url value="/ad/driverdetails/list" />" style="margin-left: 40px; font-weight: bold">
                        PHÂN CÔNG</a>
                </li>
                </c:if>
                <c:if test="${currentUser.userrole == 'Admin'}">
                <li class="nav-item">
                    <a class="nav-link text-info" href="<c:url value="/admin" />" style="margin-left: 40px; font-weight: bold;">QUẢN TRỊ</a>
                </li>
                </c:if>
                <c:if test="${currentUser.userrole == 'Employee'}">
                <li class="nav-item">
                    <a class="nav-link text-info" href="<c:url value="/tickets/list" />" style="margin-left: 40px; font-weight: bold;">QUẢN LÝ VÉ</a>
                </li>
                </c:if>
                
                <li class="nav-item">
                    <a class="nav-link text-white" style="margin-left: 40px; font-weight: bold;" href="<c:url value="/news-page" />">TIN TỨC</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" style="margin-left: 40px; font-weight: bold;" href="<c:url value="/contact" />">LIÊN HỆ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" style="margin-left: 40px; font-weight: bold;" href="<c:url value="/about" />">VỀ CHÚNG TÔI</a>
                </li>
                
<!--                <li class="nav-item">
                    <a class="nav-link text-white" href="tel:0222.33.44.55"><i class="fas fa-phone-alt callNumber"></i> 0222.33.44.55</a>
                </li>-->
            </ul>
            <ul class="navbar-nav me-auto" style="margin-left: 40px"> 
                <!--    Khi đăng nhập thất bại hiện ra link login -->
<c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="<c:url value="/login" />" style="background-color: #c19b77; border-radius: 3px; font-weight: bold;">
                            ĐĂNG NHẬP
                        </a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px; font-weight: bold;">
                        <a class="nav-link text-secondary" href="<c:url value="/register" />">
                            ĐĂNG KÝ
                        </a>
                    </li>
                </c:if>
                    
                <!-- Ngược lại thì hiện ra logout và tên -->
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li class="nav-item">
                        <!--<a href="<c:url value="/"/>" class="nav-link text-info">-->
                        <c:if test="${currentUser.avatar != null}">
                            <!--<img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle" />-->

                            <div class="dropdown pb-2 nav-link text-info ">
                                <a href="#" class="d-flex align-items-center text-black text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="${currentUser.avatar}" width="30" height="30" class="rounded-circle">
                                    <span class="d-none d-sm-inline mx-1 text-white">${currentUser.name}</span>
                                </a>
                                <ul class="dropdown-menu text-small shadow">
                                    <li><a class="dropdown-item" href="<c:url value="/user-profile" />">Trang cá nhân</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="<c:url value="/info-ticket" />">Thông tin vé</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="<c:url value="/logout" />">Đăng xuất</a></li>
                                </ul>
                            </div>

                        </c:if>
                        <c:if test="${currentUser.avatar == null}">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </c:if> 
                       
                    </li>
                    
                </c:if>
            </ul>

        </div>
    </div>
</nav>