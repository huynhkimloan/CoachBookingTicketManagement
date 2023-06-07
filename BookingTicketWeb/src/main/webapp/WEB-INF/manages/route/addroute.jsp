<%-- 
    Document   : addroutes
    Created on : Aug 11, 2022, 3:39:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h2 class="text-center text-secondary">THÊM TUYẾN XE</h2>
<c:url value="/admin/routes/saveroute" var="save" />
<form:form method="post" action="${save}" style="width: 70%; margin: 10px auto" modelAttribute="route" enctype="multipart/form-data" acceptCharset="UTF-8">
    <div class="mb-3">
        <label for="routename" class="form-label">Tên tuyến<span class="asterisc">*</span></label>
        <form:input type="text" class="form-control" path="routename" placeholder="Nhập tên tuyến..."/>
        <form:errors path="routename" cssClass="text-danger" element="div"/>
    </div>
    <div class="mb-3">
        <label for="startingpoint" class="form-label">Điểm đi<span class="asterisc">*</span></label>
        <form:input type="text" class="form-control" path="startingpoint" placeholder="Nhập điểm đi..."/>
        <form:errors path="startingpoint" cssClass="text-danger" element="div"/>
    </div>
    <div class="mb-3">
        <label for="destination" class="form-label">Điểm đến<span class="asterisc">*</span></label>
        <form:input type="text" class="form-control" path="destination" placeholder="Nhập điểm đến..."/>
        <form:errors path="destination" cssClass="text-danger" element="div"/>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Giá tiền<span class="asterisc">*</span></label>
        <form:input type="number" class="form-control" path="price" placeholder="Nhập giá tiền..."/>
        <form:errors path="price" cssClass="text-danger" element="div"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá đặc biệt</label>
        <form:input type="number" class="form-control" path="specialprice" placeholder="Nhập giá tiền..."/>
    </div>
    <div class="mb-3">
        <label class="form-label">Khoảng cách</label>
        <form:input type="number" class="form-control" path="stretch" placeholder="Nhập khoảng cách..."/>
    </div>
    <div class="mb-3">
        <label class="form-label">Thời gian</label>
        <form:input type="number" class="form-control" path="time" placeholder="Nhập thời gian..."/>
    </div>
    <div class="mb-3">
        <label class="form-label">Ảnh<span class="asterisc">*</span></label>
        <form:input type="file" class="form-control" path="file" placeholder="Chọn ảnh..."/>
    </div>
    <div>
        <input class="btn btn-success" type="submit" value="Thêm"/>

        <a href="<c:url value="/admin/routes/addroute" />" class="btn btn-info" style="margin-top: -13px;" type="button" data-toggle="tooltip" 
           data-placement="top" title="Quay lại"><i class="fas fa-undo"></i></a>

        <a href="<c:url value="/admin/routes/list" />" class="btn btn-secondary" style="margin-top: -13px;" type="button" data-toggle="tooltip" 
           data-placement="top" title="Danh sách"> <i class="fas fa-list"></i></a> 
    </div>
</form:form>



