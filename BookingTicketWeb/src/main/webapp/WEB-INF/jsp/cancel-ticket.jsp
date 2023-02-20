<%-- 
    Document   : cancel-ticket
    Created on : Feb 15, 2023, 11:12:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<c:if test="${errMsg != null}">
    <div class="form-group">
        <span class="form-message-login error text-danger">
            ${errMsg}
        </span>
    </div>
</c:if>
 <p>${d}</p>
<h2 class="text-center">XÁC NHẬN HỦY VÉ</h2>
<div style="width: 40%; margin: 0 auto">
    <c:url value="/info-ticket-confirm" var="confirm" />
    <form:form action="${confirm}" modelAttribute="cancel" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
        <div class="mb-3">
            <label class="form-label">Mã vé</label>
            <form:input type="text" class="form-control" path="id" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ghế</label>
            <form:input type="text" class="form-control" path="seatId.id" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Phương thức thanh toán</label>
            <form:input type="text" class="form-control" path="paymentmethod" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Tiền</label>
            <form:input type="text" class="form-control" path="totalprice" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày mua</label>
            <form:input type="text" class="form-control" name="cd" path="createddate" id="createddate" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Xe</label>
            <form:input type="text" class="form-control" path="passengercarId.id" readonly="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Chuyến xe</label>
            <form:input type="text" class="form-control" path="tripId.id" readonly="true"/>
        </div>
        <div>
            <input class="btn btn-info" type="submit" value="Xác nhận"/>
        </div>
        
    </form:form>
   
        
</div>
