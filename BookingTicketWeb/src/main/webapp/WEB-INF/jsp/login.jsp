<%-- 
    Document   : login
    Created on : Aug 5, 2022, 8:59:41 AM
    Author     : dieuh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
</head>

<center>
    <h3 class="text-center" style="margin: 3px; color: black; font-weight: bold;font-size: 2.5rem ">ĐĂNG NHẬP</h3>
    <p style="color: #1c1c1d">Vui lòng điền đầy đủ thông tin đăng nhập của bạn!</p>

    <div class="container">
        <div class="z-depth-1 grey lighten-4 row" style="margin: 0; display: inline-block; padding: 10px 30px 0px 30px; border: 1px solid #EEE;">

            <c:if test="${param.error != null}">
                <c:choose>
                    <c:when test="${param.error == 'inactive'}">
                        <div class="alert alert-danger">Tài khoản của bạn bị khóa hoặc chưa được kích hoạt!</div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger">Đăng nhập không thành công!</div>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">Bạn không có quyền truy cập! Vui lòng quay lại sau!</div>
            </c:if>

            <c:url value="/login" var="action" />

            <form class="col s12" method="post" action="${action}">
                <div class='row'>
                    <div class='col s12'>
                    </div>
                </div>

                <div class='row'>
                    <div class='input-field col s12'>
                        <input class='validate' type='text' id="username" name ="username" />
                        <label for='username'>Tên đăng nhập <span class="asterisc">*</span></label>
                    </div>
                </div>

                <div class='row'>
                    <div class='input-field col s12'>
                        <input class='validate' type='password' id="password" name ="password" />
                        <label for='password'>Mật khẩu <span class="asterisc">*</span></label>
                    </div>
                    <label style="float: right;">
                        <c:url value="/register" var="action" />
                        <a class='pink-text' href='${action}'><b>Tạo tài khoản mới</b></a>
                    </label>
                </div>
                <center>
                    <div class='row'>
                        <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect text-white' style="background-color: #c19b77">
                            Đăng nhập</button>
                    </div>
                </center>
            </form>
        </div>
    </div>
</center>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
